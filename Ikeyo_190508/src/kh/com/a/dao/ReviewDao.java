package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.ReviewDto;

public interface ReviewDao {
	public boolean reviewWrite(ReviewDto dto);
	
	public List<ReviewDto> reviewList(String model_id);
	
}
