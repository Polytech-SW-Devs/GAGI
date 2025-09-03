package com.exam.gagi.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.exam.gagi.dao.ReviewDao;
import com.exam.gagi.model.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	private final SqlSession sqlSession;
	
	public ReviewDaoImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Review> selectList(String search, int offset, int size) {
		Map<String, Object> param = new HashMap<>();
		param.put("search", search);
		param.put("offset", offset);
		param.put("size", size);
		return sqlSession.selectList("review.selectList", param);
	}

	@Override
	public Review selectReview(int id) {
		return sqlSession.selectOne("review.selectReview", id);
	}

	@Override
	public int selectCount(String search) {
		return sqlSession.selectOne("review.selectCount", search);
	}

}
