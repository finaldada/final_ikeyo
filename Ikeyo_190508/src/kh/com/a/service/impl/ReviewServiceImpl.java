package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.ReviewDao;
import kh.com.a.model.ReviewDto;
import kh.com.a.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDao reviewDao;

	@Override
	public boolean reviewWrite(ReviewDto dto) {
		return reviewDao.reviewWrite(dto);
	}

	@Override
	public List<ReviewDto> reviewList(String model_id) {
		return reviewDao.reviewList(model_id);
	}
	
	
	
	
	
}
