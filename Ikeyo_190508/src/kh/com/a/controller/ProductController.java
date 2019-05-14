package kh.com.a.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.a.model.CartDto;
import kh.com.a.model.PagingParam;
import kh.com.a.model.ProductDto;
import kh.com.a.service.ProductService;

@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "productList.do", method = RequestMethod.GET)
	public String productList(Model model, String category, PagingParam param) {
		logger.info("ProductController productList " + new Date());
		
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage()+1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
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
}
