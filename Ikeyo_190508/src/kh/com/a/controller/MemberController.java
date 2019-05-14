package kh.com.a.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		
		memberService.memberInsert(mem);
		
		return "redirect:/login.do";
	}
	
	@RequestMapping(value = "emailConfirm.do", method = RequestMethod.GET)
	public String emailConfirm(String email, Model model) throws Exception {
		logger.info("MemberController emailConfirm " + new Date());
		
		memberService.userAuth(email);
		
		model.addAttribute("email_check", 1);
		
		return "emailConfirm.tiles";
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
	public String loginAf(MemberDto mem, HttpServletRequest request, Model model){
		logger.info("MemberController loginAf " + new Date());
		
		MemberDto login = memberService.login(mem);
		
		
		if(login != null && !login.getId().equals("")) {
			if(login.getAuthstatus() == 0) {
				model.addAttribute("email_check", 0);
				
				return "emailConfirm.tiles";
			}
			
			request.getSession().setAttribute("login", login);
			
			return "main.tiles";
		} else {
			return "error.tiles";
		}
	}
	
	@RequestMapping(value = "findId.do", method = RequestMethod.GET)
	public String findId() {
		logger.info("MemberController findId " + new Date());
		
		return "findId.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "findIdAf.do", produces = "application/String; charset=UTF-8", method = RequestMethod.POST)
	public String findIdAf(MemberDto mem) {
		logger.info("MemberController findIdAf " + new Date());
		
		MemberDto memdto = memberService.findId(mem); 
		String id = "";
		
		if(memdto != null) {
			id = memdto.getId();
			
			return id;
		} else {
			id = "NO";
			
			return id;
		}
	}
	
	@RequestMapping(value = "findPwd.do", method = RequestMethod.GET)
	public String findPwd() {
		logger.info("MemberController findPwd " + new Date());
		
		return "findPwd.tiles";
	}
	
	@RequestMapping(value = "findPwdAf.do", method = RequestMethod.POST)
	public String findPwd(MemberDto mem) {
		logger.info("MemberController findPwdAf " + new Date());
		
		//memberService.findPwd(mem);
		
		return "";
	}
	
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		logger.info("MemberController logout " + new Date());
		
		req.getSession().invalidate();
		
		return "login.tiles";
	}
}
