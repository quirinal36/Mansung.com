package www.mansung.com.web;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import www.mansung.com.security.AuthenticationFacade;
import www.mansung.com.service.FileInfoService;
import www.mansung.com.service.PhotoInfoService;
import www.mansung.com.service.UserService;
import www.mansung.com.vo.UserVO;

public class MansungController {
	protected final Logger logger = Logger.getLogger(this.getClass().getSimpleName());
	
	@Autowired
	protected AuthenticationFacade authenticationFacade;
	@Autowired
	protected AuthenticationManager authenticationManager;
	// 한영 번역시 프로퍼티파일을 불러오는 역할
	@Autowired
	protected MessageSource messageSource;
	@Autowired
	protected UserService userService;
	@Autowired
	protected PhotoInfoService photoInfoService;
	@Autowired
	protected FileInfoService fileInfoService;
	
	protected UserVO getUser() {
		String authUser = authenticationFacade.getAuthentication().getName();
		
		UserVO searchUser = new UserVO();
		searchUser.setLogin(authUser);
		UserVO user = userService.selectOne(searchUser);
		
		return user;
	}
	
	/**
	 * 로그인한 사용자
	 * @param request
	 * @return
	 */
	protected boolean isLoginedUser(HttpServletRequest request) {
		for(GrantedAuthority authority : SecurityContextHolder.getContext().getAuthentication().getAuthorities()) {
	        String userRole = authority.getAuthority();
		}
		boolean result = false;
		for(int i=1; i<UserVO.ROLES.length; i++) {
			if(request.isUserInRole(UserVO.ROLES[i])) {
				result = true;
				break;
			}
		}
		return result;
	}
	protected boolean isAdmin(HttpServletRequest request) {
		boolean result = false;
		result = request.isUserInRole(UserVO.ADMIN);
		return result;
	}
	
	/**
	 * 현재 사이트의 기본 URL 을 만드는 메소드
	 * 
	 * @param req
	 * @return
	 */
	protected String getBaseUrl(HttpServletRequest req) {
		return new StringBuilder().append(req.getScheme()).append("://").append(req.getServerName()).append(":")
				.append(req.getServerPort()) + req.getContextPath().toString();
	}
}
