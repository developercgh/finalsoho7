package sh.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sh.dao.ShNbbsDao;
import sh.model.ShBbsParam;
import sh.model.ShNbbsDto;

@Repository
public class ShNbbsDaoImpl implements ShNbbsDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "ShNbbs.";
	
	@Override
	public List<ShNbbsDto> getNbbsList() {
		return sqlSession.selectList(ns + "getNbbsList");
	}
	
	// paging
	@Override
	public List<ShNbbsDto> getBbsPagingList(ShBbsParam param) {
		return sqlSession.selectList(ns + "getBbsPagingList", param);
	}

	// page count
	@Override
	public int getBbsCount(ShBbsParam param) {
		return sqlSession.selectOne(ns + "getBbsCount", param);
	}

	@Override
	public boolean NbbsUpload(ShNbbsDto nbbs) {
		int count = sqlSession.insert(ns + "NbbsUpload", nbbs);
		return count>0?true:false;
	}
	
	@Override
	public ShNbbsDto getNbbs(ShNbbsDto nbbs) throws Exception {
		return sqlSession.selectOne(ns + "getNbbs", nbbs);
	}
	
	@Override
	public boolean readcountUpdate(ShNbbsDto nbbs) {
		int count = sqlSession.update(ns + "readcountUpdate", nbbs);
		return count>0?true:false;
	}

	@Override
	public boolean NbbsUpdate(ShNbbsDto nbbs) {
		int count = sqlSession.update(ns + "NbbsUpdate", nbbs);
		return count>0?true:false;
	}

	@Override
	public boolean NbbsDelete(ShNbbsDto nbbs) {
		int count = sqlSession.delete(ns + "NbbsDelete", nbbs);
		return count>0?true:false;
	}

	

	
	
}
