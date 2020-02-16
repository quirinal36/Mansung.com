package www.mansung.com.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Optional;

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
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import www.mansung.com.Config;
import www.mansung.com.service.UserService;
import www.mansung.com.util.RestUtil;
import www.mansung.com.vo.KakaoLogin;
import www.mansung.com.vo.UserVO;

@RequestMapping(value="/member")
@Controller
public class MemberController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	UserService userService;
	@Autowired
	AuthenticationManager authenticationManager;
	
	@RequestMapping(value="/login")
	public ModelAndView getLoginView(ModelAndView mv, HttpServletRequest request, HttpSession session) throws IOException {
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
			mv.setViewName("/member/login");
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
		logger.info(response.toString());
		JSONObject accountObj = response.getJSONObject("kakao_account");
		logger.info(accountObj.toString());
		
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
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public ModelAndView getSignupView(ModelAndView mv, HttpSession session) throws IOException {
		String accessToken = (String)session.getAttribute("access_token");
		
		if(accessToken != null && accessToken.length()>0) {
			RestUtil util = new RestUtil();
			
			JSONObject response = util.post("v2/user/me", accessToken);
			if(response != null) {
				logger.info(response.toString());
				
				JSONObject accountObj = response.getJSONObject("kakao_account");
				JSONObject profileObj = accountObj.getJSONObject("profile");
				UserVO user = new UserVO();
				user.setNickname(profileObj.getString("nickname"));
				if(response.has("id")) {
					user.setKakaoId(String.valueOf(response.getInt("id")));
				}
				if(accountObj.has("email")) {
					user.setEmail(accountObj.getString("email"));
				}
				user = userService.selectOne(user);
				
				user.setThumbnail_image_url(profileObj.getString("thumbnail_image_url"));
				user.setProfile_image_url(profileObj.getString("profile_image_url"));

				mv.addObject("user", user);
			}
		}
		mv.setViewName("/member/signup");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String postEdit(UserVO user) throws IOException {
		int result = userService.update(user);
		
		JSONObject json = new JSONObject();
		json.put("result", result);
		
		return json.toString();
	}
	private void login(String login, String inputPwd, HttpServletRequest request) {
		UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(login, inputPwd);
		authToken.setDetails(new WebAuthenticationDetails(request));
		Authentication authentication = authenticationManager.authenticate(authToken);
		SecurityContextHolder.getContext().setAuthentication(authentication);
	}
	
	@RequestMapping(value="/agree", method = RequestMethod.GET)
	public ModelAndView getMemberAgreeView(ModelAndView mv) {
		mv.setViewName("/member/agree");
		return mv;
	}
	@RequestMapping(value="/edit", method = RequestMethod.GET)
	public ModelAndView getMemberEditView(ModelAndView mv) {
		mv.setViewName("/member/edit");
		return mv;
	}
	@RequestMapping(value="/profile", method = RequestMethod.GET)
	public ModelAndView getMemberProfileView(ModelAndView mv) {
		mv.setViewName("/member/profile");
		return mv;
	}
	
}
