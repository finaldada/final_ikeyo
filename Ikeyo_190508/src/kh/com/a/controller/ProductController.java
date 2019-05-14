package kh.com.a.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.com.a.model.InventoryDto;
import kh.com.a.model.ProductDto;
import kh.com.a.service.InventoryService;
import kh.com.a.service.ProductService;
import kh.com.a.util.FUpUtil;

@Controller
public class ProductController {

	@Autowired		// 스프링프레임워크를 통해서 자동 생성  Service생성-> 
	InventoryService inventoryService;

	@Autowired		// 스프링프레임워크를 통해서 자동 생성  Service생성-> 
	ProductService productService;


	// 상품게시판 리스트 출력
	@RequestMapping(value = "productlist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String ProductList() {		
		return "productlist.tiles";
	}

	// 상품등록페이지 가기
	@RequestMapping(value = "productAdd.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String ProductAdd(Model model) {

		// 재고 리스트 받아오기
		List<InventoryDto> invenlist = inventoryService.getInventoryList();		
		model.addAttribute("invenlist", invenlist);	// 모델에 재고리스트 날려줌

		return "productAdd.tiles";
	}

	// 상품등록(파일업로드)
	@RequestMapping(value = "productAddAf.do", method =RequestMethod.POST)
	public String ProductWrite(ProductDto productDto,
			@RequestParam(value="pdf_bs", required = false)MultipartFile pdf_bf,
			@RequestParam(value="photo_bs1", required = false)MultipartFile photo_bf1,
			@RequestParam(value="photo_bs2", required = false)MultipartFile photo_bf2,
			@RequestParam(value="photo_bs3", required = false)MultipartFile photo_bf3) {
		
		// filename을 취득
		String filename = pdf_bf.getOriginalFilename();
		String filename1 = photo_bf1.getOriginalFilename();
		String filename2 = photo_bf2.getOriginalFilename();
		String filename3 = photo_bf3.getOriginalFilename();

	/*	System.out.println("filename : " + filename);
		if(filename1 == null) {
			System.out.println("filename1 은 \"\"");
		}
		if(filename2 == "") {
			System.out.println("filename2 은 null");
		}
		System.out.println("filename1 : " + filename1);
		System.out.println("filename2 : " + filename2);
		System.out.println("filename3 : " + filename3);
		System.out.println("pdf_bf : " + pdf_bf);
		System.out.println("photo_bf1 : " + photo_bf1);
		System.out.println("photo_bf2 : " + photo_bf2);
		System.out.println("photo_bf3 : " + photo_bf3);*/
		
		productDto.setPdf_bf(filename);
		productDto.setPhoto_bf1(filename1);
		productDto.setPhoto_bf2(filename2);
		productDto.setPhoto_bf3(filename3);

		// upload 경로
		// tomcat
		// String fupload = req.getServletContext().getRealPath("/upload");

		// file
		String fupload = "c:\\final_file";
		
		try {
			
			if(filename != null && filename != "") {
				// 파일명.xxx -> 12221321.xxx
				String f = productDto.getPdf_bf();
				String newfilename = FUpUtil.getNewFile(f);	
				productDto.setPdf_af(newfilename);
				File file = new File(fupload + "/" + newfilename);	// 파일을 생성	
				// 실제 파일 업로드 부분 
				FileUtils.writeByteArrayToFile(file, pdf_bf.getBytes());
				
				System.out.println("upload 파일경로 : " + fupload + "/" + newfilename);
			}
			if(filename1 != null && filename1 != "") {
				// 파일명.xxx -> 12221321.xxx
				String f = productDto.getPhoto_bf1();
				String newfilename = FUpUtil.getNewFile(f);
				productDto.setPhoto_af1(newfilename);
				File file1 = new File(fupload + "/" + newfilename);	// 파일을 생성
				// 실제 파일 업로드 부분 
				FileUtils.writeByteArrayToFile(file1, photo_bf1.getBytes());
			}
			if(filename2 != null && filename2 != "") {
				// 파일명.xxx -> 12221321.xxx
				String f = productDto.getPhoto_bf2();
				String newfilename = FUpUtil.getNewFile(f);
				productDto.setPhoto_af2(newfilename);
				File file2 = new File(fupload + "/" + newfilename);	// 파일을 생성
				// 실제 파일 업로드 부분 
				FileUtils.writeByteArrayToFile(file2, photo_bf2.getBytes());
			}
			if(filename3 != null && filename3 != "") {
				// 파일명.xxx -> 12221321.xxx
				String f = productDto.getPhoto_bf3();
				String newfilename = FUpUtil.getNewFile(f);
				productDto.setPhoto_af3(newfilename);
				File file3 = new File(fupload + "/" + newfilename);	// 파일을 생성
				// 실제 파일 업로드 부분 
				FileUtils.writeByteArrayToFile(file3, photo_bf3.getBytes());
			}

			// DB에 저장
			productService.productAdd(productDto);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/productlist.do";
	}

	// 재고관리가져오는 ajax
	@ResponseBody
	@RequestMapping(value="getinventory.do", method= {RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> productinput(int inven_seq) {
		//System.out.println("inven_seq : " + inven_seq);
		Map<String, Object> invenmap = new HashMap<String, Object>();

		InventoryDto inven = inventoryService.getInventory(inven_seq);
		//System.out.println("inven.model_id : " + inven.getModel_id());
		invenmap.put("model_id", inven.getModel_id()+"");
		invenmap.put("price", inven.getPrice());
		invenmap.put("category", inven.getCategory()+"");
		invenmap.put("count", inven.getCount());

		return invenmap;
	}


}
