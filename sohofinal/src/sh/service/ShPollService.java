package sh.service;

import java.util.List;

import sh.model.ShPollBean;
import sh.model.ShPollDto;
import sh.model.ShPollSubDto;
import sh.model.ShVoter;

public interface ShPollService {
	
	public List<ShPollDto> getPollAllList(String id);

	public void makePoll(ShPollBean pbean);
	
	public ShPollDto getPoll(ShPollDto poll);
	public List<ShPollSubDto> getPollSubList(ShPollDto poll);
	
	public void polling(ShVoter voter);
}
