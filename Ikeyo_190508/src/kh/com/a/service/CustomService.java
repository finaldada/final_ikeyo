package kh.com.a.service;

import java.util.List;

import kh.com.a.model.CustomDto;
import kh.com.a.model.NoticeParam;

public interface CustomService {
	
	// 리스트불러오기
	public List<CustomDto> getCustomList(NoticeParam param);
	public int getCustomCount(NoticeParam param);
	// 글쓰기
	public boolean uploadCustom(CustomDto cust);
	
}
