package www.mansung.com.web;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import www.mansung.com.Config;
import www.mansung.com.service.StoreInfoService;
import www.mansung.com.vo.StoreInfo;

@Controller
@RequestMapping(value="/store")
public class StoreController {
	@Autowired
	private StoreInfoService service;
	
	@RequestMapping(value="/view/{id}", method = RequestMethod.GET)
	public ModelAndView getDetailView(ModelAndView mv,
			@PathVariable(value="id", required = true)Integer id) throws IOException {
		File file = ResourceUtils.getFile("classpath:kakao.env");
		String apiKey = FileUtils.readFileToString(file, Config.ENCODING);
		mv.addObject("apiKey", apiKey);
		
		mv.addObject("store", service.selectOne(StoreInfo.newInstance(id)));
		
		mv.setViewName("/store/view");
		return mv;
	}
}
