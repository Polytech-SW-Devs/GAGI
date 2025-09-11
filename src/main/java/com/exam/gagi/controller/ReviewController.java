package com.exam.gagi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.gagi.model.Review;
import com.exam.gagi.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController extends BaseBoardController<Review> {
	
	private final ReviewService reviewService;
	
	@Autowired
	public ReviewController(ReviewService reviewService) {
		super(reviewService, "review");
		this.reviewService = reviewService;
	}

	@Override
	protected int getIdFromPost(Review post) {
		return post.getId();
	}
	
	@GetMapping("/average/{targetId}")
	@ResponseBody
	public double averageRating(@PathVariable int targetId) {
		return reviewService.getAverageRating(targetId);
	}
	
	
}
