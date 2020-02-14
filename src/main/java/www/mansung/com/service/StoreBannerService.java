package www.mansung.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import www.mansung.com.dao.StoreBannerDAO;
import www.mansung.com.vo.StoreBanner;

@Component("storeBannerService")
public class StoreBannerService implements DataService<StoreBanner> {
	@Autowired
	StoreBannerDAO dao;
	
	@Override
	public int insert(StoreBanner input) {
		return dao.insert(input);
	}

	@Override
	public int update(StoreBanner input) {
		return dao.update(input);
	}

	@Override
	public int delete(StoreBanner input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<StoreBanner> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StoreBanner> select(StoreBanner input) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StoreBanner selectOne(StoreBanner input) {
		return dao.selectOne(input);
	}

	@Override
	public int count(StoreBanner input) {
		// TODO Auto-generated method stub
		return 0;
	}

}
