package www.mansung.com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.mansung.com.vo.Board;

@Repository("BoardDAO")
public class BoardDAO implements DataAccess<Board>{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String namespace = "board_sql";
	
	@Override
	public int insert(Board input) {
		return sqlSession.insert(namespace+".insert", input);
	}

	@Override
	public int update(Board input) {
		return sqlSession.update(namespace +".update", input);
	}

	@Override
	public int delete(Board input) {
		return sqlSession.delete(namespace +".delete", input);
	}

	@Override
	public List<Board> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Board> select(Board input) {
		return sqlSession.selectList(namespace +".select", input);
	}

	@Override
	public Board selectOne(Board input) {
		return sqlSession.selectOne(namespace +".selectOne", input);
	}

	@Override
	public int count(Board input) {
		return sqlSession.selectOne(namespace+".count", input);
	}

}
