package www.mansung.com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.mansung.com.vo.DetailImageMapper;
import www.mansung.com.vo.PhotoInfo;
import www.mansung.com.vo.StoreInfo;

@Repository("DetailImageDAO")
public class DetailImageDAO implements DataAccess<DetailImageMapper> {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "detail_image_sql";
	
	@Override
	public int insert(DetailImageMapper input) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int insert(List<DetailImageMapper> list) {
		return sqlSession.insert(namespace +".insert_list", list);
	}
	@Override
	public int update(DetailImageMapper input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(DetailImageMapper input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<DetailImageMapper> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DetailImageMapper> select(DetailImageMapper input) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DetailImageMapper selectOne(DetailImageMapper input) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count(DetailImageMapper input) {
		// TODO Auto-generated method stub
		return 0;
	}
	public List<PhotoInfo> selectByStoreId(StoreInfo input){
		return sqlSession.selectList(namespace +".select_by_storeid", input);
	}
}
