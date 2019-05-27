package kh.com.a.dao;

import kh.com.a.model.MemberDto;

public interface MyPageDao {
	public MemberDto myInfo(MemberDto dto);
	public MemberDto checkPwd(MemberDto dto);
	public boolean myInfoUpdate(MemberDto dto);
	public String phoneCheck(MemberDto dto);
	public MemberDto myPhone(MemberDto dto);
	public boolean myInfoUp(MemberDto dto);
}
