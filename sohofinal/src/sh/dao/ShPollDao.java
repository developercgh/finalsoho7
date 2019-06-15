package sh.dao;

import java.util.List;

import sh.model.ShPollDto;
import sh.model.ShPollSubDto;
import sh.model.ShVoter;

public interface ShPollDao {

	public List<ShPollDto> getPollAlllist();		//투표리스트
	public int isVote(ShVoter voter);				//누가 투표했는지	
	
	public void makePoll(ShPollDto poll);
	public void makePollSub(ShPollSubDto pollsub);
	
	//투표 만들기
	public ShPollDto getPoll(ShPollDto poll);	//항목
	public List<ShPollSubDto> getPollSubList(ShPollDto poll);	//보기들
	
	//투표후
	public void pollingVoter(ShVoter voter);
	public void pollingPoll(ShVoter voter);
	public void pollingSub(ShVoter voter);

	
}
