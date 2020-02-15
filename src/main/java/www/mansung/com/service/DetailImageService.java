package www.mansung.com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import www.mansung.com.dao.DetailImageDAO;
import www.mansung.com.vo.DetailImageMapper;
import www.mansung.com.vo.PhotoInfo;
import www.mansung.com.vo.StoreInfo;

@Component("detailImageService")
public class DetailImageService implements DataService<DetailImageService> {
	@Autowired
	DetailImageDAO dao;
	
	@Override
	public int insert(DetailImageService input) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int insert(List<DetailImageMapper> list) {
		return dao.insert(list);
	}
	@Override
	public int update(DetailImageService input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(DetailImageService input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<DetailImageService> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DetailImageService> select(DetailImageService input) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DetailImageService selectOne(DetailImageService input) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count(DetailImageService input) {
		// TODO Auto-generated method stub
		return 0;
	}
	public List<PhotoInfo> selectByStoreId(StoreInfo input){
		return dao.selectByStoreId(input);
	}
}
