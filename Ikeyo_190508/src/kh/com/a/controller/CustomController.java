package kh.com.a.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kh.com.a.model.CustomDto;
import kh.com.a.model.NoticeParam;
import kh.com.a.service.CustomService;
import kh.com.a.util.FUpUtil;

@Controller
public class CustomController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomController.class);
	
	@Autowired
	CustomService customService;
	
	@RequestMapping(value="customlist.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getCustomList(Model model, NoticeParam param) {
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		List<CustomDto> customlist = customService.getCustomList(param);
		
		// 글의 총 갯수
		int totalRecordCount = customService.getCustomCount(param);
		
		System.out.println("customlist:" + customlist.size());
		
		model.addAttribute("customlist", customlist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		return "customlist.tiles";
	}
	
	@RequestMapping(value="customwrite.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String customwrite() {
		return "customwrite.tiles";
	}
	
	@RequestMapping(value="customwriteAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String customwriteAf(CustomDto cust, 
								@RequestParam(value="fileload", required=false)MultipartFile fileload, 
								HttpServletRequest req) {
		
		System.out.println(cust.getCust_seq());
		System.out.println(cust.getId());
		System.out.println(cust.getTitle());
		System.out.println(cust.getContent());
		System.out.println(cust.getLock_());
		
		
		
		// filename을 취득
		String filename = fileload.getOriginalFilename();
		cust.setFilename(filename);
		System.out.println(cust.getFilename());
		
		// file
		String fupload = "c:\\final_file";
		
		// 파일명.xxx -> 12232132.xxx
		String f = cust.getFilename();
		String newfilename = FUpUtil.getNewFile(f);
		
		cust.setFilename(newfilename);
		
		File file = new File(fupload + "/" + newfilename);
		logger.info("upload 파일경로: " + fupload + "/" + newfilename);
		
		try {
			// 실제 파일 업로드 부분
			// io 소속 ( 실제파일을 기입해주는 역할 )
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// DB 저장
			customService.uploadCustom(cust);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/customlist.do";
	}
	
	
	
	
	
	
	
}
