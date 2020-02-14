package www.mansung.com.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import www.mansung.com.vo.FileInfo;
import www.mansung.com.vo.PhotoInfo;

public class FileUtil {
	final Logger logger = LoggerFactory.getLogger(getClass());
	/**
	 * 파일을 저장할 디렉터리 가져오기
	 * 
	 * @param userId
	 * @return
	 */
	public String makeUserPath() {
		String path = System.getProperty("user.dir");
		
		StringBuilder builder = new StringBuilder()
				.append(path).append(File.separator).append("tomcat")
				.append(File.separator).append("webapps").append(File.separator)
				.append("repository").append(File.separator)
				.append("upload").append(File.separator);
		
		File file = new File(builder.toString());
		file.mkdirs();
		
		final String result = file.getAbsolutePath();
		return result;
	}
	
	public List<PhotoInfo> parsePhotoInfo(String[] input, int boardId) throws NumberFormatException{
		List<PhotoInfo> photoList = new ArrayList<PhotoInfo>();
		if(input.length>0) {
			for(String pictureId : input) {
				PhotoInfo photoInfo = new PhotoInfo();
				photoInfo.setId(Integer.parseInt(pictureId));
				photoInfo.setBoardId(boardId);
				photoList.add(photoInfo);
			}
		}
		return photoList;
	}
	
	public List<FileInfo> parseFileInfo(String[] input, int boardId) {
		List<FileInfo> fileList = new ArrayList<FileInfo>();
		for(String fileId : input) {
			FileInfo photoInfo = new FileInfo();
			photoInfo.setId(Integer.parseInt(fileId));
			photoInfo.setBoardId(boardId);
			fileList.add(photoInfo);
		}
		return fileList;
	}
	
	public File resizeTo(File input) throws IOException {
		logger.info(input.getAbsolutePath());
		
		final String ext = input.getName().substring(input.getName().lastIndexOf(".") + 1);
		
		// 저장된 원본파일로부터 BufferedImage 객체를 생성합니다.
		// File originFile = new File(filePath);
		BufferedImage srcImg = ImageIO.read(input); 

		// 썸네일의 너비와 높이 입니다.
		final int dw = 400;
		final int dh = 225;
		
		// 원본 이미지의 너비와 높이 입니다. 
		final int ow = srcImg.getWidth(); 
		final int oh = srcImg.getHeight();
		
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
		BufferedImage cropImg = Scalr.crop(srcImg, (ow-nw)/2, (oh-nh)/2, nw, nh);

		BufferedImage destImg = Scalr.resize(cropImg, dw, dh);

		String destFilename = new StringBuilder()
								.append(input.getName().substring(0, input.getName().lastIndexOf(".")))
								.append("-thumbnail")
								.append(input.getName().substring(input.getName().lastIndexOf(".")))
								.toString();
		
		File destFile = new File(input.getParent() + File.separator + destFilename);
		ImageIO.write(destImg, ext, destFile);		
		
		return destFile;
	}
	public void fileCopy(File inFile, File outFile) {
		try {
			FileInputStream fis = new FileInputStream(inFile);
			FileOutputStream fos = new FileOutputStream(outFile);

			int data = 0;
			while((data=fis.read())!=-1) {
				fos.write(data);
			}
			fis.close();
			fos.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
