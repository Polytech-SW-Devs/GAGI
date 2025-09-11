package com.exam.gagi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer-center")
public class CustomerCenterController {
	@GetMapping
	public String index() {
		return "customerCenter/index";
	}
}
