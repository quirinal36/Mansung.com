package www.mansung.com.web;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import www.mansung.com.Config;
import www.mansung.com.service.UserService;
import www.mansung.com.util.RestUtil;
import www.mansung.com.vo.KakaoLogin;
import www.mansung.com.vo.StoreInfo;
import www.mansung.com.vo.UserVO;

@RequestMapping("/inc")
@Controller
public class IncController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	UserService userService;
	
	@Autowired
	AuthenticationManager authenticationManager;
	
	@RequestMapping(value="/header", method=RequestMethod.GET)
	public ModelAndView getHeader(ModelAndView mv, HttpSession session, StoreInfo store) throws IOException {
		File file = ResourceUtils.getFile("classpath:kakao.env");
		String apiKey = FileUtils.readFileToString(file, Config.ENCODING);
		mv.addObject("apiKey", apiKey);

		String accessToken = (String)session.getAttribute("access_token");
		if(accessToken != null && accessToken.length()>0) {
			RestUtil util = new RestUtil();
			
			JSONObject response = util.post("v2/user/me", accessToken);
			
			if(response != null) {
				JSONObject accountObj = response.getJSONObject("kakao_account");
				JSONObject profileObj = accountObj.getJSONObject("profile");
				UserVO user = new UserVO();
				if(accountObj.has("email")) {
					user.setEmail(accountObj.getString("email"));
				}
				user.setNickname(profileObj.getString("nickname"));
				user.setThumbnail_image_url(profileObj.getString("thumbnail_image_url"));
				mv.addObject("user", user);
			}
		}
		mv.addObject("store", store);
		mv.setViewName("/inc/header");
		return mv;
	}
	
	@RequestMapping(value="/footer", method=RequestMethod.GET)
	public ModelAndView getFooter(ModelAndView mv) throws IOException {
		mv.setViewName("/inc/footer");
		File file = ResourceUtils.getFile("classpath:kakao.env");
		String apiKey = FileUtils.readFileToString(file, Config.ENCODING);
		mv.addObject("apiKey", apiKey);
		return mv;
	}
	@RequestMapping(value="/head", method=RequestMethod.GET)
	public ModelAndView getHead(ModelAndView mv) {
		mv.setViewName("/inc/head");
		return mv;
	}
	@RequestMapping(value="/selectMap", method=RequestMethod.GET)
	public ModelAndView getMap(ModelAndView mv) {
		mv.setViewName("/inc/selectMap");
		return mv;
	}
	@RequestMapping(value="/selectShare", method=RequestMethod.GET)
	public ModelAndView getShare(ModelAndView mv) {
		mv.setViewName("/inc/selectShare");
		return mv;
	}
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public ModelAndView getLoginView(ModelAndView mv, HttpSession session) throws IOException {
		String accessToken = (String)session.getAttribute("access_token");
		
		if(accessToken != null && accessToken.length()>0) {
			RestUtil util = new RestUtil();
			JSONObject response = util.post("v2/user/me", accessToken);
			if(response != null) {
				JSONObject accountObj = response.getJSONObject("kakao_account");
//				JSONObject profileObj = accountObj.getJSONObject("profile");
				UserVO user = new UserVO();
				user.setKakaoId(String.valueOf(response.getInt("id")));
				
				if(accountObj.has("email")) {
					user.setEmail(accountObj.getString("email"));
				}
				
				mv.setViewName("redirect:/");
			}
		}else {
			File file = ResourceUtils.getFile("classpath:kakao.env");
			String apiKey = FileUtils.readFileToString(file, Config.ENCODING);
			mv.addObject("apiKey", apiKey);
			mv.setViewName("/inc/login");
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String postSignupView(@RequestBody KakaoLogin kakao, HttpServletRequest request,
			HttpSession session) throws IOException {
		session.setAttribute("access_token", kakao.getAccess_token());
		
		RestUtil util = new RestUtil();
		
		JSONObject response = util.post("v2/user/me", kakao.getAccess_token());
		JSONObject accountObj = response.getJSONObject("kakao_account");
		
		JSONObject profileObj = accountObj.getJSONObject("profile");
		UserVO user = new UserVO();
		user.setKakaoId(String.valueOf(response.getInt("id")));
		if(accountObj.has("email")) {
			user.setEmail(accountObj.getString("email"));
		}
		user.setNickname(profileObj.getString("nickname"));
		user.setThumbnail_image_url(profileObj.getString("thumbnail_image_url"));
		user.setProfile_image_url(profileObj.getString("profile_image_url"));

		UserVO selectUser = userService.selectOne(user);
		if(selectUser != null) {
			login(selectUser.getKakaoId(), "", request);
			return selectUser.toString();
		}else {
			userService.insert(user);
			login(user.getKakaoId(), "", request);
			return user.toString();
		}
	}
	private void login(String login, String inputPwd, HttpServletRequest request) {
		UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(login, inputPwd);
		authToken.setDetails(new WebAuthenticationDetails(request));
		Authentication authentication = authenticationManager.authenticate(authToken);
		SecurityContextHolder.getContext().setAuthentication(authentication);
	}
}
