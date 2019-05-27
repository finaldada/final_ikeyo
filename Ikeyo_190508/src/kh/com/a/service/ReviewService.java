package kh.com.a.service;

import java.util.List;

import kh.com.a.model.ReviewDto;

public interface ReviewService {
	public boolean reviewWrite(ReviewDto dto);
	public List<ReviewDto> reviewList(String model_id);
	public ReviewDto getreview(int rev_seq);
	public boolean reviewUpdate(ReviewDto dto);
}
