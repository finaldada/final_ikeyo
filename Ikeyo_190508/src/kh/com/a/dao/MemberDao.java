package kh.com.a.dao;

import kh.com.a.model.MemberDto;

public interface MemberDao {
	public boolean memberInsert(MemberDto mem);
	public String idcheck(String id);
	public String emailcheck(String email);
	public String phonecheck(String phone);
	public MemberDto login(MemberDto mem);
}
