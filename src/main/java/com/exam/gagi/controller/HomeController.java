package com.exam.gagi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.exam.gagi.model.Items;
import com.exam.gagi.service.ProductService;



@Controller
public class HomeController {
	
	@Autowired
	ProductService productService;
	
	//홈페이지 호출 //전체게시글 리스트 호출
	@GetMapping("/")
	String totalList(Model model) {
		List<Items> totalList = productService.totalList();
		model.addAttribute("totalList", totalList);
		return "home";	
	}
	
	
	
	
	
	
}
