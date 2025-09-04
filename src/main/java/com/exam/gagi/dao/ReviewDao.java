package com.exam.gagi.dao;

import java.util.List;

import com.exam.gagi.model.Review;

public interface ReviewDao extends BaseBoardDao<Review> {

	double getAverageRating(int targetId);
	

}
