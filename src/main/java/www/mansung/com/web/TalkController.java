package www.mansung.com.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/talk")
@Controller
public class TalkController {

	@RequestMapping("/")
	public ModelAndView getIndexView(ModelAndView mv) {
		
		mv.setViewName("/talk/index");
		return mv;
	}
	
	@RequestMapping("/write")
	public ModelAndView getWriteView(ModelAndView mv) {
		return mv;
	}
	
	@RequestMapping("/edit")
	public ModelAndView getEditView(ModelAndView mv) {
		return mv;
	}
	
	@RequestMapping("/comment")
	public ModelAndView getCommentView(ModelAndView mv) {
		return mv;
	}
}
