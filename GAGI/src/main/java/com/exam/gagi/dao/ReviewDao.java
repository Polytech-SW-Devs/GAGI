package com.exam.gagi.dao;

import com.exam.gagi.model.Review;

public interface ReviewDao extends BaseBoardDao<Review> {

	double getAverageRating(int targetId);
	

}
