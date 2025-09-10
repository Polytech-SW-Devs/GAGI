package com.exam.gagi.service;

import java.util.List;

import com.exam.gagi.model.Review;

public interface ReviewService extends BaseBoardService<Review> {

	// 상품 대상별 평균 평점
	double getAverageRating(int targetId);



}
