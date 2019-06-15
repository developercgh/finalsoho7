package sh.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sh.dao.ShEbbsDao;
import sh.model.ShEbbsDto;

@Repository
public class ShEbbsDaoImpl  implements ShEbbsDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "ShEbbs.";
	
	@Override
	public List<ShEbbsDto> getEbbsList() {
		return sqlSession.selectList(ns + "getEbbsList");
	}

	@Override
	public boolean uploadEbbs(ShEbbsDto dto) {
		int n = sqlSession.insert(ns + "uploadEbbs", dto);
		return n>0?true:false;
	}

	@Override
	public ShEbbsDto getEbbs(int seq) {
		sqlSession.selectOne(ns + "getEbbs", seq);
		return null;
	}

	@Override
	public boolean updateEbbs(ShEbbsDto dto) {
		int n = sqlSession.update(ns + "updateEbbs", dto);
		return n>0?true:false;
	}

	@Override
	public boolean deleteEbbs(int seq) {
		int n = sqlSession.update(ns + "deleteEbbs", seq);
		return n>0?true:false;
	}

}
