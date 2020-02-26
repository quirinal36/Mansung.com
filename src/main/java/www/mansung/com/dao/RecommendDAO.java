package www.mansung.com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.mansung.com.vo.Recommend;

@Repository("RecommendDAO")
public class RecommendDAO implements DataAccess<Recommend> {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String namespace = "recommend_sql";
	@Override
	public int insert(Recommend input) {
		return sqlSession.insert(namespace +".insert", input);
	}

	@Override
	public int update(Recommend input) {
		return sqlSession.update(namespace +".update", input);
	}

	@Override
	public int delete(Recommend input) {
		return sqlSession.delete(namespace+".delete", input);
	}

	@Override
	public List<Recommend> select() {
		return sqlSession.selectList(namespace + ".select-all");
	}

	@Override
	public List<Recommend> select(Recommend input) {
		return sqlSession.selectList(namespace +".select", input);
	}

	@Override
	public Recommend selectOne(Recommend input) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count(Recommend input) {
		// TODO Auto-generated method stub
		return 0;
	}

}
