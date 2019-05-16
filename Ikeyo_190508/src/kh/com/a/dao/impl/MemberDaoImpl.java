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
	public boolean memberInsert(MemberDto mem) {
		int n = sqlSession.insert(ns + "memberInsert", mem);
		
		return n>0 ? true : false;
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
	
	
}
