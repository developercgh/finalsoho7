package sh.dao;

import sh.model.ShMemberDto;

public interface ShMemberDao {

	public boolean addmember(ShMemberDto mem)throws Exception;
	
	public ShMemberDto login(ShMemberDto mem);
	
	public int getId(ShMemberDto mem);

	public int updateMypage(ShMemberDto mem) throws Exception;

	public int updatePwd(ShMemberDto mem);

	public int deleteMypage(ShMemberDto mem);
	
}
