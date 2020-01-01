package www.mansung.com.web;

import java.util.List;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import www.mansung.com.service.StoreInfoService;
import www.mansung.com.vo.StoreInfo;

/**
 * 관리자 페이지
 * 
 * @author turbo
 *
 */
@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@Autowired
	private StoreInfoService service;
	
	private Logger logger = LoggerFactory.getLogger(getClass());			
	
	@RequestMapping(value="/store/add", method = RequestMethod.GET)
	public ModelAndView getStoreAddFormView(ModelAndView mv) {
		
		mv.setViewName("/admin/store/add");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/store/add", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String postStoreAdd(StoreInfo info) {
		logger.info(info.toString());
		
		JSONObject json = new JSONObject(); 
		
		int result = service.insert(info);
		json.put("result", result);
		
		return json.toString();
	}
	
	@RequestMapping(value= {"/store", "/store/list"}, method = RequestMethod.GET)
	public ModelAndView getStoreListFormView(ModelAndView mv) {
		List<StoreInfo> list = service.select();
		mv.addObject("list", list);
		
		mv.setViewName("/admin/store/list");
		return mv;
	}
	@RequestMapping(value="/store/view/{id}", method = RequestMethod.GET)
	public ModelAndView getStoreDetailView(ModelAndView mv,
			@PathVariable(value="id", required = true)Integer id) {
		StoreInfo store = service.selectOne(StoreInfo.newInstance(id));
		mv.addObject("store", store);
		
		mv.setViewName("/admin/store/view");
		return mv;
	}
	@RequestMapping(value="/store/edit/{id}", method = RequestMethod.GET)
	public ModelAndView getStoreEditFormView(ModelAndView mv,
			@PathVariable(value="id", required = true)Integer id) {
		StoreInfo store = service.selectOne(StoreInfo.newInstance(id));
		mv.addObject("store", store);
		
		mv.setViewName("/admin/store/edit");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/store/edit", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String postStoreEdit(StoreInfo info) {
		JSONObject json = new JSONObject(); 
		
		int result = service.update(info);
		json.put("result", result);
		
		return json.toString();
	}
}
