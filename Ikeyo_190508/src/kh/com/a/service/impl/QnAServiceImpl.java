package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.QnADao;
import kh.com.a.model.QnADto;
import kh.com.a.service.QnAService;

@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	QnADao qnADao;

	@Override
	public boolean qnaWrite(QnADto dto) {
		return qnADao.qnaWrite(dto);
	}

	@Override
	public List<QnADto> qnaList(int parent) {
		return qnADao.qnaList(parent);
	}

	@Override
	public List<QnADto> qnaListAll() {
		return qnADao.qnaListAll();
	}

	@Override
	public boolean qnaAnswer(QnADto dto) {
		return qnADao.qnaAnswer(dto);
	}
	
	
	
	
	
	
	
	
}
