package kh.com.a.controller;

import java.util.Calendar;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.a.model.CalendarDto;
import kh.com.a.service.CalendarService;

@Controller
public class CalController {

private static final Logger logger = LoggerFactory.getLogger(CalController.class);
	
	 @Autowired
	 CalendarService calService;
	
	// calendar.do(달력출력)
	@RequestMapping(value = "calendar.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String calendar(Model model, String year, String month) {
		
		logger.info("CalController calendar "+ new Date());
		
		Calendar cal = Calendar.getInstance();
		if((year == null || year.equals("")) && (month == null || month.equals(""))) {
			year = String.valueOf(cal.get(Calendar.YEAR));
			month = String.valueOf(cal.get(Calendar.MONTH)+1);
		}
		
		System.out.println("year: " + year + ", month: " + month);
		
		if(month.length() <2) {
			month="0" + month;
			
		}
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		
		return "calendar.tiles";
		
	}
	
	// calwrite(글쓰기 이동)
	@RequestMapping(value = "calwrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String calwrite(Model model, String year, String month, String day) {
	
		logger.info("CalController calwrite "+ new Date());
		
		System.out.println("year: " + year + ", month: " + month + ", day: " + day);
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		
		return "calwrite.tiles";
	
	}

	// calwriteAf(출석체크)
	@RequestMapping(value = "calwriteAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String calwriteAf(Model model, CalendarDto dto, String year, String month, String day,
			 String hour, String min) {
		
		logger.info("CalController calwriteAf "+ new Date());
		
		// dto : id, rdate 가 저장됨
		
		// 파라미터 값 month, day, hour, min 2자리가 아니라면 앞에 0을 붙여서 
		// 0 -> 02 이런식으로 바꿔주도록 한다. 
	
		if(month.length() < 2) {
			month ="0" + month;
		}

		if(hour.length() < 2) {
			hour = "0" + hour;
		}
		
		if(min.length() < 2) {
			min = "0" + min;
		}
			
		String date = year + month + day + hour + min;
		dto.setRdate(date);
		
		boolean isS = calService.calwrite(dto);
		
		return "redirect:/calendar.do";
				
	}

	
}
