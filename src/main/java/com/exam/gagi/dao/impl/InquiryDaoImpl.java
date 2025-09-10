package com.exam.gagi.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


}
