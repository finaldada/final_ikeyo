package kh.com.a.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.a.model.MemberDto;
import kh.com.a.service.MemberService;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() {
		logger.info("MemberController login " + new Date());
		
		return "login.tiles";
	}
	
	@RequestMapping(value = "regi.do", method = RequestMethod.GET)
	public String regi() {
		logger.info("MemberController regi " + new Date());
		
		return "regi.tiles";
	}
	
	@RequestMapping(value = "regiAf.do", method = RequestMethod.POST)
	public String regiAf(MemberDto mem) throws Exception {
		logger.info("MemberController regiAf " + new Date());
		
		boolean b = memberService.memberInsert(mem);
		if(b){
			return "redirect:/login.do";
		} else{
			return "redirect:/regi.do";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "idcheck.do", produces = "application/String; charset=UTF-8", method = RequestMethod.POST)
	public String idcheck(String id){
		logger.info("MemberController idcheck " + new Date());
		
		String check = memberService.idcheck(id);
		String str = "";
		
		if(check == null){
			str = "OK";
			return str;
		} else{
			str = "NO";
			return str;
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "emailcheck.do", produces = "application/String; charset=UTF-8", method = RequestMethod.POST)
	public String emailcheck(String email) {
		logger.info("MemberController emailcheck " + new Date());
		
		String check = memberService.emailcheck(email);
		String str = "";
		
		if(check == null){
			str = "OK";
			return str;
		} else{
			str = "NO";
			return str;
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "phonecheck.do", produces = "application/String; charset=UTF-8", method = RequestMethod.POST)
	public String phonecheck(String phone) {
		logger.info("MemberController emailcheck " + new Date());
		
		String check = memberService.phonecheck(phone);
		String str = "";
		
		if(check == null){
			str = "OK";
			return str;
		} else{
			str = "NO";
			return str;
		}
	}
	
	@RequestMapping(value = "loginAf.do", method = RequestMethod.POST)
	public String loginAf(MemberDto mem, HttpServletRequest request){
		logger.info("MemberController loginAf " + new Date());
		
		MemberDto login = memberService.login(mem);
		if(login != null && !login.getId().equals("")){
			request.getSession().setAttribute("login", login);
			
			return "test.tiles";
		} else{
			return "error.tiles";
		}
	}
}
