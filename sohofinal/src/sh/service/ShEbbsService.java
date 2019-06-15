package sh.service;

import java.util.List;

import sh.model.ShEbbsDto;


public interface ShEbbsService {

public List<ShEbbsDto> getEbbsList();
	
public boolean uploadEbbs(ShEbbsDto dto);

public ShEbbsDto getEbbs(int seq);

public boolean updateEbbs(ShEbbsDto dto);

public boolean EbbsDelete(int seq);

}

