package www.mansung.com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.mansung.com.vo.StoreBanner;

@Repository("StoreBannerDAO")
public class StoreBannerDAO implements DataAccess<StoreBanner> {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String namespace = "banner_sql";
	
	@Override
	public int insert(StoreBanner input) {
		return sqlSession.insert(namespace +".insert", input);
	}

	@Override
	public int update(StoreBanner input) {
		// TODO Auto-generated method stub
		return 0;
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
		return sqlSession.selectOne(namespace+".select_one", input);
	}

	@Override
	public int count(StoreBanner input) {
		// TODO Auto-generated method stub
		return 0;
	}

}
