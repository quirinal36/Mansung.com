package www.mansung.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import www.mansung.com.dao.StoreInfoDAO;
import www.mansung.com.vo.StoreInfo;

@Component("storeInfoService")
public class StoreInfoService implements DataService<StoreInfo> {
	@Autowired
	StoreInfoDAO dao;
	
	@Override
	public int insert(StoreInfo input) {
		return dao.insert(input);
	}

	@Override
	public int update(StoreInfo input) {
		return dao.update(input);
	}

	@Override
	public int delete(StoreInfo input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<StoreInfo> select() {
		return dao.select();
	}

	@Override
	public List<StoreInfo> select(StoreInfo input) {
		return dao.select(input);
	}

	@Override
	public StoreInfo selectOne(StoreInfo input) {
		return dao.selectOne(input);
	}

	@Override
	public int count(StoreInfo input) {
		return dao.count(input);
	}

}
