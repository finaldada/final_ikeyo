package kh.com.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.ProductDao;
import kh.com.a.model.ProductDto;
import kh.com.a.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDao productDao;

	@Override
	public boolean productAdd(ProductDto productDto) {		
		return productDao.productAdd(productDto);
	}
	
	
	

}
