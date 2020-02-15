package www.mansung.com.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DetailImageMapper {
	int photoId;
	int storeId;
	
	public static DetailImageMapper newInstance(int storeId) {
		DetailImageMapper result = new DetailImageMapper();
		result.setStoreId(storeId);
		return result;
	}
}
