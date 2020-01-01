package www.mansung.com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.mansung.com.vo.StoreInfo;

@Repository("StoreInfoDAO")
public class StoreInfoDAO implements DataAccess<StoreInfo>{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "store_info_sql";
	
	@Override
	public int insert(StoreInfo input) {
		return sqlSession.insert(namespace + ".insert", input);
	}

	@Override
	public int update(StoreInfo input) {
		return sqlSession.update(namespace +".update", input);
	}

	@Override
	public int delete(StoreInfo input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<StoreInfo> select() {
		return sqlSession.selectList(namespace +".select_all");
	}

	@Override
	public List<StoreInfo> select(StoreInfo input) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StoreInfo selectOne(StoreInfo input) {
		return sqlSession.selectOne(namespace +".select_one", input);
	}

	@Override
	public int count(StoreInfo input) {
		// TODO Auto-generated method stub
		return 0;
	}

}
