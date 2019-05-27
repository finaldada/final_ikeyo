package kh.com.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.MyPageDao;
import kh.com.a.model.MemberDto;
import kh.com.a.service.MyPageService;

@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	MyPageDao myPageDao;

	@Override
	public MemberDto myInfo(MemberDto dto) {
		
		return myPageDao.myInfo(dto);
	}

	@Override
	public MemberDto checkPwd(MemberDto dto) {
		
		return myPageDao.checkPwd(dto);
	}

	@Override
	public boolean myInfoUpdate(MemberDto dto) {
		
		return myPageDao.myInfoUpdate(dto);
	}

	@Override
	public String phoneCheck(MemberDto dto) {
		
		return myPageDao.phoneCheck(dto);
	}

	@Override
	public MemberDto myPhone(MemberDto dto) {
		
		return myPageDao.myPhone(dto);
	}

	@Override
	public boolean myInfoUp(MemberDto dto) {
		
		return myPageDao.myInfoUp(dto);
	}
	
}
