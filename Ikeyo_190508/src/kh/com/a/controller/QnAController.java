package kh.com.a.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.a.model.QnADto;
import kh.com.a.service.QnAService;

@Controller
public class QnAController {

	@Autowired
	QnAService qnAService;
	
	@RequestMapping(value = "qnaWrite.do", method = {RequestMethod.GET, RequestMethod.POST })
	public String qnaWrite(QnADto dto,String model_id) {
		
		System.out.println(dto.toString());
		
		boolean isS = qnAService.qnaWrite(dto);
		
		if(isS) {
			System.out.println("qnaWrite 성공!");
			return "redirect:/productDetail.do?model_id=" + model_id; 
		}else {
			System.out.println("qnaWrite 실패!");
			return "redirect:/productDetail.do?model_id=" + model_id;
		}
	}
	
	// 전체 qna리스트
	@RequestMapping(value="qnaListAll.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String qnaListAll(Model model) {
	
		System.out.println("아이고");
		
		// 전체 qna리스트
		List<QnADto> list = qnAService.qnaListAll();
		model.addAttribute("list", list);
	
		return "";
	}
	
	// qna 답글쓰기
	@RequestMapping(value="qnaAnswer.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String qnaAnswer(QnADto dto, String model_id) {
		boolean isS = qnAService.qnaAnswer(dto);
		
		if(isS) {
			System.out.println("qna답글달기 성공!");
			return "redirect:/productDetail.do?model_id=" + model_id; 
		}else {
			System.out.println("qna답글달기 실패!");
			return "redirect:/productDetail.do?model_id=" + model_id;
		}
	}
	
	
}
