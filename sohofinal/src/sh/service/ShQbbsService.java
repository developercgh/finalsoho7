package sh.service;

import java.util.List;

import sh.model.ShQbbsParam;
import sh.model.ShQbbsDto;

public interface ShQbbsService {
	
public List<ShQbbsDto> getQbbsList();
	
	public List<ShQbbsDto> getQbbsPagingList(ShQbbsParam Qparam);
	
	public int getQbbsCount(ShQbbsParam Qparam);
	
	public boolean Qbbswrite(ShQbbsDto Qbbs);
	
	public ShQbbsDto getQbbs(ShQbbsDto Qbbs);
 	
	public boolean Qbbsupdate(ShQbbsDto Qbbs);
	
	public boolean Qbbsdelete(ShQbbsDto Qbbs);
	
	public boolean Qreadcount(ShQbbsDto Qbbs);
	
	public boolean Qanswer(ShQbbsDto Qbbs);


	
	
	
}
