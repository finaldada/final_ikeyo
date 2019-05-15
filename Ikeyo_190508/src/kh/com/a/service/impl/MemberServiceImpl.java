package kh.com.a.service.impl;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.com.a.dao.MemberDao;
import kh.com.a.model.MemberDto;
import kh.com.a.service.MemberService;
import kh.com.a.util.MailHandler;
import kh.com.a.util.TempKey;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao memberDao;
	
	@Inject
	JavaMailSender mailSender;
	
	@Transactional
	@Override
	public void memberInsert(MemberDto mem) throws Exception {
		memberDao.memberInsert(mem);
		
		// 임의의 authKey 생성
		String authKey = new TempKey().getKey(50, false);
		
		mem.setAuthkey(authKey);
		
		System.out.println("authKey: " + authKey);
		
		memberDao.updateAuthKey(mem);
		
		// mail 작성 관련
		MailHandler sendMail = new MailHandler(mailSender);
		
		sendMail.setSubject("[ikeyo] 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://192.168.110.129:8090/Ikeyo_190508/emailConfirm.do")
				.append("?email=")
				.append(mem.getEmail())
				.append("&authkey=")
				.append(authKey)
				.append("' target='_blank'>이메일 인증 확인</a>")
				.toString());
		sendMail.setFrom("khaclass190612@gmail.com ", "ikeyo 관리자");
		sendMail.setTo(mem.getEmail());
		sendMail.send();
	}

	@Override
	public String idcheck(String id) {
		
		return memberDao.idcheck(id);
	}
	
	@Override
	public String emailcheck(String email) {
		
		return memberDao.emailcheck(email);
	}
	
	@Override
	public String phonecheck(String phone) {
		
		return memberDao.phonecheck(phone);
	}

	@Override
	public MemberDto login(MemberDto mem) {
		
		return memberDao.login(mem);
	}

	@Override
	public void updateAuthKey(MemberDto mem) throws Exception {
		
		memberDao.updateAuthKey(mem);
	}

	@Override
	public void userAuth(String email) throws Exception {
		
		memberDao.userAuth(email);
	}

	@Override
	public MemberDto findId(MemberDto mem) {
		
		return memberDao.findId(mem);
	}
	
}