package sh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sh.dao.ShNbbsDao;
import sh.model.ShBbsParam;
import sh.model.ShNbbsDto;
import sh.service.ShNbbsService;

@Service
public class ShNbbsServiceImpl implements ShNbbsService {

	@Autowired
	ShNbbsDao shNbbsDao;

	@Override
	public List<ShNbbsDto> getNbbsList() {
		return shNbbsDao.getNbbsList();
	}
	
	@Override
	public List<ShNbbsDto> getBbsPagingList(ShBbsParam param) {
		return shNbbsDao.getBbsPagingList(param);
	}

	@Override
	public int getBbsCount(ShBbsParam param) {
		return shNbbsDao.getBbsCount(param);
	}

	@Override
	public boolean NbbsUpload(ShNbbsDto nbbs) {
		return shNbbsDao.NbbsUpload(nbbs);
	}
	
	@Override
	public ShNbbsDto getNbbs(ShNbbsDto nbbs) throws Exception {
		return shNbbsDao.getNbbs(nbbs);
	}
	
	@Override
	public boolean readcountUpdate(ShNbbsDto nbbs) {
		return shNbbsDao.readcountUpdate(nbbs);
	}
	
	@Override
	public boolean NbbsUpdate(ShNbbsDto nbbs) {
		return shNbbsDao.NbbsUpdate(nbbs);
	}

	@Override
	public boolean NbbsDelete(ShNbbsDto nbbs) {
		return shNbbsDao.NbbsDelete(nbbs);
	}
	
	
	
}
