package www.mansung.com.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StoreBanner {
	int id;
	int storeId;
	int bannerColor;
	String bannerText;
	
	public static StoreBanner newInstance(int storeId) {
		StoreBanner result = new StoreBanner();
		result.setStoreId(storeId);
		return result;
	}
}
