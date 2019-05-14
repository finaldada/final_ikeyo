package kh.com.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.CustomDao;
import kh.com.a.service.CustomService;

@Service
public class CustomServiceImpl implements CustomService {
	
	@Autowired
	CustomDao customDao;
	
	
	
	
}
