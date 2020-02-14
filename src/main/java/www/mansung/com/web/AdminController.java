package www.mansung.com.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import www.mansung.com.service.CategoryService;
import www.mansung.com.service.HashTagService;
import www.mansung.com.service.PhotoInfoService;
import www.mansung.com.service.StoreBannerService;
import www.mansung.com.service.StoreInfoService;
import www.mansung.com.vo.StoreBanner;
import www.mansung.com.vo.Category;
import www.mansung.com.vo.HashTag;
import www.mansung.com.vo.PhotoInfo;
import www.mansung.com.vo.StoreHash;
import www.mansung.com.vo.StoreInfo;

/**
 * 愿�由ъ옄 �럹�씠吏�
 * 
 * @author turbo
 *
 */
@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@Autowired
	private StoreInfoService service;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	protected PhotoInfoService photoInfoService;
	@Autowired
	private HashTagService hashTagService;
	@Autowired
	private StoreBannerService bannerService;
	
	private Logger logger = LoggerFactory.getLogger(getClass());			
	
	@RequestMapping(value="/store/add", method = RequestMethod.GET)
	public ModelAndView getStoreAddFormView(ModelAndView mv) {
		List<Category> cateList = categoryService.select();
		
		mv.addObject("cateList", cateList);
		mv.setViewName("/admin/store/add");
		return mv;
	}
	private int updateHashTags(List<Integer> tagIds, StoreInfo info) {		
		int result = 0;
		List<StoreHash> existTags = hashTagService.selectByStoreId(info);
		if(existTags!=null && existTags.size()>0) {
			Map<Integer, StoreHash> existMap = existTags.stream().collect(Collectors.toMap(StoreHash::getHashId, storeHash->storeHash));
			List<StoreHash> deleteList = new ArrayList<StoreHash>();
			List<StoreHash> insertList = new ArrayList<StoreHash>();
			//List<StoreHash> hashTags = new ArrayList<StoreHash>();
			for(Integer tag: tagIds) {
				// 이미 있으면 deleteList에 추가 -> 추후 남은것들만 삭제할것
				// 없으면 insert
				if(existMap.containsKey(tag)) {
					deleteList.add(existMap.get(tag));
				}else {
					insertList.add(StoreHash.newInstance(tag, info.getId()));
				}
			}
			// insert, delete 작업
			if(insertList.size() > 0) {
				result = hashTagService.mappingTags(insertList);
			}
			if(deleteList.size() > 0) {
				result = hashTagService.deleteList(deleteList);
			}
		}else {
			mappingHashTags(tagIds, info);
		}
		return result;
	}
	private int mappingHashTags(List<Integer> tagIds, StoreInfo info) {		
		int result = 0;
		List<StoreHash> hashTags = new ArrayList<StoreHash>();
		for(Integer tag: tagIds) {
			hashTags.add(StoreHash.newInstance(tag, info.getId()));
		}
		if(hashTags.size() > 0) {
			result = hashTagService.mappingTags(hashTags);
		}
		return result;
	}
	private int insertBanners(StoreInfo info) {
		StoreBanner banner = StoreBanner.newInstance(info.getId());
		banner.setBannerColor(info.getBannerColor());
		banner.setBannerText(info.getBannerText());
		int result = bannerService.insert(banner);
		return result;
	}
	@ResponseBody
	@RequestMapping(value="/store/add", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String postStoreAdd(StoreInfo info, @RequestParam(value="tagId", required = false)List<Integer>tagIds) {
		int result = service.insert(info);
		if(info.getId() > 0) {
			if(tagIds != null && tagIds.size() > 0) {
				mappingHashTags(tagIds, info);
			}
			if(info.getBannerColor() > 0) {
				insertBanners(info);
			}
		}
		
		JSONObject json = new JSONObject();
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
		
		List<HashTag> tags = hashTagService.select(store);
		mv.addObject("tags", tags);
		
		if(store.getWideBanner() > 0) {
			PhotoInfo photoInfo = new PhotoInfo();
			photoInfo.setId(store.getWideBanner());
			PhotoInfo wideBanner = photoInfoService.selectOne(photoInfo);
			mv.addObject("wideBanner", wideBanner);
		}
		
		mv.setViewName("/admin/store/view");
		return mv;
	}
	@RequestMapping(value="/store/edit/{id}", method = RequestMethod.GET)
	public ModelAndView getStoreEditFormView(ModelAndView mv,
			@PathVariable(value="id", required = true)Integer id) {
		List<Category> cateList = categoryService.select();
		mv.addObject("cateList", cateList);
		
		StoreInfo store = service.selectOne(StoreInfo.newInstance(id));
		mv.addObject("store", store);
		
		List<HashTag> tags = hashTagService.select(store);
		mv.addObject("tags", tags);
		
		mv.setViewName("/admin/store/edit");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/store/edit", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String postStoreEdit(StoreInfo info, @RequestParam(value="tagId")List<Integer>tagIds) {
		JSONObject json = new JSONObject(); 
		
		int result = service.update(info);
		
		updateHashTags(tagIds, info);
		
		StoreBanner banner = StoreBanner.newInstance(info.getId());
		banner.setBannerColor(info.getBannerColor());
		banner.setBannerText(info.getBannerText());
		
		StoreBanner existBanner = bannerService.selectOne(banner);
		if(existBanner != null && existBanner.getId()>0) {
			bannerService.update(banner);
		}else {
			bannerService.insert(banner);
		}
		
		json.put("result", result);
		
		return json.toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/store/tag", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String storeTag(@RequestParam(value="tagName")String tagName) {
		HashTag hashTag = new HashTag();
		hashTag.setName(tagName);
		
		HashTag selectTag = hashTagService.selectOne(hashTag);
		if(selectTag == null || selectTag.getId() == 0) {
			int result = hashTagService.insert(hashTag);
			return hashTag.toString();
		}else {
			return selectTag.toString();
		}		
	}
	
	@ResponseBody
	@RequestMapping(value="/store/tag/delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String removeStoreHash(StoreHash item) {
		int result = hashTagService.delete(item);
		JSONObject json = new JSONObject();
		json.put("result", result);
		return json.toString();
	}
}
