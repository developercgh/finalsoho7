package sh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sh.dao.ShQbbsDao;
import sh.model.ShQbbsDto;
import sh.model.ShQbbsParam;
import sh.service.ShQbbsService;

@Service
public class ShQbbsServiceImpl implements ShQbbsService {

	@Autowired
	ShQbbsDao shQbbsDao;

	@Override
	public List<ShQbbsDto> getQbbsList() {
		return shQbbsDao.getQbbsList();
	}

	@Override
	public List<ShQbbsDto> getQbbsPagingList(ShQbbsParam Qparam) {
		return shQbbsDao.getQbbsPagingList(Qparam);
	}

	@Override
	public int getQbbsCount(ShQbbsParam Qparam) {
		
		return shQbbsDao.getQbbsCount(Qparam);
	}

	@Override
	public boolean Qbbswrite(ShQbbsDto Qbbs) {
		
		return shQbbsDao.Qbbswrite(Qbbs) ;
	}

	@Override
	public ShQbbsDto getQbbs(ShQbbsDto Qbbs) {
		
		return shQbbsDao.getQbbs(Qbbs);
	}

	@Override
	public boolean Qbbsupdate(ShQbbsDto Qbbs) {
		
		return shQbbsDao.Qbbsupdate(Qbbs);
	}

	@Override
	public boolean Qbbsdelete(ShQbbsDto Qbbs) {
		
		return shQbbsDao.Qbbsdelete(Qbbs);
	}

	@Override
	public boolean Qreadcount(ShQbbsDto Qbbs) {
	
		return shQbbsDao.Qreadcount(Qbbs);
	}

	@Override
	public boolean Qanswer(ShQbbsDto Qbbs) {
	
		return shQbbsDao.Qanswer(Qbbs);
	}
	
	
	
	
	
	
}
