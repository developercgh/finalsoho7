package sh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sh.dao.ShEbbsDao;
import sh.model.ShEbbsDto;
import sh.service.ShEbbsService;

@Service
public class ShEbbsServiceImpl implements ShEbbsService {

	@Autowired
	ShEbbsDao ShEbbsDao;
	
	@Override
	public List<ShEbbsDto> getEbbsList() {
		return ShEbbsDao.getEbbsList();
	}

	@Override
	public boolean uploadEbbs(ShEbbsDto dto) {
		return ShEbbsDao.uploadEbbs(dto);
	}

	@Override
	public ShEbbsDto getEbbs(int seq) {
		return ShEbbsDao.getEbbs(seq);
	}

	@Override
	public boolean updateEbbs(ShEbbsDto dto) {
		return ShEbbsDao.updateEbbs(dto);
	}

	@Override
	public boolean EbbsDelete(int seq) {
		return ShEbbsDao.deleteEbbs(seq);
	}

}
