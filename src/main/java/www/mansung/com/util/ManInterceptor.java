package www.mansung.com.util;

import java.util.Iterator;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class ManInterceptor implements HandlerInterceptor{
	Logger logger = Logger.getLogger(getClass().getSimpleName());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Map<String, String[]> parameters = request.getParameterMap();
		Iterator<String> keys = parameters.keySet().iterator();
		while(keys.hasNext()) {
			final String key = keys.next();
			for(String value : parameters.get(key)) {
				logger.info("key : "+key + "|" + "value : "+value);
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mv) throws Exception {
		mv.addObject("logo1", "");
		mv.addObject("logo2", "_off");
		
		final String talk = "talk";
		
		String path = request.getRequestURL().toString();
		
		final String jspDir = "/WEB-INF/views/";
		int split = path.indexOf(jspDir);
		if(split > 0) {
			path = path.substring(split);
			path = path.replaceAll(jspDir, "");
			
			if(!(path.indexOf("/") < 0)) {
				// 첫번째 디렉터리
				try {
					String firstDir = path.substring(1, path.indexOf('/', 1));
					
					if(firstDir.equals(talk)) {
						mv.addObject("logo1", "_off");
						mv.addObject("logo2", "");
					}
				}catch(Exception e) {
					
				}
			}
		}
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
