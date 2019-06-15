package sh.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sh.dao.ShRbbsDao;
import sh.model.ShBbsParam;
import sh.model.ShRbbsDto;



@Repository
public class ShRbbsDaoImpl implements ShRbbsDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String ns = "ShRbbs.";

	@Override
	public List<ShRbbsDto> getBbsList(String searchWord ,String  choice) {		
		return sqlSession.selectList(ns + "getBbsList");
	}

	@Override
	public List<ShRbbsDto> getBbsPagingList(ShBbsParam param) {
		return sqlSession.selectList(ns + "getBbsPagingList", param);
	}

	@Override
	public int getRbbsCount(ShBbsParam param) {		
		return sqlSession.selectOne(ns + "getRbbsCount", param);
	}

	@Override
	public boolean RbbsWrite(ShRbbsDto dto) {
		int count = sqlSession.insert(ns+"RbbsWrite", dto);
		return count>0?true:false;
	}

	@Override
	public ShRbbsDto RbbsDetail(int seq) {
		ShRbbsDto dto = sqlSession.selectOne(ns+"RbbsDetail", seq);
		return dto;
	}

	@Override
	public ShRbbsDto RbbsUpList(int seq) {
		ShRbbsDto dto = sqlSession.selectOne(ns+"RbbsUpList", seq);
		return dto;
	}

	@Override
	public boolean RbbsUpdate(ShRbbsDto dto) {
		int count = 0;
		count =  sqlSession.update(ns+"RbbsUpdate", dto);
		return count>0?true:false;
	}

	@Override
	public boolean RbbsDelete(int seq) {
		int count = 0;
		count= sqlSession.update(ns+"RbbsDelete", seq);
		return count>0?true:false;
	}

	@Override
	public ShRbbsDto asnList(int seq) {
		ShRbbsDto asnList = sqlSession.selectOne(ns+"asnList", seq) ;
				//(RbbsDto)sqlSession.selectList(ns+"asnList", seq);
		return asnList;
	}

	@Override
	public boolean asnwer(ShRbbsDto dto) {
		int count = 0;
		count = sqlSession.insert(ns+"answer", dto);
		return count>0?true:false;
	}
	
}








