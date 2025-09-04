package com.exam.gagi.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.exam.gagi.dao.InquiryDao;
import com.exam.gagi.model.Inquiry;

@Repository
public class InquiryDaoImpl implements InquiryDao {
	
	private final SqlSession sqlSession;
	
	public InquiryDaoImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Inquiry> selectList(String search, int offset, int size) {
		Map<String, Object> param = new HashMap<>();
		param.put("search", search);
		param.put("offset", offset);
		param.put("size", size);
		return sqlSession.selectList("inquiry.selectList", param);
	}

	@Override
	public int selectCount(String search) {
		return sqlSession.selectOne("inquiry.selectCount", search);
	}

	@Override
	public Inquiry selectInquiry(int id) {
		return sqlSession.selectOne("inquiry.selectInquiry", id);
	}

}
