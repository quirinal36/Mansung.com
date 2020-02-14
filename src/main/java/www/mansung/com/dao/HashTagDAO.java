package www.mansung.com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.mansung.com.vo.HashTag;
import www.mansung.com.vo.StoreHash;
import www.mansung.com.vo.StoreInfo;

@Repository("HashTagDAO")
public class HashTagDAO implements DataAccess<HashTag> {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String namespace = "hashtag_sql";
	@Override
	public int insert(HashTag input) {
		return sqlSession.insert(namespace +".insert", input);
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
		return sqlSession.delete(namespace +".delete", input);
	}
	@Override
	public List<HashTag> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HashTag> select(HashTag input) {
		return null;
	}
	public List<HashTag> select(StoreInfo input) {
		return sqlSession.selectList(namespace +".select", input);
	}
	@Override
	public HashTag selectOne(HashTag input) {
		return sqlSession.selectOne(namespace +".select_one", input);
	}

	@Override
	public int count(HashTag input) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int mappingTags(List<StoreHash> list) {
		return sqlSession.insert(namespace +".mapping_tags", list);
	}
	public List<StoreHash> selectByStoreId(StoreInfo input){
		return sqlSession.selectList(namespace +".select_by_storeid", input);
	}
	public int deleteList(List<StoreHash> list) {
		return sqlSession.delete(namespace +".delete_list", list);
	}
}
