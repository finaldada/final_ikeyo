package kh.com.a.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.a.model.MemberDto;
import kh.com.a.service.MyPageService;

@Controller
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	MyPageService myPageService;
	
	@RequestMapping(value = "myInfoGo.do", method = RequestMethod.GET)
	public String myInfoGo() {
		logger.info("myInfoGO() RUN! / Run Time: " + new Date());
		
		return "myInfoGo.tiles";
	}
	
	@RequestMapping(value = "myInfoGoAf.do", method = RequestMethod.POST)
	public String myInoGoAf(@RequestParam String pwd, HttpServletRequest req) {
		logger.info("myInfoGOAf() RUN! / Run Time: " + new Date());
		
		MemberDto dto = (MemberDto)req.getSession().getAttribute("login");
		dto.setPwd(pwd);

		MemberDto checkPwd = myPageService.checkPwd(dto);
		
		if(checkPwd == null) {
			return "errorPwd.tiles";
		} else {
			return "redirect:/myInfo.do";
		}
	}
	
	@RequestMapping(value = "myInfo.do", method = RequestMethod.GET)
	public String myInfo(Model model, HttpServletRequest req) {
		logger.info("myInfo() RUN! / Run Time: " + new Date());
		
		MemberDto dto = (MemberDto)req.getSession().getAttribute("login");
		
		MemberDto mem = myPageService.myInfo(dto);
		
		model.addAttribute("mem", mem);
		
		return "myInfo.tiles";
	}
	
	@RequestMapping(value = "myInfoAf.do", method = {RequestMethod.POST})
	public String myInfoAf(MemberDto dto) {
		logger.info("myInfoAf() RUN! / Run Time: " + new Date());
		
		MemberDto mem = myPageService.myPhone(dto);
		String check = myPageService.phoneCheck(dto);
		boolean b = false;
		
		if(mem != null) {
			b = myPageService.myInfoUp(dto);	// 폰 번호를 변경 안할시
		} else {
			if(check == null){
				b = myPageService.myInfoUpdate(dto);	// 폰 번호 변경시
			}
		}
		if(b) {
			return "redirect:/login.do";
		} else {
			return "myInfo.do";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "myInfoPhone.do", method = RequestMethod.POST)
	public Map<String, Object> phonecheck(MemberDto dto, Model model) {
		logger.info("myInfoPhone() RUN! / Run Time: " + new Date());
		
		System.out.println("phone=" + dto.getPhone());
		
		MemberDto mem = myPageService.myPhone(dto);
		
		String check = myPageService.phoneCheck(dto);
		String str = "";
		Map<String, Object> map = new HashMap<>();
		
		if(mem != null) {
			str = "MYPHONE";
			map.put("MY", str);
		} else {
			if(check == null){
				str = "OK";
				map.put("OK", str);
			} else{
				str = "NO";
				map.put("NO", str);
			}
		}
		return map;
	}
}
