package com.exam.gagi.service;

import java.util.List;

import com.exam.gagi.model.Review;

public interface ReviewService {

	List<Review> getList(String search, int page, int size);

	Review getReview(int id);

	int getCount(String search);


}
