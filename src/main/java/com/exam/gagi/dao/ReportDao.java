package com.exam.gagi.dao;

import java.util.List;

import com.exam.gagi.model.Report;

public interface ReportDao extends BaseBoardDao<Report> {

	// 사용자
	List<Report> selectByUserId(int userId);

	// 관리자
	List<Report> selectAll();

	void updateStatus(int defectId, String status);
}
