package sh.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sh.dao.ShQbbsDao;
import sh.model.ShQbbsDto;
import sh.model.ShQbbsParam;

@Repository	// = 저장소
public class ShQbbsDaoImpl implements ShQbbsDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "ShQbbs.";

	@Override
	public List<ShQbbsDto> getQbbsList() {// namespace + 뒤에부분은 KhBbs.xml의 id값이다
		
		return sqlSession.selectList(namespace + "getQbbsList");
	}

	@Override
	public List<ShQbbsDto> getQbbsPagingList(ShQbbsParam Qparam) {
		return sqlSession.selectList(namespace + "getQbbsPagingList", Qparam);
	}

	@Override
	public int getQbbsCount(ShQbbsParam Qparam) {
		return sqlSession.selectOne(namespace + "getQbbsCount", Qparam);
	}

	@Override
	public boolean Qbbswrite(ShQbbsDto Qbbs) {
		
		int n = sqlSession.insert(namespace + "Qbbswrite", Qbbs);
		
		return n>0?true:false;
	}
	

	@Override
	public ShQbbsDto getQbbs(ShQbbsDto Qbbs) {
		return sqlSession.selectOne(namespace + "Qbbsdetail", Qbbs);
	}

	@Override
	public boolean Qbbsupdate(ShQbbsDto Qbbs) {
		int n = sqlSession.update(namespace + "Qbbsupdate", Qbbs);
		
		return n>0?true:false;
	}

	@Override
	public boolean Qbbsdelete(ShQbbsDto Qbbs) {
		int n = sqlSession.update(namespace + "Qbbsdelete", Qbbs);
		
		return n>0?true:false;
	}

	@Override
	public boolean Qreadcount(ShQbbsDto Qbbs) {
		int n = sqlSession.update(namespace + "Qreadcount" , Qbbs);
		
		return n>0?true:false;
	}

	@Override
	public boolean Qanswer(ShQbbsDto Qbbs) {
		int n = sqlSession.update(namespace + "QanswerUpdate", Qbbs);
		int n1 = sqlSession.insert(namespace + "QanswerInsert", Qbbs);
		
		
		return (n > 0 && n1 > 0)?true:false; 
	}
	
	
	
}
