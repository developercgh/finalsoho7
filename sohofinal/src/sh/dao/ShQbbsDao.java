package sh.dao;

import java.util.List;

import sh.model.ShQbbsDto;
import sh.model.ShQbbsParam;


public interface ShQbbsDao {

	public List<ShQbbsDto> getQbbsList();
	
	public  List<ShQbbsDto> getQbbsPagingList(ShQbbsParam Qparam);
	
	public int getQbbsCount(ShQbbsParam Qparam);
	
	public boolean Qbbswrite(ShQbbsDto Qbbs);
	
	public ShQbbsDto getQbbs(ShQbbsDto Qbbs);
	
	public boolean Qbbsupdate(ShQbbsDto Qbbs);
	
	public boolean Qbbsdelete(ShQbbsDto Qbbs);
	
	public boolean Qreadcount(ShQbbsDto Qbbs);
	
	public boolean Qanswer(ShQbbsDto Qbbs);
	
	
	// boolean replyBbsUpdate, insert 두개를 사용해 댓글   서비스에서 함수 두개 사용 해도됨 
	 
}
