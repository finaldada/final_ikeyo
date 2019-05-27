package kh.com.a.service;

import java.util.List;

import kh.com.a.model.QnADto;

public interface QnAService {
	
	public boolean qnaWrite(QnADto dto);
	
	public List<QnADto> qnaList(int parent);
	public List<QnADto> qnaListAll();
	
	public boolean qnaAnswer(QnADto dto);

}
