package kh.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.AllOrderDao;


@Repository
public class AllOrderDaoImpl implements AllOrderDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "AllOrder.";
	
	
	
}
