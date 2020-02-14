package www.mansung.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import www.mansung.com.dao.HashTagDAO;
import www.mansung.com.vo.HashTag;
import www.mansung.com.vo.StoreHash;
import www.mansung.com.vo.StoreInfo;
@Component("hashtagService")
public class HashTagService implements DataService<HashTag> {
	@Autowired
	HashTagDAO dao;
	
	@Override
	public int insert(HashTag input) {
		return dao.insert(input);
	}

	@Override
	public int update(HashTag input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(HashTag input) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int delete(StoreHash input) {
		return dao.delete(input);
	}
	@Override
	public List<HashTag> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HashTag> select(HashTag input) {
		// TODO Auto-generated method stub
		return null;
	}
	public List<HashTag> select(StoreInfo input) {
		return dao.select(input);
	}
	
	@Override
	public HashTag selectOne(HashTag input) {
		return dao.selectOne(input);
	}

	@Override
	public int count(HashTag input) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int mappingTags(List<StoreHash> list) {
		return dao.mappingTags(list);
	}
	public List<StoreHash> selectByStoreId(StoreInfo input){
		return dao.selectByStoreId(input);
	}
	public int deleteList(List<StoreHash> list) {
		return dao.deleteList(list);
	}
}
