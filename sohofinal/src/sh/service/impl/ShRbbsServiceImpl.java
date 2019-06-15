package sh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sh.dao.ShRbbsDao;
import sh.model.ShRbbsDto;
import sh.model.ShBbsParam;
import sh.service.ShRbbsService;

@Service
public class ShRbbsServiceImpl implements ShRbbsService {

	@Autowired
	ShRbbsDao shRbsDao;

	@Override
	public List<ShRbbsDto> getRbbsList(String searchWord ,String  choice) {		
		return shRbsDao.getBbsList(searchWord, choice);
	}

	@Override
	public List<ShRbbsDto> getBbsPagingList(ShBbsParam param) {
		return shRbsDao.getBbsPagingList(param);		
	}

	@Override
	public int getBbsCount(ShBbsParam param) {
		return shRbsDao.getRbbsCount(param);		
	}
	
	@Override
	public boolean RbbsWrite(ShRbbsDto dto) {
		return shRbsDao.RbbsWrite(dto);
	}

	@Override
	public ShRbbsDto RbbsDetail(int seq) {
		return shRbsDao.RbbsDetail(seq);
	}

	@Override
	public ShRbbsDto RbbsUpList(int seq) {
		return shRbsDao.RbbsUpList(seq);
	}

	@Override
	public boolean RbbsUpdate(ShRbbsDto dto) {
		return shRbsDao.RbbsUpdate(dto);
	}

	@Override
	public boolean RbbsDelete(int seq) {
		return shRbsDao.RbbsDelete(seq);
	}

	@Override
	public ShRbbsDto asnList(int seq) {
		return shRbsDao.asnList(seq);
	}
	
	public boolean asnwer(ShRbbsDto dto) {
		return shRbsDao.asnwer(dto);
	}

}

