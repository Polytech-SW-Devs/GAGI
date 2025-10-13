package com.exam.gagi.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.BaseBoardDao;
import com.exam.gagi.dao.ReviewDao;
import com.exam.gagi.model.Review;
import com.exam.gagi.service.ReviewService;

@Service
public class ReviewServiceImpl extends BaseBoardServiceImpl<Review> implements ReviewService {

	private final ReviewDao reviewDao;

	@Autowired
    public ReviewServiceImpl(ReviewDao reviewDao) {
        super(reviewDao); // BaseBoardServiceImpl<Review>에 주입
        this.reviewDao = reviewDao;
    }


	@Override
	public void insert(Review review) {
		reviewDao.insert(review);
	}

	@Override
	public List<Review> getReviewsByTarget(int targetId) {
		return reviewDao.selectListByTarget(targetId);
	}

	@Override
	public double getAverageRating(int targetId) {
		return reviewDao.getAverageRating(targetId);
	}
	
	@Override
	public Map<String, Object> getWriteInfo(int reviewerId, int targetId) {
		return reviewDao.selectWriteInfo(reviewerId, targetId);
	}



}
