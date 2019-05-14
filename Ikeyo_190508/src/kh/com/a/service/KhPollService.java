package kh.com.a.service;

import java.util.List;

import kh.com.a.model.PollBean;
import kh.com.a.model.PollDto;
import kh.com.a.model.PollSubDto;
import kh.com.a.model.Voter;

public interface KhPollService {
	
	public List<PollDto> getPollAllList(String id);
	
	public void makePoll(PollBean pbean);
	
	// 투표전
	public PollDto getPoll(PollDto poll);
	public List<PollSubDto> getPollSubList(PollDto poll);
	
	// 투표후(한방에함)
	public void polling(Voter voter);		

}
