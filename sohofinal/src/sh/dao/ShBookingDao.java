package sh.dao;

import java.util.List;

import sh.model.ShBbsParam;
import sh.model.ShBookingDto;
import sh.model.ShMemberDto;

public interface ShBookingDao {

	public List<ShBookingDto> getBookingList();
	
	public List<ShBookingDto> getBkPaginglist(ShBbsParam param);
	
	public int getBklistCount(ShBbsParam param);
	
	public boolean Bookingwrite(ShBookingDto booking);
	
	public ShBookingDto Bookingdetail(ShBookingDto booking);
	
	public boolean ShBookSucess(ShBookingDto booking);
	
	public boolean ShBookCancel(ShBookingDto booking);

	public Object userBooking(ShMemberDto id);
	
}
