package www.mansung.com.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import www.mansung.com.Config;
import www.mansung.com.vo.KakaoLogin;

@Controller
public class MemberController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value="/member/login")
	public ModelAndView getLoginView(ModelAndView mv) throws IOException {
		File file = ResourceUtils.getFile("classpath:kakao.env");
		String apiKey = FileUtils.readFileToString(file, Config.ENCODING);
		
		mv.addObject("apiKey", apiKey);
		mv.setViewName("/member/login");
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/member/signup", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public String postSignupView(@RequestBody KakaoLogin result) throws IOException {
		File file = ResourceUtils.getFile("classpath:kakao.env");
		String apiKey = FileUtils.readFileToString(file, Config.ENCODING);
		
		logger.info(result.toString());
		final String url = new StringBuilder().append("https://kapi.kakao.com/v2/user/me").toString();
		
		return result.toString();
	}
	
	@RequestMapping(value="/member/signup", method=RequestMethod.GET)
	public ModelAndView getSignupView(ModelAndView mv) {
		mv.setViewName("/member/signup");
		
		return mv;
	}
}
