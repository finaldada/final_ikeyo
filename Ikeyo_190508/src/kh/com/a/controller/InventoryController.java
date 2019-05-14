package kh.com.a.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.a.model.InventoryDto;
import kh.com.a.service.InventoryService;

@Controller
public class InventoryController {
	
	@Autowired
	InventoryService inventoryService;
	
	@RequestMapping(value ="inventorylist.do", method = {RequestMethod.GET, RequestMethod.POST })
	public String inventorylist(Model model) {
		
	List<InventoryDto> invenlist = inventoryService.getInventoryList();
		
		model.addAttribute("invenlist", invenlist);
		
		
		return "inventorylist.tiles";
	}
	
	
	@RequestMapping(value = "inventorywrite.do", method = {RequestMethod.GET, RequestMethod.POST })
	public String inventorywrite() {
		
		return "inventorywrite.tiles";
	}
	
	@RequestMapping(value = "inventorywriteAf.do", method = {RequestMethod.GET, RequestMethod.POST })
	public String inventorywriteAf(InventoryDto dto) {
		
		boolean isS = inventoryService.inventoryWrite(dto);
		
		System.out.println(dto.toString());
		
		if(isS) {
			System.out.println("인벤토리글쓰기 성공");
			return "redirect:/inventorylist.do"; 
		}else {
			System.out.println("인벤토리글쓰기 실패");
			return "redirect:/inventorywrite.do";
		}
		
		
	}
	
	@RequestMapping(value="inventorydetail.do", method = {RequestMethod.GET, RequestMethod.POST} )
	public String inventorydetail(InventoryDto dto, Model model) {
		
		InventoryDto inven = inventoryService.inventoryDetail(dto);
		model.addAttribute("inven", inven);
		
		return "inventorydetail.tiles";
		
	}
	
	@ResponseBody
	@RequestMapping(value="inventoryCheck.do", 
					produces = "application/String; charset=utf-8",
				   method= {RequestMethod.GET, RequestMethod.POST})
	public String inventoryCheck(String model_id) {
		
		String str = inventoryService.inventoryCheck(model_id);
		System.out.println("str:" + str);
		if(str == null) {
			String msg = "OK";  // 한글 깨짐  String으로 받을때는 value와 method 사이에 produces를 추가해주어야 한다 
			return msg;  
			
		}else {			
			
			String msg = "이미 등록된 모델명입니다";
			return msg;  
		}
		
		
	}
	
	@RequestMapping(value="inventoryupdate.do", method={RequestMethod.GET, RequestMethod.POST})
	public String inventoryupdate(InventoryDto dto, Model model) {
		
		System.out.println(dto.toString());
		InventoryDto inven = inventoryService.inventoryDetail(dto);
		
		model.addAttribute("inven", inven);
		return "inventoryupdate.tiles";
	}
	
	@RequestMapping(value="inventoryupdateAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String inventoryupdateAf(InventoryDto dto) {
		
		boolean isS = inventoryService.inventoryUpdate(dto);
		
		if(isS) {
			System.out.println("인벤토리 업데이트성공");
			return "redirect:/inventorylist.do";
		}else {
			System.out.println("인벤토리 업데이트실패");
			return "redirect:/inventoryupdate.do";
		}
		
	}
	
	
	
}
