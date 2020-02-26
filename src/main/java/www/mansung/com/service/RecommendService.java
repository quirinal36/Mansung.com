package www.mansung.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import www.mansung.com.dao.RecommendDAO;
import www.mansung.com.vo.Recommend;

@Component("recommendService")
public class RecommendService implements DataService<Recommend> {
	@Autowired
	RecommendDAO dao;
	
	@Override
	public int insert(Recommend input) {
		return dao.insert(input);
	}

	@Override
	public int update(Recommend input) {
		return dao.update(input);
	}

	@Override
	public int delete(Recommend input) {
		return dao.delete(input);
	}

	@Override
	public List<Recommend> select() {
		return dao.select();
	}

	@Override
	public List<Recommend> select(Recommend input) {
		return dao.select(input);
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
