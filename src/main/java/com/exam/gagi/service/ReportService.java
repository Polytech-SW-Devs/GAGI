package com.exam.gagi.service;

import org.springframework.web.multipart.MultipartFile;

import com.exam.gagi.model.Report;

public interface ReportService extends BaseBoardService<Report> {

	void writeReport(Report report, MultipartFile file) throws Exception;

	void updateStatus(int id, String status);

}
