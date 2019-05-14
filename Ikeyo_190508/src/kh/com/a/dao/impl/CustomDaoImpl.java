package kh.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.CustomDao;

@Repository
public class CustomDaoImpl implements CustomDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String ns = "Custom.";
	
	
	
	
	
}
