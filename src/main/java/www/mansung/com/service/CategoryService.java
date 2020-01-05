package www.mansung.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import www.mansung.com.dao.CategoryDAO;
import www.mansung.com.vo.Category;

@Component("categoryService")
public class CategoryService implements DataService<Category> {
	@Autowired
	private CategoryDAO dao;

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
		return dao.select();
	}

	@Override
	public List<Category> select(Category input) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Category selectOne(Category input) {
		return dao.selectOne(input);
	}

	@Override
	public int count(Category input) {
		// TODO Auto-generated method stub
		return 0;
	}

}
