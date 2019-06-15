package sh.service.impl;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sh.dao.ShPollDao;
import sh.model.ShBbsParam;
import sh.model.ShPdsDto;
import sh.model.ShPollBean;
import sh.model.ShPollDto;
import sh.model.ShPollSubDto;
import sh.model.ShVoter;
import sh.service.ShPdsService;
import sh.service.ShPollService;


@Service
public class ShPollServiceImpl implements ShPollService {

	@Autowired
	ShPollDao shPollDao;
	
	@Override
	public List<ShPollDto> getPollAllList(String id) {
		
		//모든 투표 목록을 가져 온다
		List<ShPollDto> list = shPollDao.getPollAlllist();
		
		//투표를 할 수 있는 항목과 없는 항목으로 정리 목록(메모리에 남아이있기 때문에 새롭게 만들어서 작성)
		List<ShPollDto> plist = new ArrayList<ShPollDto>();
		
		
		for(ShPollDto poll : list) {
			int pollid = poll.getPollid(); //투표번호
			
			int count = shPollDao.isVote(new ShVoter(pollid, -1, id));		//pollid 질문. db에 들어가있자나요. ->seq in//voterdao
			if(count == 1) {	// 투표를 했음
				poll.setVote(true);
			}
			else {	// 투표를 안했음
				poll.setVote(false);				
			}
			
			plist.add(poll);
		}
		
		return plist;
			
			
	}

	@Override
	public void makePoll(ShPollBean pbean) {
		java.sql.Date sDate = new java.sql.Date(pbean.getSdate().getTime());
		java.sql.Date eDate = new java.sql.Date(pbean.getEdate().getTime());
		//질문 항목(매개 변수 만들어 놨음 ShPollDto에)
		ShPollDto poll = new ShPollDto(pbean.getId(),		//투표 만든 사람의 ID
										pbean.getQuestion(),	//질문
										sDate,		//시작일
										eDate,		//종료일
										pbean.getItemcount(), 0);	//보기의 갯수,질문에 투표한 사람의 수(처음에는 0이라서 잡아놓음)
		
		//DB insert
		shPollDao.makePoll(poll);
		
		//보기들
		int itemcount = pbean.getItemcount();		//보기의 갯수
		String answer[] = pbean.getPollnum();		//총 보기의 갯수는 최대 10개로 배열로 객체를 생성해서 만들어 놨어(보면됨)
		
		for (int i = 0; i < itemcount; i++) {
			ShPollSubDto pollsub = new ShPollSubDto();
			pollsub.setAnswer(answer[i]);		//for문 돌면서 set으로 설정을 보기의 답변으로 할거야
			shPollDao.makePollSub(pollsub);
		}
		
	}

	@Override
	public ShPollDto getPoll(ShPollDto poll) {
		return shPollDao.getPoll(poll);
	}

	@Override
	public List<ShPollSubDto> getPollSubList(ShPollDto poll) {
		return shPollDao.getPollSubList(poll);
	}

	@Override
	public void polling(ShVoter voter) {
		shPollDao.pollingVoter(voter);		//투표 한다음에 생기는 거임
		shPollDao.pollingPoll(voter);		//토탈 올려줌
		shPollDao.pollingSub(voter);		//어디에 투표했는지 acount 를 하나 올려줌
	}
	
	



}
