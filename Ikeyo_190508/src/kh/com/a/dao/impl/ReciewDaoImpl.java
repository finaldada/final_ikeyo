package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.ReviewDao;
import kh.com.a.model.ReviewDto;

@Repository
public class ReciewDaoImpl implements ReviewDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Review.";

	@Override
	public boolean reviewWrite(ReviewDto dto) {
		int n = sqlSession.insert(ns + "reviewWrite", dto);
		
		return n>0?true:false;
	}

	@Override
	public List<ReviewDto> reviewList(String model_id) {
		
		List<ReviewDto> list = sqlSession.selectList(ns + "reviewList", model_id);
		
		return list;
	}
	
	
	
	
	
}
