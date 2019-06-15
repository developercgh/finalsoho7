package sh.dao;

import java.util.List;

import sh.model.ShBbsParam;
import sh.model.ShPdsDto;

public interface ShPdsDao {
	
	public List<ShPdsDto> getShPdsList();		//리스트 뿌려주기
	
	public boolean uploadPds(ShPdsDto dto);		//파일 업로드
	
	public ShPdsDto getPds(int seq);			//디테일
	
	public boolean updatePds(ShPdsDto dto);		//수정
	
	
	
	public List<ShPdsDto> getBbsPagingList(ShBbsParam param);
	
	public int getBbsCount(ShBbsParam param);
	
	public boolean readcountUpdate(ShPdsDto dto); 

	void deleteBbs(int seq) throws Exception;
	
}

