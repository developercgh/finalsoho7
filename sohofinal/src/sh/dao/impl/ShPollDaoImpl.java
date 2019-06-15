package sh.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sh.dao.ShPollDao;
import sh.model.ShPollDto;
import sh.model.ShPollSubDto;
import sh.model.ShVoter;

@Repository
public class ShPollDaoImpl implements ShPollDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns ="ShPoll.";
	
	@Override	//myBatis가 리스트로 반환해주므로
	public List<ShPollDto> getPollAlllist() {
		return sqlSession.selectList(ns + "getPollAllList");
	}

	@Override
	public int isVote(ShVoter voter) {		//숫자로 반환(받을수 있는 자료가 하나여서)
		return sqlSession.selectOne(ns + "isVote", voter);
	}

	@Override		//투표 만들기
	public void makePoll(ShPollDto poll) {
		sqlSession.insert(ns + "makePoll", poll);
		
	}

	@Override		//투표보기 만들기
	public void makePollSub(ShPollSubDto pollsub) {
		sqlSession.insert(ns + "makePollSub", pollsub);
		
	}

	@Override		//작성자,질문, 등등 
	public ShPollDto getPoll(ShPollDto poll) {
		return sqlSession.selectOne(ns + "getPoll", poll);
	}

	@Override
	public List<ShPollSubDto> getPollSubList(ShPollDto poll) {
		return sqlSession.selectList(ns + "getPollSubList", poll);
	}

	@Override
	public void pollingVoter(ShVoter voter) {
		sqlSession.insert(ns + "pollingVote", voter);
	}

	@Override
	public void pollingPoll(ShVoter voter) {
		sqlSession.update(ns + "pollingPoll", voter);
	}

	@Override
	public void pollingSub(ShVoter voter) {
		sqlSession.update(ns + "pollingSub", voter);
		
	}





	
}
