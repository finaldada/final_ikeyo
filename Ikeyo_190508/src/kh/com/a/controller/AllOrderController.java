package kh.com.a.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kh.com.a.service.AllOrderService;

@Controller
public class AllOrderController {

	@Autowired
	AllOrderService allOrderService;
	
}
