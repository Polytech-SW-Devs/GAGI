package com.exam.gagi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.exam.gagi.model.Category;
import com.exam.gagi.model.MyBoard;
import com.exam.gagi.service.MyBoardService;

@Controller
@RequestMapping("/myBoard")
public class MyBoardController {
	
//	Logger logger = LoggerFactory.getLogger(MyBoardController.class);
//	
	final private String path = "/mypage/";
//	
	@Autowired
	MyBoardService service;
//	
//	@GetMapping("/myarticle")
//	public String list(Model model) {
//		List<MyBoard> list = service.list();
//		
//		model.addAttribute("list", list);
//		
//		return path + "list";
//	}


	@GetMapping("/add")
	public String add(Model model) {
		
		List<Category> categoryList = service.categoryList(); 
		
		model.addAttribute("categories", categoryList);
		
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(MyBoard myboard) {
		service.add(myboard);
		
		return "redirect:list";
	}
}
