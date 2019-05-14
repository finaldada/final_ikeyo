package kh.com.a.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.jni.Pool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.KhPollDao;
import kh.com.a.model.PollBean;
import kh.com.a.model.PollDto;
import kh.com.a.model.PollSubDto;
import kh.com.a.model.Voter;
import kh.com.a.service.KhPollService;

@Service
public class KhPollServiceImpl implements KhPollService {
	
	@Autowired
	KhPollDao khPollDao;
	
	@Override
	public List<PollDto> getPollAllList(String id) {		
		
		// 모든 투표 목록을 가져온다
		List<PollDto> list = khPollDao.getPollAllList();
		
		// 투표를 할 수 있는 항목과 없는 항목으로 정리할 목록
		List<PollDto> plist = new ArrayList<PollDto>();
		
		for (PollDto poll : list) {
			int pollid = poll.getPollid();	//	투표번호
			
			int count = khPollDao.isVote(new Voter(pollid, -1, id));
			
			if(count == 1) {	// 투표를 했을때
				poll.setVote(true);
			}else {		// 투표를 안 했을때
				poll.setVote(false);
			}
			plist.add(poll);	// 리스트에 추가 해서 			
		}
		
		return plist;
	}

	@Override
	public void makePoll(PollBean pbean) {
		
		// 질문 항목
		PollDto poll = new PollDto(pbean.getId(), 
								   pbean.getQuestion(), 
								   pbean.getSdate(), 
								   pbean.getEdate(), 
								   pbean.getItemcount(), 
								   0);
		// DB insert
		khPollDao.makePoll(poll);	// 디비에 질문을 넣음
		
		// 보기들
		int itemcount = pbean.getItemcount();	// 보기의 갯수 구하기
		String answer[] = pbean.getPollnum();	// 질문들
		
		for(int i = 0; i < itemcount; i++) {
			PollSubDto pollsub = new PollSubDto(); 
			pollsub.setAnswer(answer[i]);
			khPollDao.makePollSub(pollsub);		// 			
		}		
	}

	@Override
	public PollDto getPoll(PollDto poll) {
		return khPollDao.getPoll(poll);
	}

	@Override
	public List<PollSubDto> getPollSubList(PollDto poll) {	
		return khPollDao.getPollSubList(poll);
	}

	@Override
	public void polling(Voter voter) {
		khPollDao.pollingVoter(voter);
		khPollDao.pollingPoll(voter);
		khPollDao.pollingSub(voter);		
	}
	
	
	
	
	
	

}
