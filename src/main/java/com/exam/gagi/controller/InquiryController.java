package com.exam.gagi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.gagi.model.Inquiry;
import com.exam.gagi.service.InquiryService;

@Controller
@RequestMapping("/customer/inquiry")
public class InquiryController {

	@Autowired
	private InquiryService inquiryService;
	
	@GetMapping
	public String list(@RequestParam(defaultValue = "") String search,
			   @RequestParam(defaultValue = "1") int page,
			   Model model) {
		int size = 10;
		List<Inquiry> boardList = inquiryService.getList(search, page, size);
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCount", inquiryService.getCount(search));
		model.addAttribute("currentPage", page);
		return "customer/inquiryList";
	}
	
	@GetMapping("/{id}")
	public String inquiry(@PathVariable int id, Model model) {
		model.addAttribute("inquiry", inquiryService.getInquiry(id));
		return "customer/inquiry";
	}
	
}
