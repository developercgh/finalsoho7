package sh.dao;

import java.util.List;

import sh.model.ShEbbsDto;


public interface ShEbbsDao {

	public List<ShEbbsDto> getEbbsList();
	
	public boolean uploadEbbs(ShEbbsDto dto);
	
	public ShEbbsDto getEbbs(int seq);
	
	public boolean updateEbbs(ShEbbsDto dto);

	public boolean deleteEbbs(int seq);

}


