package www.mansung.com.vo;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.UUID;

import org.apache.commons.fileupload.FileUpload;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import www.mansung.com.util.FileUtil;

@Getter
@Setter
@ToString
public class PhotoInfo implements Cloneable{
	public static PhotoInfo newInstance(int boardId) {
		PhotoInfo result = new PhotoInfo();
		result.setBoardId(boardId);
		return result;
	}
	public static PhotoInfo newInstance(MultipartFile mpf) {
		PhotoInfo result = new PhotoInfo();
		
		String newFilenameBase = UUID.randomUUID().toString();
        String originalFileExtension = mpf.getOriginalFilename().substring(mpf.getOriginalFilename().lastIndexOf("."));
        String newFilename = newFilenameBase + originalFileExtension;
		String contentType = mpf.getContentType();
		
		result.setName(mpf.getOriginalFilename());
		result.setNewFilename(newFilename);
		result.setSize((int)mpf.getSize());
		result.setContentType(contentType);
        
		return result;
	}
	
	private static String getImageUploadPath() {
		String srcPath = System.getProperty("catalina.home");
        File uploadDir = new File(srcPath + File.separator + "upload");
        if(!uploadDir.exists()) {
        	uploadDir.mkdirs();
        }
        
        return uploadDir.getAbsolutePath();
	}
	
	int id;
	int uploader;
	Date wdate;
	String url;
	String name;
	String thumbnailFilename;
	String newFilename;
	int size;
	int thumbnailSize;
	String thumbnailUrl;
	String contentType;
	String search;
	int orderById;
	int boardId;
	
	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
}