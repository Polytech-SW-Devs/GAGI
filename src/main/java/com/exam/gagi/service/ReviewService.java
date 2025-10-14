package com.exam.gagi.service;

import java.util.List;
import java.util.Map;

import com.exam.gagi.model.Review;

public interface ReviewService extends BaseBoardService<Review> {

	void insert(Review review);
	
	List<Review> getReviewsByTarget(int targetId);
	
	// 상품 대상별 평균 평점
	double getAverageRating(int targetId);
	
	Map<String, Object> getWriteInfo(int memberId, int productId);

}
