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
	public void insert(Review review) {
		sqlSession.insert(namespace + "insert", review);
	}
	
	@Override
	public List<Review> selectListByTarget(int targetId) {
		return sqlSession.selectList(namespace + "selectListByTarget", targetId);
	}

	@Override
	public double getAverageRating(int targetId) {
		return sqlSession.selectOne(namespace + ".getAverageRating", targetId);
	}

	@Override
	public Map<String, Object> selectWriteInfo(int reviewerId, int targetId) {
		Map<String, Object> param = new HashMap<>();
        param.put("reviewerId", reviewerId);
        param.put("targetId", targetId);
		return sqlSession.selectOne(namespace + "selectWriteInfo", param);
	}
}
