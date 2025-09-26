package com.exam.gagi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.ReportDao;
import com.exam.gagi.model.Report;
import com.exam.gagi.service.ReportService;

@Service
public class ReportServiceImpl extends BaseBoardServiceImpl<Report> implements ReportService {

	private final ReportDao reportDao;

	@Autowired
	public ReportServiceImpl(ReportDao reportDao) {
		super(reportDao);
        this.reportDao = reportDao;
	}

	@Override
	public List<Report> getReportsByUser(int userId) {
		return reportDao.selectByUserId(userId);
	}

	@Override
	public List<Report> getAllReports() {
		return reportDao.selectAll();
	}

	@Override
	public void updateStatus(int defectId, String status) {
		reportDao.updateStatus(defectId, status);
	}

	
}
