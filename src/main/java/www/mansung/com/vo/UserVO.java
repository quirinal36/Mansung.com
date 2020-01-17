package www.mansung.com.vo;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class UserVO {
	int id;
	int user_role;
	int writer;
	String login;
	String password;
	String password_confirm;
	String username;
	String phone;
	
	String domain;
	String classification;
	String level;
	String address;
	String addressDetail;
	String role_name;
	String role_name_kr;
	String telephone;
	Date mdate;
	
	/* KAKAO LOGIN PROPERTIES */
	String email;
	String thumbnail_image_url;
	String profile_image_url;
	String nickname;
	
	public static final int ROLE_ADMIN = 1;
	public static final int ROLE_USER = 2;
	public static final int ROLE_GENERAL = 3;
	public static final int ROLE_COMPANY = 4;
	public static final String ADMIN = "ROLE_ADMIN";
	public static final String USER = "ROLE_USER";
	public static final String GENERAL = "ROLE_GENERAL";
	public static final String COMPANY = "ROLE_COMPANY";
	
	public static final String[] ROLES = {"", ADMIN, USER, GENERAL, COMPANY};
	
	public UserVO () {
		
	}
	public static UserVO newInstanse(int id) {
		UserVO user = new UserVO();
		user.setId(id);
		return user;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
