package kh.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.MemberDao;
import kh.com.a.model.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	SqlSession sqlSession;
	String ns = "Member.";

	@Override
	public void memberInsert(MemberDto mem) {
		
		sqlSession.insert(ns + "memberInsert", mem);
	}

	@Override
	public String idcheck(String id) {
		
		return sqlSession.selectOne(ns + "idcheck", id);
	}

	@Override
	public String emailcheck(String email) {
		
		return sqlSession.selectOne(ns + "emailcheck", email);
	}

	@Override
	public String phonecheck(String phone) {
		
		return sqlSession.selectOne(ns + "phonecheck", phone);
	}

	@Override
	public MemberDto login(MemberDto mem) {
		
		return sqlSession.selectOne(ns + "login", mem);
	}

	@Override
	public void updateAuthKey(MemberDto mem) throws Exception {
		
		sqlSession.update(ns + "updateAuthKey", mem);
	}

	@Override
	public void userAuth(String email) throws Exception {
		
		sqlSession.update(ns + "userAuth", email);
	}

	@Override
	public MemberDto findId(MemberDto mem) {
		
		return sqlSession.selectOne(ns + "findId", mem);
	}
	
	
}
