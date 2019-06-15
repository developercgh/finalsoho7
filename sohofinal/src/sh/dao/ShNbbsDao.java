package sh.dao;

import java.util.List;

import sh.model.ShBbsParam;
import sh.model.ShNbbsDto;

public interface ShNbbsDao {

	public List<ShNbbsDto> getNbbsList();
	
	public List<ShNbbsDto> getBbsPagingList(ShBbsParam param);
	
	public int getBbsCount(ShBbsParam param);
	
	public boolean NbbsUpload(ShNbbsDto nbbs);
	
	public ShNbbsDto getNbbs(ShNbbsDto nbbs) throws Exception;
	
	public boolean readcountUpdate(ShNbbsDto nbbs);
	
	public boolean NbbsUpdate(ShNbbsDto nbbs);
	
	public boolean NbbsDelete(ShNbbsDto nbbs);
	
	
}
