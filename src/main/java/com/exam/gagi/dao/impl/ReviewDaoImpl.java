package com.exam.gagi.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.exam.gagi.dao.ReviewDao;
import com.exam.gagi.model.Review;

@Repository
public class ReviewDaoImpl extends BaseBoardDaoImpl<Review> implements ReviewDao {
	
	private final SqlSession sqlSession;
	
	@Autowired
	public ReviewDaoImpl(SqlSession sqlSession) {
		super(sqlSession, "review");
		this.sqlSession = sqlSession;
	}

	@Override
	public double getAverageRating(int targetId) {
		return sqlSession.selectOne("review.getAverageRating", targetId);
	}
}
