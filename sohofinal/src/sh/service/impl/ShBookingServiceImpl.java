package sh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sh.dao.ShBookingDao;
import sh.model.ShBbsParam;
import sh.model.ShBookingDto;
import sh.model.ShMemberDto;
import sh.service.ShBookingService;

@Service
public class ShBookingServiceImpl implements ShBookingService {

	   @Autowired
	   ShBookingDao shBookingDao;
	   
	   @Override
	   public List<ShBookingDto> getBookingList() {
	      return shBookingDao.getBookingList();
	   }

	   @Override
	   public List<ShBookingDto> getBkPaginglist(ShBbsParam param) {
	      return shBookingDao.getBkPaginglist(param);
	   }

	   @Override
	   public int getBklistCount(ShBbsParam param) {
	      return shBookingDao.getBklistCount(param);
	   }
	   
	   @Override
	   public boolean Bookingwrite(ShBookingDto booking) {
	      return shBookingDao.Bookingwrite(booking);
	   }

	   @Override
	   public ShBookingDto Bookingdetail(ShBookingDto booking) {
	      return shBookingDao.Bookingdetail(booking);
	   }

	   @Override
	   public boolean BookSucess(ShBookingDto booking) {
	      return shBookingDao.ShBookSucess(booking);
	   }

	   @Override
	   public boolean BookCancel(ShBookingDto booking) {
	      return shBookingDao.ShBookCancel(booking);
	   }

	   @Override
	   public Object userBooking(ShMemberDto mem) {
	      System.out.println("Service id : " + mem);
	      return shBookingDao.userBooking(mem);
	      
	   }
}
