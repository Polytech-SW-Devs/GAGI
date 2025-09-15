package com.exam.gagi.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.exam.gagi.dao.ReportDao;
import com.exam.gagi.model.Report;

@Repository
public class ReportDaoImpl extends BaseBoardDaoImpl<Report> implements ReportDao {
	
	private final SqlSession sqlSession;
	
	@Autowired
	public ReportDaoImpl(SqlSession sqlSession) {
		super(sqlSession, "report");
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Report> selectByUserId(int userId) {
		return sqlSession.selectList(namespace + "selectByUserId", userId);
	}

	@Override
	public List<Report> selectAll() {
		return sqlSession.selectList(namespace + "selectAll");
	}

	@Override
	public void updateStatus(int defectId, String status) {
		Map<String, Object> param = new HashMap<>();
		param.put("defectId", defectId);
		param.put("status", status);
		sqlSession.update(namespace + "updateStatus", param);
	}
}
