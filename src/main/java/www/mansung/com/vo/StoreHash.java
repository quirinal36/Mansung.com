package www.mansung.com.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StoreHash {
	int storeId;
	int hashId;
	public static StoreHash newInstance(int hashId, int storeId) {
		StoreHash result = new StoreHash();
		result.setHashId(hashId);
		result.setStoreId(storeId);
		return result;
	}
}
