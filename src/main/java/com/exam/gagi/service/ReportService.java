package com.exam.gagi.service;

import java.util.List;

import com.exam.gagi.model.Report;

public interface ReportService extends BaseBoardService<Report> {

	// 사용자
	List<Report> getReportsByUser(int userId);

	// 관리자
	List<Report> getAllReports();

	void updateStatus(int defectId, String status);

}
