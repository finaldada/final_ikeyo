package kh.com.a.service;

import kh.com.a.model.MemberDto;

public interface MyPageService {
	public MemberDto myInfo(MemberDto dto);
	public MemberDto checkPwd(MemberDto dto);
	public boolean myInfoUpdate(MemberDto dto);
	public String phoneCheck(MemberDto dto);
	public MemberDto myPhone(MemberDto dto);
	public boolean myInfoUp(MemberDto dto);
}
package kh.com.a.service;

import java.util.List;

import kh.com.a.model.MemberDto;
import kh.com.a.model.PagingParam;
import kh.com.a.model.ProductDto;
import kh.com.a.model.QnADto;
import kh.com.a.model.ReviewDto;

public interface MyPageService {
	public MemberDto myInfo(MemberDto dto);
	public MemberDto checkPwd(MemberDto dto);
	public boolean myInfoUpdate(MemberDto dto);
	public String phoneCheck(MemberDto dto);
	public MemberDto myPhone(MemberDto dto);
	public boolean myInfoUp(MemberDto dto);
	
	public List<ReviewDto> getReviewList(MemberDto dto);
	public ProductDto getProductList(ReviewDto dto);
	public List<QnADto> getQnAList(MemberDto dto);
	public ProductDto getProdList(QnADto dto);
	
	public int getReviewCount(MemberDto dto);
	public List<ReviewDto> getReviewPagingList(PagingParam param);
	
	public int getQnACount(MemberDto dto);
	public List<QnADto> getQnAPagingList(PagingParam param);
}
