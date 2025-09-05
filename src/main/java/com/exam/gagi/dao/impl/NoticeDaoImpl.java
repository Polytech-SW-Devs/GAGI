package com.exam.gagi.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.exam.gagi.dao.NoticeDao;
import com.exam.gagi.model.Notice;

@Repository
public class NoticeDaoImpl extends BaseBoardDaoImpl<Notice> implements NoticeDao {

	private final SqlSession sqlSession;
	
	@Autowired
	public NoticeDaoImpl(SqlSession sqlSession) {
		super(sqlSession, "notice");
		this.sqlSession = sqlSession;
	}
}
