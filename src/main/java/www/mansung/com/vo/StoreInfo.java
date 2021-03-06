package www.mansung.com.vo;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.format.annotation.NumberFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class StoreInfo extends Paging{
	int id;
	String title;
	String titleLocal;
	String address1;
	String address2;
	String address3;
	String address4;
	String address5;
	String address6;
	String postcode;
	String xPosition;
	String yPosition;
	String phone1;
	String phone2;
	String information;
	String website;
	String blog;
	String time;
	int representImage;
	String representImageUrl;
	Date wdate;
	Date udate;
	int category;
	String categoryTitle;
	int wideBanner;
	String wideBannerUrl;
	List<HashTag> hashTag;
	int bannerColor;
	String bannerText;
	String bannerColorTxt;
	String wideBannerLink;
	String textBannerLink;
	String storeMenu;
	String adminMemo;
	int priority;
	
	public static StoreInfo newInstance(int id) {
		StoreInfo result = new StoreInfo();
		result.setId(id);
		return result;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
