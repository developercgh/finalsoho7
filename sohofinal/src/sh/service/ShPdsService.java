package sh.service;

import java.util.List;

import sh.model.ShBbsParam;
import sh.model.ShPdsDto;

public interface ShPdsService {

	public List<ShPdsDto> getShPdsList();
	
	public boolean uploadPds(ShPdsDto dto);
	
	public ShPdsDto getPds(int seq);
	
	public boolean update(ShPdsDto dto);
	
	public List<ShPdsDto> getBbsPagingList(ShBbsParam param);
	
	public int getBbsCount(ShBbsParam param);
	
	public boolean readcountUpdate(ShPdsDto dto);
	
	void deleteBbs(int seq) throws Exception;
}
