package sh.service;

import sh.model.ShMemberDto;

public interface ShMemberService {

	public boolean addmember(ShMemberDto mem) throws Exception;
	
	public ShMemberDto login(ShMemberDto mem);
	
	public int getId(ShMemberDto mem);

	public int updatePwd(ShMemberDto mem) throws Exception;

	public int updateMypage(ShMemberDto mem) throws Exception;
	
	public int deleteMypage(ShMemberDto mem);
	
	
}
