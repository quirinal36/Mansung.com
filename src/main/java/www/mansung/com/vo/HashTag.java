package www.mansung.com.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HashTag {
	int id;
	String name;
	
	public static HashTag newInstance(int id) {
		HashTag result = new HashTag();
		result.setId(id);
		return result;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
