package kh.com.a.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kh.com.a.service.CustomService;

@Controller
public class CustomController {
	
	private static final Logger logger 
		= LoggerFactory.getLogger(CustomController.class);
	
	@Autowired
	CustomService customService;
	
	
	
	
	
	
}
