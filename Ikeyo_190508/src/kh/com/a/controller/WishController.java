package kh.com.a.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.a.dao.WishlistDao;
import kh.com.a.model.CartDto;
import kh.com.a.model.MemberDto;
import kh.com.a.model.ProductDto;
import kh.com.a.service.ProductService;
import kh.com.a.service.WishlistService;

@Controller
public class WishController {
	
	private static final Logger logger = LoggerFactory.getLogger(WishController.class);
	
	 @Autowired
	 WishlistService wishlistService;
	 
	 @Autowired
	 ProductService productService;
	
	 // 리스트
	@RequestMapping(value = "wishList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String wishList(HttpSession session, Model model, HttpServletResponse response) throws Exception {
		
		logger.info("WishController wishList "+ new Date());
	
		List<CartDto> list = wishlistService.wishList();	
		
		List<ProductDto> plist = wishlistService.pList();
		
		// 아이디 가져오기
		MemberDto mem = (MemberDto)session.getAttribute("login");
		if(mem==null) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 정보를 확인해주세요.'); location.href='login.do';</script>");
            out.flush();
		}
			    
			model.addAttribute("wishlist", list);
			model.addAttribute("plist", plist);
			
			return "wishList.tiles";
	}
	
	// 삭제
	   @RequestMapping(value = "wishdel.do", method = {RequestMethod.GET, RequestMethod.POST})
	   public String wishDel(int seq, String model_id)throws Exception {
	      
	      logger.info("WishController wishdel "+ new Date()); 
	      
	      System.out.println(seq);
	      
	      productService.deleteCount(model_id);
	      
	      int isS = wishlistService.wishdel(seq);
	      
	      return "redirect:/wishList.do";
	   
	   }
	   
	   @RequestMapping(value = "wishdeltt.do", method = {RequestMethod.GET, RequestMethod.POST})
	   public String wishdeltt(int[] seqq, String[] model_id, HttpServletRequest req, HttpServletResponse resp, CartDto dto)throws Exception {
	      
	      logger.info("WishController wishdel "+ new Date()); 
	      
	      for(int i = 0; i<seqq.length; i++) {
	         
	         wishlistService.wishdeltt(seqq[i]);
	         productService.deleteCount(model_id[i]);
	      }

	       return "redirect:/wishList.do";
	   
	   }
	
}
