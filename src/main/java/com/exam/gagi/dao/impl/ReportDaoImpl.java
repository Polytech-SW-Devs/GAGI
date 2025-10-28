package com.exam.gagi.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.ReportDao;
import com.exam.gagi.model.Report;

@Repository
public class ReportDaoImpl extends BaseBoardDaoImpl<Report> implements ReportDao {

	private final SqlSession sqlSession;
	
	protected ReportDaoImpl(SqlSession sqlSession) {
		super(sqlSession, "report");
		this.sqlSession = sqlSession;
	}

	@Override
	public void insert(Report report) {
		sqlSession.insert(namespace + ".insert", report);
	}

	@Override
	public void updateStatus(int id, String status) {
		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("status", status);
		sqlSession.update(namespace + ".updateReportStatus", params);
	}
	
}
