package kh.com.a.dao;


import java.util.List;
import kh.com.a.model.BbsParam;
import kh.com.a.model.MemberDto;


public interface MemberDao {
	
	public void memberInsert(MemberDto mem);
	public String idcheck(String id);
	public String emailcheck(String email);
	public String phonecheck(String phone);
	public MemberDto login(MemberDto mem);
	public void updateAuthKey(MemberDto mem) throws Exception;
	public void userAuth(String email) throws Exception;
	public MemberDto findId(MemberDto mem);
	public List<MemberDto> memberList();
	public List<MemberDto> getMemberList(BbsParam param);
	public int getMemberCount(BbsParam param);
	public boolean memberDel(String id);
}

