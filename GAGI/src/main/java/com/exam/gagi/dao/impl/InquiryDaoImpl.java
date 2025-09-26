package com.exam.gagi.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.exam.gagi.dao.InquiryDao;
import com.exam.gagi.model.Inquiry;

@Repository
public class InquiryDaoImpl extends BaseBoardDaoImpl<Inquiry> implements InquiryDao {
	
	private final SqlSession sqlSession;
	
	@Autowired
	public InquiryDaoImpl(SqlSession sqlSession) {
		super(sqlSession, "inquiry");
		this.sqlSession = sqlSession;
	}

	@Override
	public Inquiry getById(int id) {
		return sqlSession.selectOne(namespace + ".getById", id);
	}

	@Override
	public int getUnansweredCount() {
		return sqlSession.selectOne(namespace + ".getUnansweredCount");
	}

	@Override
	public List<Inquiry> getByUserId(int userId) {
		return sqlSession.selectList(namespace + ".getByUserId", userId);
	}


}
