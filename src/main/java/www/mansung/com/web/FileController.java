package www.mansung.com.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.imgscalr.Scalr;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import www.mansung.com.util.FileUtil;
import www.mansung.com.vo.FileInfo;
import www.mansung.com.vo.PhotoInfo;
import www.mansung.com.vo.UserVO;

@Controller
public class FileController extends MansungController {
	
	private String getImageUploadPath() {
		String srcPath = System.getProperty("catalina.home");
        File uploadDir = new File(srcPath + File.separator + "upload");
        if(!uploadDir.exists()) {
        	uploadDir.mkdirs();
        }
        
        return uploadDir.getAbsolutePath();
	}
	
	@ResponseBody
	@RequestMapping(value="/upload/file", method = {RequestMethod.GET, RequestMethod.POST})
	public Map uploadFile(MultipartHttpServletRequest request, 
    		HttpServletResponse response) {
		UserVO user = null;
		if(request.isUserInRole("ROLE_ADMIN") || request.isUserInRole("ROLE_USER")) {
			user = getUser();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		
		Iterator<String> itr = request.getFileNames();
        MultipartFile mpf;
        if (itr.hasNext()) {
            mpf = request.getFile(itr.next());
            String newFilenameBase = UUID.randomUUID().toString();
            String originalFileExtension = mpf.getOriginalFilename().substring(mpf.getOriginalFilename().lastIndexOf("."));
            String newFilename = newFilenameBase + originalFileExtension;
            String srcPath = new FileUtil().makeUserPath();
            //request.getSession().getServletContext().getRealPath("/upload");
			
			File newFile = new File(srcPath + "/" + newFilename);
            try {
                mpf.transferTo(newFile);
                FileInfo fileInfo = new FileInfo();
                if(user != null) {
                	fileInfo.setUploader(user.getId());
                }
                fileInfo.setName(mpf.getOriginalFilename());
                fileInfo.setNewFilename(newFilename);
                fileInfo.setSize((int)mpf.getSize());
                fileInfo.setContentType(mpf.getContentType());
                int result = fileInfoService.insert(fileInfo);
                fileInfo.setUrl("/upload/get/"+fileInfo.getId());
                map.put("url", fileInfo.getUrl());
                map.put("result", result);
                map.put("type", "file");
                map.put("file", fileInfo);
            }catch(IOException e) {
            	e.printStackTrace();
            	map.put("result", 0);
            }
        }
        
        return map;
	}
	
	@ResponseBody 
	@RequestMapping(value = "/upload/sized/image", method = {RequestMethod.POST})
    public Map uploadSizedImage(MultipartHttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		Iterator<String> itr = request.getFileNames();
        if (itr.hasNext()) {
        	MultipartFile mpf = request.getFile(itr.next());
        	PhotoInfo photo = PhotoInfo.newInstance(mpf);
        	
        	File newFile = new File(getImageUploadPath() + File.separator + photo.getNewFilename());
        	try {
				mpf.transferTo(newFile);
				File thumbnailFile = new FileUtil().resizeTo(newFile);
    			photo.setThumbnailFilename(thumbnailFile.getName());
    			photo.setThumbnailSize((int)thumbnailFile.length());
    			
    			int result = photoInfoService.insert(photo);
            	if(result > 0) {
            		photo.setUrl(getWebappDir(request) +"/picture/"+photo.getId());
                    photo.setThumbnailUrl(getWebappDir(request) + "/thumbnail/"+photo.getId());
                    
                    result = photoInfoService.update(photo);
            	}
            	
            	map.put("file", photo);
			} catch (IllegalStateException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
        }
		return map;
	}
	@ResponseBody 
	@RequestMapping(value = "/upload/image", method = {RequestMethod.POST})
    public Map uploadImage(MultipartHttpServletRequest request, 
    		HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		Iterator<String> itr = request.getFileNames();
        if (itr.hasNext()) {
        	MultipartFile mpf = request.getFile(itr.next());
            String newFilenameBase = UUID.randomUUID().toString();
            String originalFileExtension = mpf.getOriginalFilename().substring(mpf.getOriginalFilename().lastIndexOf("."));
            String newFilename = newFilenameBase + originalFileExtension;
			String contentType = mpf.getContentType();
			
			File newFile = new File(getImageUploadPath() + File.separator + newFilename);
			
            try {
                mpf.transferTo(newFile);
                
                File thumbnailFile = makeThumbnail(newFile, newFilenameBase, false);
                
                PhotoInfo photo = new PhotoInfo();
                photo.setName(mpf.getOriginalFilename());
                photo.setThumbnailFilename(thumbnailFile.getName());
                photo.setNewFilename(newFilename);
                photo.setSize((int)mpf.getSize());
                photo.setThumbnailSize((int)thumbnailFile.length());
                photo.setContentType(contentType);
                
                int result = photoInfoService.insert(photo);
                photo.setUrl(getWebappDir(request) +"/picture/"+photo.getId());
                photo.setThumbnailUrl(getWebappDir(request) + "/thumbnail/"+photo.getId());
                
                result = photoInfoService.update(photo);
                
                map.put("url", photo.getUrl());
                //map.put("result", result);
                map.put("type", "image");
                map.put("file", photo);
            } catch(IOException e) {
                logger.info("Could not upload file " + e.getLocalizedMessage());
                map.put("result", 0);
            }
        }
        return map;
	}
	private File makeThumbnail(File originFile, String newFilenameBase, boolean isResize)throws IOException{
		// 저장된 원본파일로부터 BufferedImage 객체를 생성합니다.
		// File originFile = new File(filePath);
		BufferedImage srcImg = ImageIO.read(originFile); 
		// 썸네일의 너비와 높이 입니다. 
		int dw = 400, dh = 225;
		
		// 원본 이미지의 너비와 높이 입니다. 
		int ow = srcImg.getWidth(); 
		int oh = srcImg.getHeight();
		
		// 원본 너비를 기준으로 하여 썸네일의 비율로 높이를 계산합니다. 
		int nw = ow; 
		int nh = (ow * dh) / dw;
		
		// 계산된 높이가 원본보다 높다면 crop이 안되므로 
		// 원본 높이를 기준으로 썸네일의 비율로 너비를 계산합니다. 
		if(nh > oh) { 
			nw = (oh * dw) / dh; 
			nh = oh; 
		}
		
		// 계산된 크기로 원본이미지를 가운데에서 crop 합니다. 
		File thumbnailFile;
		if(isResize) {
			BufferedImage cropImg = Scalr.crop(srcImg, (ow-nw)/2, (oh-nh)/2, nw, nh);
			
			BufferedImage thumbnail = Scalr.resize(cropImg, dw, dh);
	        String thumbnailFilename = newFilenameBase + "-thumbnail.png";
	        thumbnailFile = new File(originFile.getParent() + "/" + thumbnailFilename);
	        ImageIO.write(thumbnail, "png", thumbnailFile);
		}else {
			BufferedImage thumbnail = Scalr.resize(srcImg, ow/2, oh/2);
	        String thumbnailFilename = newFilenameBase + "-thumbnail.png";
	        thumbnailFile = new File(originFile.getParent() + "/" + thumbnailFilename);
	        ImageIO.write(thumbnail, "png", thumbnailFile);
		}
        
        return thumbnailFile;
        
	}
	private String getWebappDir(HttpServletRequest request) {
		return request.getContextPath();
	}
	@RequestMapping(value = "/picture/{id}", method = RequestMethod.GET)
    public void picture(HttpServletRequest request,
    		HttpServletResponse response, @PathVariable int id) {
		PhotoInfo param = new PhotoInfo();
		param.setId(id);

        PhotoInfo image = photoInfoService.selectOne(param);
        // String srcPath = new FileUtil().makeUserPath();
        // request.getSession().getServletContext().getRealPath("/upload");
        File imageFile = new File(getImageUploadPath()+File.separator+image.getNewFilename());
        
        response.setContentType(image.getContentType());
        response.setContentLength(image.getSize());
        try {
            InputStream is = new FileInputStream(imageFile);
            IOUtils.copy(is, response.getOutputStream());
        } catch(IOException e) {
            logger.info("Could not show picture "+id +"/" + e.getLocalizedMessage());
        }
    }
	@RequestMapping(value = "/thumbnail/{id}", method = RequestMethod.GET)
    public void thumbnail(HttpServletRequest request,
    		HttpServletResponse response, @PathVariable int id) {
		PhotoInfo param = new PhotoInfo();
		param.setId(id);
		// String srcPath = new FileUtil().makeUserPath(); 
		//request.getSession().getServletContext().getRealPath("/upload");
		
		PhotoInfo image = photoInfoService.selectOne(param);
        File imageFile = new File(getImageUploadPath()+File.separator+image.getThumbnailFilename());
        response.setContentType(image.getContentType());
        response.setContentLength(image.getThumbnailSize());
		
        try {
            InputStream is = new FileInputStream(imageFile);
            IOUtils.copy(is, response.getOutputStream());
        } catch(IOException e) {
            logger.info("Could not show picture "+id +"/" + e.getLocalizedMessage());
        }
    }
	
	@ResponseBody
	@RequestMapping(value="/upload/delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String deleteImage(PhotoInfo photo) {
		PhotoInfo photoInfo = photoInfoService.selectOne(photo);
		File photoFile = new File(getImageUploadPath() + File.separator + photoInfo.getNewFilename());
		File thumbnailFile = new File(getImageUploadPath() + File.separator + photoInfo.getThumbnailFilename());
		if(photoFile.exists()) {
			photoFile.delete();
		}
		if(thumbnailFile.exists()) {
			thumbnailFile.delete();
		}
		
		JSONObject json = new JSONObject();
		int result = photoInfoService.delete(photo);
		json.put("result", result);
		return json.toString();
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete/{which}/{id}", method = RequestMethod.POST)
	public String deleteFile(@PathVariable(value="id", required=true) Integer id,
			@PathVariable(value="which", required = true)String which) {
		JSONObject json = new JSONObject();
		String srcPath = new FileUtil().makeUserPath();
		
		if(which.equalsIgnoreCase("img")) {
			PhotoInfo photoInfo = new PhotoInfo();
			photoInfo.setId(id);
			photoInfo = photoInfoService.selectOne(photoInfo);
			
			int result = photoInfoService.delete(photoInfo);
			File targetFile = new File(srcPath + File.separator + photoInfo.getNewFilename());
			if(targetFile.exists()) {
				targetFile.delete();
			}
		}else if(which.equalsIgnoreCase("file")){
			FileInfo fileInfo = new FileInfo();
			fileInfo.setId(id);
			fileInfo = fileInfoService.selectOne(fileInfo);
			
			int result = fileInfoService.delete(fileInfo);
			File targetFile = new File(srcPath + File.separator + fileInfo.getNewFilename());
			if(targetFile.exists()) {
				targetFile.delete();
			}
		}
		return json.toString();
	}
	
	/***************************************************
	 * URL: /upload/get/{value}
	 * get(): get file as an attachment
	 * @param response : passed by the server
	 * @param value : value from the URL
	 * @return void
	 * @throws UnsupportedEncodingException 
	 ****************************************************/
	@RequestMapping(value = "/upload/get/{value}", method = RequestMethod.GET)
	public void get(HttpServletResponse response, @PathVariable String value,
			HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8"); // 한글파일 깨지지 않게
		FileInfo fileInfo = new FileInfo();
		fileInfo.setId(Integer.parseInt(value));
		fileInfo = fileInfoService.selectOne(fileInfo);
		try {      
			response.setContentType(fileInfo.getContentType());
			response.setContentLength(fileInfo.getSize());
			response.setHeader("Content-disposition", "attachment; charset=UTF-8; filename=\""+URLEncoder.encode(fileInfo.getName(), "UTF-8")+"\"");
			
			String srcPath = new FileUtil().makeUserPath(); // request.getSession().getServletContext().getRealPath("/upload");
			
			InputStream is = new FileInputStream(new File(srcPath +File.separator + fileInfo.getNewFilename()));
			FileCopyUtils.copy(is, response.getOutputStream());
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
}
