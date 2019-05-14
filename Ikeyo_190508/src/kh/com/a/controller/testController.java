package kh.com.a.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class testController {
	
	@RequestMapping(value="test.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String test() {
		return "test.tiles";
	}
}
