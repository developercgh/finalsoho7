package sh.service;

import java.util.List;

import sh.model.ShBbsParam;
import sh.model.ShBookingDto;
import sh.model.ShMemberDto;

public interface ShBookingService {

	public List<ShBookingDto> getBookingList();
	
	public List<ShBookingDto> getBkPaginglist(ShBbsParam param);
	
	public int getBklistCount(ShBbsParam param);
	
	public boolean Bookingwrite(ShBookingDto booking);
	
	public ShBookingDto Bookingdetail(ShBookingDto booking);

	boolean BookSucess(ShBookingDto booking);

	boolean BookCancel(ShBookingDto booking);

	Object userBooking(ShMemberDto mem);
	
	
}
