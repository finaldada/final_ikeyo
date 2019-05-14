package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.PollDto;
import kh.com.a.model.PollSubDto;
import kh.com.a.model.Voter;

public interface KhPollDao {
	
	public List<PollDto> getPollAllList();
	public int isVote(Voter voter);
	
	public void makePoll(PollDto poll);	// 투표항목만들기
	public void makePollSub(PollSubDto pollsub);	// 투표보기만들기
	
	// 투표전
	public PollDto getPoll(PollDto poll);	// 항목
	public List<PollSubDto> getPollSubList(PollDto poll);	// 항목 보기들
	// 투표후
	public void pollingVoter(Voter voter);	// 투표자 
	public void pollingPoll(Voter voter);	// 
	public void pollingSub(Voter voter);	//
	
}
