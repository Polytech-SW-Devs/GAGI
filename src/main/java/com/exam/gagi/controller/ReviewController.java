package com.exam.gagi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.gagi.model.Review;
import com.exam.gagi.service.ReviewService;

@Controller
@RequestMapping("/customer/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping
	public String list(@RequestParam(defaultValue = "") String search,
					   @RequestParam(defaultValue = "1") int page,
					   Model model) {
		int size = 10;
		List<Review> boardList = reviewService.getList(search, page, size);
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCount", reviewService.getCount(search));
		model.addAttribute("currentPage", page);
		return "customer/reviewList";
		
	}
	
	@GetMapping("/{id}")
	public String review(@PathVariable int id, Model model) {
		model.addAttribute("review", reviewService.getReview(id));
		return "customer/review";
	}
	
}
