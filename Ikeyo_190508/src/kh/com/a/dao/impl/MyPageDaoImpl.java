package kh.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.MyPageDao;
import kh.com.a.model.MemberDto;

@Repository
public class MyPageDaoImpl implements MyPageDao {
	@Autowired
	SqlSession sqlSession;
	String ns = "MyPage.";
	
	@Override
	public MemberDto myInfo(MemberDto dto) {
		
		return sqlSession.selectOne(ns + "myInfo", dto);
	}

	@Override
	public MemberDto checkPwd(MemberDto dto) {
		
		return sqlSession.selectOne(ns + "checkPwd", dto);
	}

	@Override
	public boolean myInfoUpdate(MemberDto dto) {
		int n = sqlSession.update(ns + "myInfoUpdate", dto);
		
		return n>0 ? true : false;
	}

	@Override
	public String phoneCheck(MemberDto dto) {
		
		return sqlSession.selectOne(ns + "phoneCheck", dto);
	}

	@Override
	public MemberDto myPhone(MemberDto dto) {
		
		return sqlSession.selectOne(ns + "myPhone", dto);
	}

	@Override
	public boolean myInfoUp(MemberDto dto) {
		int n = sqlSession.update(ns + "myInfoUp", dto);
		
		return n>0 ? true : false;
	}
	
}
