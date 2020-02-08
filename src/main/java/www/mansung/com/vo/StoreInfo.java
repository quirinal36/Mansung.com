package www.mansung.com.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StoreInfo extends Paging{
	int id;
	String title;
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
	Date wdate;
	Date udate;
	int category;
	String categoryTitle;
	int wideBanner;
	
	public static StoreInfo newInstance(int id) {
		StoreInfo result = new StoreInfo();
		result.setId(id);
		return result;
	}
}
