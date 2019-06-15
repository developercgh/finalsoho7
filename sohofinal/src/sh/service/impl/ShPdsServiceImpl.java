package sh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sh.dao.ShPdsDao;
import sh.model.ShBbsParam;
import sh.model.ShPdsDto;
import sh.service.ShPdsService;

@Service
public class ShPdsServiceImpl implements ShPdsService {


	@Autowired
	ShPdsDao ShPdsDao;
	
	@Override
	public List<ShPdsDto> getShPdsList() {
		return ShPdsDao.getShPdsList();
	}

	@Override
	public boolean uploadPds(ShPdsDto dto) {

		return ShPdsDao.uploadPds(dto);
	}

	@Override
	public ShPdsDto getPds(int seq) {
		return ShPdsDao.getPds(seq);
	}

	@Override
	public boolean update(ShPdsDto dto) {
		return ShPdsDao.updatePds(dto);
	}

	@Override
	public List<ShPdsDto> getBbsPagingList(ShBbsParam param) {
		return ShPdsDao.getBbsPagingList(param);
	}

	@Override
	public int getBbsCount(ShBbsParam param) {
		return ShPdsDao.getBbsCount(param);
	}
	
	@Override
	public boolean readcountUpdate(ShPdsDto dto) {
		return ShPdsDao.readcountUpdate(dto);
	}

	@Override
	public void deleteBbs(int seq) throws Exception {
		ShPdsDao.deleteBbs(seq);
	}


}
