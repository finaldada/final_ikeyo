package kh.com.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.MemberDao;
import kh.com.a.model.MemberDto;
import kh.com.a.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao memberDao;

	@Override
	public boolean memberInsert(MemberDto mem) {
		
		return memberDao.memberInsert(mem);
	}

	@Override
	public String idcheck(String id) {
		
		return memberDao.idcheck(id);
	}
	
	@Override
	public String emailcheck(String email) {
		
		return memberDao.emailcheck(email);
	}
	
	@Override
	public String phonecheck(String phone) {
		
		return memberDao.phonecheck(phone);
	}

	@Override
	public MemberDto login(MemberDto mem) {
		
		return memberDao.login(mem);
	}
	
	
}
