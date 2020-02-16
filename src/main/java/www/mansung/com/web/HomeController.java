package www.mansung.com.web;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import www.mansung.com.dao.BoardDAO;
import www.mansung.com.service.BoardService;
import www.mansung.com.service.CategoryService;
import www.mansung.com.service.StoreInfoService;
import www.mansung.com.vo.Board;
import www.mansung.com.vo.Category;
import www.mansung.com.vo.StoreInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private StoreInfoService storeService;
	@Autowired
	private CategoryService categoryService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
	public ModelAndView home(Locale locale, ModelAndView mv,
			HttpServletRequest req, Authentication authentication,
			StoreInfo storeInfo) {
		storeInfo.setPageNo(1);
		storeInfo.setTotalCount(storeService.count(storeInfo));		
		List<StoreInfo> list = storeService.select(storeInfo);
		
		mv.addObject("list", list);
		List<Category> cateList = categoryService.select();
		
		mv.addObject("cateList", cateList);
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping(value="/about", method = RequestMethod.GET)
	public ModelAndView getAboutView(ModelAndView mv) {
		mv.setViewName("/contents/about");
		return mv;
	}
	@RequestMapping(value="/guide", method = RequestMethod.GET)
	public ModelAndView getGuideView(ModelAndView mv) {
		mv.setViewName("/contents/guide");
		return mv;
	}
	@RequestMapping(value="/terms", method = RequestMethod.GET)
	public ModelAndView getTermsView(ModelAndView mv) {
		mv.setViewName("/contents/terms");
		return mv;
	}
	@RequestMapping(value="/privacy", method = RequestMethod.GET)
	public ModelAndView getPrivacyView(ModelAndView mv) {
		mv.setViewName("/contents/privacy");
		return mv;
	}
}
