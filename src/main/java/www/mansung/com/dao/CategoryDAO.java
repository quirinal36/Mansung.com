package www.mansung.com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.mansung.com.service.DataService;
import www.mansung.com.vo.Category;

@Repository
public class CategoryDAO implements DataService<Category> {
	private String namespace = "category_sql";
	@Autowired
	private SqlSessionTemplate sql;

	@Override
	public int insert(Category input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Category input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Category input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Category> select() {
		return sql.selectList(namespace +".select_all");
	}

	@Override
	public List<Category> select(Category input) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Category selectOne(Category input) {
		return sql.selectOne(namespace+".select_one", input);
	}

	@Override
	public int count(Category input) {
		// TODO Auto-generated method stub
		return 0;
	}

}
