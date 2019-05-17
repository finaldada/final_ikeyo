package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.CustomDao;
import kh.com.a.model.CustomDto;
import kh.com.a.model.NoticeParam;
import kh.com.a.service.CustomService;

@Service
public class CustomServiceImpl implements CustomService {
	
	@Autowired
	CustomDao customDao;

	@Override
	public List<CustomDto> getCustomList(NoticeParam param) {
		return customDao.getCustomList(param);
	}

	@Override
	public int getCustomCount(NoticeParam param) {
		return customDao.getCustomCount(param);
	}

	@Override
	public boolean uploadCustom(CustomDto cust) {
		return customDao.uploadCustom(cust);
	}
	
	
	
	
}
