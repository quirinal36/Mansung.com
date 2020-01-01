package www.mansung.com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.mansung.com.vo.FileInfo;

@Repository("FileInfoDAO")
public class FileInfoDAO implements DataAccess<FileInfo>{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String namespace = "file_info_sql";
	
	@Override
	public int insert(FileInfo input) {
		return sqlSession.insert(namespace + ".insert", input);
	}
	public int insert(List<FileInfo> input) {
		return sqlSession.insert(namespace + ".insert_list", input);
	}
	@Override
	public int update(FileInfo input) {
		return sqlSession.update(namespace +".update", input);
	}
	public int update(List<FileInfo> list) {
		return sqlSession.update(namespace +".update_list", list);
	}
	@Override
	public int delete(FileInfo input) {
		return sqlSession.delete(namespace+".delete", input);
	}

	@Override
	public List<FileInfo> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FileInfo> select(FileInfo input) {
		return sqlSession.selectList(namespace+".select", input);
	}

	@Override
	public FileInfo selectOne(FileInfo input) {
		return sqlSession.selectOne(namespace + ".select_one", input);
	}

	@Override
	public int count(FileInfo input) {
		// TODO Auto-generated method stub
		return 0;
	}
}
