package com.exam.gagi.dao;

import com.exam.gagi.model.Report;

public interface ReportDao extends BaseBoardDao<Report> {

	void insert(Report report);

	void updateStatus(int id, String status);

}
