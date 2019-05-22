package kh.com.a.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.com.a.model.CartDto;
import kh.com.a.model.InventoryDto;
import kh.com.a.model.PagingParam;
import kh.com.a.model.ProductDto;
import kh.com.a.model.ReviewDto;
import kh.com.a.service.InventoryService;
import kh.com.a.service.ProductService;
import kh.com.a.service.ReviewService;
import kh.com.a.util.FUpUtil;

@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired		// 스프링프레임워크를 통해서 자동 생성  Service생성-> 
	InventoryService inventoryService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ReviewService reviewService;
	
	// 상품 리스트 출력
	@RequestMapping(value = "productList.do", method = RequestMethod.GET)
	public String productList(Model model, String category, PagingParam param) {
		logger.info("ProductController productList " + new Date());
		
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage()+1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		
		System.out.println("sn : " + sn);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		param.setStart(start);
		param.setEnd(end);
		param.setCategory(category);
		
		List<ProductDto> productList = productService.getProductPagingList(param);
		int totalRecordCount = productService.getProductCount(param);
				//productService.getProductList(category);
		List<CartDto> cartList = productService.getCartList(category);
		
		model.addAttribute("productList", productList);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 8);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("category", param.getCategory());
		model.addAttribute("cartList", cartList);
		
		return "productList.tiles";
	}
	
	// 위시리스트 업데이트
	@ResponseBody
	@RequestMapping(value = "updateWish.do", method = RequestMethod.POST)
	public Map<String, Object> updatewish(String model_id, String id, Model model) throws Exception {
		logger.info("ProductController updateWish " + new Date());
		
		CartDto cart = new CartDto();
		cart.setModel_id(model_id);
		cart.setId(id);
		
		int cnt = productService.checkWish(cart);
		int wishCnt = 0;
		boolean isExist = false;
		String result = "";
		Map<String, Object> map = new HashMap<>();
		
		if(cnt == 0){
			productService.updateCount(model_id);
			wishCnt = productService.selectCount(model_id);
			result = productService.updateWish(cart);
			isExist = true;
			map.put("result", result);
			map.put("isExist", isExist);
			map.put("wishCnt", wishCnt);
		} else {
			productService.deleteCount(model_id);
			wishCnt = productService.selectCount(model_id);
			result = productService.deleteWish(cart);
			map.put("result", result);
			map.put("isExist", isExist);
			map.put("wishCnt", wishCnt);
		}
		return map;
	}
	
	// 상품등록페이지 가기
	@RequestMapping(value = "productAdd.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String ProductAdd(Model model) {

		// 재고 리스트 받아오기
		List<InventoryDto> invenlist = inventoryService.getInventoryList();
		System.out.println("dddd:");
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

		String category = productDto.getCategory();
		System.out.println("ProductWrite category : " + category);
		
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
			
			category = URLEncoder.encode(category, "UTF-8"); 
            System.out.println("category: " + category);
			
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
		
		return "redirect:/productList.do?category=" + category;
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
	
	// 상품 디테일
	@RequestMapping(value="productDetail.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String productDetila(String model_id, Model model) {
		System.out.println("model_id : " + model_id);
		
		// 상품받아오기
		ProductDto pdto = productService.getProduct(model_id);		
		model.addAttribute("pdto", pdto);		
		
		// 재고 받아오기
		InventoryDto idto = productService.getinven(model_id);
		model.addAttribute("idto", idto);
		
		// 상품평 받아오기
		List<ReviewDto> rlist = reviewService.reviewList(model_id);
		model.addAttribute("rlist", rlist);
		
		return "productDetail.tiles";
	}
	
	// 파일 다운로드
	@RequestMapping(value="productfileDownload.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String fileDownload(String pdf_af, String model_id, Model model) {
		logger.info("ProductController fileDownload " + new Date());
		
		// download 경로
		// tomcat
		//String fupload = req.getServletContext().getRealPath("/upload");
				
		// file
		String fupload = "C:\\final_file";
		
		File downloadFile = new File(fupload + "/" + pdf_af);
		
		model.addAttribute("downloadFile", downloadFile);
		
		
		return "downloadView";	// servlet-context.xml의 bean으로 감
	}
}
