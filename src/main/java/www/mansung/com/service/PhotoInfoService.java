package www.mansung.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import www.mansung.com.dao.PhotoInfoDAO;
import www.mansung.com.vo.PhotoInfo;

@Component("photoInfoService")
public class PhotoInfoService implements DataService<PhotoInfo> {
	@Autowired
	PhotoInfoDAO dao;
	
	@Override
	public int insert(PhotoInfo input) {
		// TODO Auto-generated method stub
		return dao.insert(input);
	}
	
	public int insert(List<PhotoInfo> input) {
		return dao.insert(input);
	}

	@Override
	public int update(PhotoInfo input) {
		return dao.update(input);
	}
	public int update(List<PhotoInfo> list) {
		return dao.update(list);
	}
	@Override
	public int delete(PhotoInfo input) {
		return dao.delete(input);
	}

	@Override
	public List<PhotoInfo> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PhotoInfo> select(PhotoInfo input) {
		return dao.select(input);
	}

	@Override
	public PhotoInfo selectOne(PhotoInfo input) {
		return dao.selectOne(input);
	}

	@Override
	public int count(PhotoInfo input) {
		// TODO Auto-generated method stub
		return 0;
	}

}