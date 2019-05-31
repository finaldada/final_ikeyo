package kh.com.a.service;

import kh.com.a.model.MemberDto;

public interface MemberService {
	public void memberInsert(MemberDto mem) throws Exception;
	public String idcheck(String id);
	public String emailcheck(String email);
	public String phonecheck(String phone);
	public MemberDto login(MemberDto mem);
	public void updateAuthKey(MemberDto mem) throws Exception;
	public void userAuth(String email) throws Exception;
	public MemberDto findId(MemberDto mem);
	public void findPwd(MemberDto mem) throws Exception;
	public void naverLogin(MemberDto mem);
	public int naverLoginCount(MemberDto mem);
	public MemberDto naverEmailCheck(MemberDto mem);
}
