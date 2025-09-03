package com.exam.gagi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.ReviewDao;
import com.exam.gagi.model.Review;
import com.exam.gagi.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public List<Review> getList(String search, int page, int size) {
		int offset = (page - 1) * size;
		return reviewDao.selectList(search, offset, size);
	}

	@Override
	public Review getReview(int id) {
		return reviewDao.selectReview(id);
	}

	@Override
	public int getCount(String search) {
		return reviewDao.selectCount(search);
	}

}
