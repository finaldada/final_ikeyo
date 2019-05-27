package kh.com.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.AllOrderDao;
import kh.com.a.service.AllOrderService;


@Service
public class AllOrderServiceImpl implements AllOrderService {

	@Autowired
	AllOrderDao allOrderDao;
}
