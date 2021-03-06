package sh.service;

import java.util.List;

import sh.model.ShRbbsDto;
import sh.model.ShBbsParam;

public interface ShRbbsService {


	public List<ShRbbsDto> getRbbsList(String searchWord ,String  choice);
	
	public List<ShRbbsDto> getBbsPagingList(ShBbsParam param);
	
	public int getBbsCount(ShBbsParam param);
	
	public boolean RbbsWrite(ShRbbsDto dto); 
	
	public ShRbbsDto RbbsDetail(int seq);
	
	public ShRbbsDto RbbsUpList(int seq);
	
	public boolean RbbsUpdate(ShRbbsDto dto);
	
	public boolean RbbsDelete(int seq);
	
	public ShRbbsDto asnList(int seq);
	
	public boolean asnwer(ShRbbsDto dto);

	
	}

