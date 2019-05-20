package kh.com.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.CalendarDao;
import kh.com.a.model.CalendarDto;
import kh.com.a.service.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	CalendarDao calendarDao;
	
	// calwrite
	@Override
	public boolean calwrite(CalendarDto dto) {
		
		return calendarDao.calwrite(dto);
		
	}

}
