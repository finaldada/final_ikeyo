package kh.com.a.controller;

import java.io.File;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kh.com.a.model.ReviewDto;
import kh.com.a.service.ProductService;
import kh.com.a.service.ReviewService;
import kh.com.a.util.FUpUtil;

@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;

	@Autowired
	ProductService productService;
	
	
	@RequestMapping(value="reviewWriteAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String reviewWrite(ReviewDto rdto,
					@RequestParam(value="fileload", required = false)MultipartFile fileload, Model model ) {
		System.out.println(rdto.toString());
		
		// 파일이름 취득
		String filename = fileload.getOriginalFilename();

		rdto.setPhoto_bf(filename);
		// file
		String fupload = "c:\\final_file";
		
		try {
			if(filename != null && filename != "") {
				// 파일명.xxx -> 12221321.xxx
				String f = rdto.getPhoto_bf();
				String newfilename = FUpUtil.getNewFile(f);	
				rdto.setPhoto_af(newfilename);
				
				File file = new File(fupload + "/" + newfilename);	// 파일을 생성	
				// 실제 파일 업로드 부분 
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				
				System.out.println("upload 파일경로 : " + fupload + "/" + newfilename);
			}
			// DB에 저장
			reviewService.reviewWrite(rdto);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "redirect:/productDetail.do?model_id=" + rdto.getModel_id()+"";
	}


}
