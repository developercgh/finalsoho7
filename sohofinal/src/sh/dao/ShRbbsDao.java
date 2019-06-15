package sh.dao;

import java.util.List;

import sh.model.ShBbsParam;
import sh.model.ShRbbsDto;



public interface ShRbbsDao {
	
	public List<ShRbbsDto> getBbsList(String searchWord ,String  choice); 
	
	public List<ShRbbsDto> getBbsPagingList(ShBbsParam param); 
	
	public int getRbbsCount(ShBbsParam param);
	
	public boolean RbbsWrite(ShRbbsDto dto); 
	
	public ShRbbsDto RbbsDetail(int seq);
	
	public ShRbbsDto RbbsUpList(int seq);
	
	public boolean RbbsUpdate(ShRbbsDto dto);
	
	public boolean RbbsDelete(int seq);
	
	public ShRbbsDto asnList(int seq);
	
	public boolean asnwer(ShRbbsDto dto);
}
