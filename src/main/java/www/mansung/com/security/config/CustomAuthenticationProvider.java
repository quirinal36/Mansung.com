   package www.mansung.com.security.config;

import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

/**
 * 
 * @author Lee
 *
 */
@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
	@Autowired
	UserDetailService userService;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = authentication.getName();
		
		UserDetails user = null;
		Collection<? extends GrantedAuthority> authorities = null;
		
		try {
			user = userService.loadUserByUsername(username);
			
			if(user != null) {
				authorities = user.getAuthorities();
			}else {
				throw new UsernameNotFoundException("존재하지 않는 아이디입니다.");
			}
		}catch(UsernameNotFoundException e) {
			logger.info(e.toString());
			throw new UsernameNotFoundException(e.getMessage());
		}catch(BadCredentialsException e) {
			logger.info(e.toString());
			throw new BadCredentialsException(e.getMessage());
		}catch(Exception e) {
			logger.info(e.toString());
			throw new RuntimeException(e.getMessage());
		}
		return new UsernamePasswordAuthenticationToken(user, null, authorities);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

}
