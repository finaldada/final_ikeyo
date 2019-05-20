package kh.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.CalendarDao;
import kh.com.a.model.CalendarDto;

@Repository
public class CalendarDaoImpl implements CalendarDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Calendar.";

	// write
	@Override
	public boolean calwrite(CalendarDto dto) {
		
		int n = sqlSession.insert(ns + "calwrite", dto);
		
		return n>0?true:false;
	}
	
	
	

}
