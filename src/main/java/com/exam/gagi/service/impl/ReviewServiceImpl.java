package com.exam.gagi.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.ReviewDao;
import com.exam.gagi.model.Review;
import com.exam.gagi.service.ReviewService;

@Service
public class ReviewServiceImpl extends BaseBoardServiceImpl<Review> implements ReviewService {

	public ReviewServiceImpl(SqlSession sqlSession) {
		super(sqlSession, "review");
	}


}
