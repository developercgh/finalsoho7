package sh.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sh.dao.ShBookingDao;
import sh.model.ShBbsParam;
import sh.model.ShBookingDto;
import sh.model.ShMemberDto;

@Repository
public class ShBookingDaoImpl implements ShBookingDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "ShBooking.";	// mapper의 namespace
	
	@Override
	public List<ShBookingDto> getBookingList() {
		return sqlSession.selectList(ns + "getBookinglist");
	}
	
	@Override
	public List<ShBookingDto> getBkPaginglist(ShBbsParam param) {
		return sqlSession.selectList(ns + "getBkPaginglist", param);
	}

	@Override
	public int getBklistCount(ShBbsParam param) {
		return sqlSession.selectOne(ns + "getBklistCount", param);
	}

	@Override
	public boolean Bookingwrite(ShBookingDto booking) {
		int count = sqlSession.insert(ns + "Bookingwrite", booking);
		return count>0?true:false;	// 일치하면 true=1, 일치하지 않으면  false=0 처리
	}
	
	@Override
	public ShBookingDto Bookingdetail(ShBookingDto booking) {
		return sqlSession.selectOne(ns + "Bookingdetail", booking);
	}

	@Override
	public boolean ShBookSucess(ShBookingDto booking) {
		int n = sqlSession.update(ns + "BookSucess", booking);
		
		return n>0?true:false;
	}

	@Override
	public boolean ShBookCancel(ShBookingDto booking) {
		int n = sqlSession.update(ns + "BookCancel", booking);
		
		return n>0?true:false;
	}

	@Override
	public Object userBooking(ShMemberDto mem) {
		return sqlSession.selectList(ns + "userBooking", mem);
	}

	
	
}
