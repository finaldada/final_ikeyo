package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.CustomDao;
import kh.com.a.model.CustomDto;
import kh.com.a.model.NoticeParam;

@Repository
public class CustomDaoImpl implements CustomDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String ns = "Custom.";

	@Override
	public List<CustomDto> getCustomList(NoticeParam param) {
		return sqlSession.selectList(ns + "getCustomList", param);
	}

	@Override
	public int getCustomCount(NoticeParam param) {
		return sqlSession.selectOne(ns + "getCustomCount", param);
	}

	@Override
	public boolean uploadCustom(CustomDto cust) {
		int n = sqlSession.insert(ns + "customupload", cust);
		return n>0?true:false;
	}
	
	
	
	
	
	
}
