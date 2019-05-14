package kh.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.ProductDao;
import kh.com.a.model.ProductDto;

@Repository
public class ProductDaoImpl implements ProductDao{

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Product.";
	
	@Override
	public boolean productAdd(ProductDto productDto) {
		
		int n = sqlSession.insert(ns + "productAdd", productDto);
		
		return n>0?true:false;
	}
	
	

}
