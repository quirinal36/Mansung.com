package www.mansung.com.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IncController {

	@RequestMapping(value="/inc/header", method=RequestMethod.GET)
	public ModelAndView getHeader(ModelAndView mv) {
		mv.setViewName("/inc/header");
		return mv;
	}
	@RequestMapping(value="/inc/footer", method=RequestMethod.GET)
	public ModelAndView getFooter(ModelAndView mv) {
		mv.setViewName("/inc/footer");
		return mv;
	}
	@RequestMapping(value="/inc/head", method=RequestMethod.GET)
	public ModelAndView getHead(ModelAndView mv) {
		mv.setViewName("/inc/head");
		return mv;
	}
	@RequestMapping(value="/inc/selectMap", method=RequestMethod.GET)
	public ModelAndView getMap(ModelAndView mv) {
		mv.setViewName("/inc/selectMap");
		return mv;
	}
	@RequestMapping(value="/inc/selectShare", method=RequestMethod.GET)
	public ModelAndView getShare(ModelAndView mv) {
		mv.setViewName("/inc/selectShare");
		return mv;
	}
}
