package com.exam.gagi.dao;

import java.util.List;

import com.exam.gagi.model.Review;

public interface ReviewDao {

	List<Review> selectList(String search, int offset, int size);

	Review selectReview(int id);

	int selectCount(String search);


}
