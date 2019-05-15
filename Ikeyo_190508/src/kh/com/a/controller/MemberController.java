package kh.com.a.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.a.model.BbsParam;

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
		
		if(login.getAuthstatus() == 0) {
			model.addAttribute("email_check", 0);
			return "emailConfirm.tiles";
		} else {
			if(login != null && !login.getId().equals("")){
				request.getSession().setAttribute("login", login);
				
				return "main.tiles";
			} else {
				return "error.tiles";
			}
		}
	}
	
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		logger.info("MemberController logout " + new Date());
		
		req.getSession().invalidate();
		
		return "login.tiles";
	}
	
	//   회원 관리 !! 
	@RequestMapping(value = "memberlist.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String memberlist(Model model, BbsParam param) {
		
		
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		List<MemberDto> memberlist = memberService.getMemberList(param); 
		int totalRecordCount = memberService.getMemberCount(param);
		
		model.addAttribute("memberlist", memberlist);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10); 
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		
		return "memberlist.tiles";
	}
	
	@RequestMapping(value = "memberdel.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String memberDel(String id) {
		
		boolean isS = memberService.memberDel(id);
		if(isS) {
			
			System.out.println(id + "회원 정보 삭제 성공 ");
			return "redirect:/memberlist.do";
		}else {
			
			System.out.println(id + "회원 정보 삭제 실패 ");
			return "redirect:/memberlist.do";
		}
		
		
	}
	
	@RequestMapping(value = "mypage.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String mypage() {
		
		
		
		return "adminmain.tiles";
	}
}
