package www.mansung.com.service;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import www.mansung.com.dao.UserDAO;
import www.mansung.com.vo.UserRole;
import www.mansung.com.vo.UserVO;

@Component("userService")
public class UserService implements DataService<UserVO> {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private UserDAO dao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public int insert(UserVO input) {
		input.setPassword(passwordEncoder.encode(input.getPassword()));
		return dao.insert(input);
	}
	public int insert(List<UserVO> list) {
		return dao.insert(list);
	}
	@Override
	public int update(UserVO input) {
		if(input.getPassword() != null) {
			input.setPassword(passwordEncoder.encode(input.getPassword()));
		}
		return dao.update(input);
	}

	@Override
	public int delete(UserVO input) {
		return dao.delete(input);
	}

	@Override
	public List<UserVO> select() {
		return dao.select();
	}

	@Override
	public List<UserVO> select(UserVO input) {
		return dao.select(input);
	}

	@Override
	public UserVO selectOne(UserVO input) {
		return dao.selectOne(input);
	}
	public UserVO selectFindId(UserVO input) {
		return dao.selectFindId(input);
	}
	@Override
	public int count(UserVO input) {
		return dao.count(input);
	}
	public boolean isValid(UserVO input) {
		final String regex = "^[a-z]{1}[a-z0-9_]{4,19}$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(input.getLogin());
		return matcher.matches();
	}
	public boolean isPasswordValid(UserVO user, final String input) {
		return passwordEncoder.matches(input, user.getPassword());
	}
	public List<UserVO> search(UserVO input){
		return dao.search(input);
	}
	public List<UserRole> selectRoles(){
		return dao.selectRoles();
	}
	public List<UserVO> selectByIds(List<UserVO> list){
		return dao.selectByIds(list);
	}
}
