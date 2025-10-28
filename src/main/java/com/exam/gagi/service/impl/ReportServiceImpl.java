package com.exam.gagi.service.impl;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.exam.gagi.dao.ReportDao;
import com.exam.gagi.model.Report;
import com.exam.gagi.service.ReportService;

@Service
public class ReportServiceImpl extends BaseBoardServiceImpl<Report> implements ReportService {

	private final ReportDao reportDao;
	
	public ReportServiceImpl(ReportDao reportDao) {
		super(reportDao);
		this.reportDao = reportDao;
	}

	@Override
	public void writeReport(Report report, MultipartFile file) throws Exception {
		if(file != null && !file.isEmpty()) {
			String originalName = file.getOriginalFilename();
			String ext = originalName.substring(originalName.lastIndexOf("."));
			String newName = UUID.randomUUID() + ext;
			String uploadDir = "C:/uploads/report";
			
			File dir = new File(uploadDir);
			if(!dir.exists()) dir.mkdirs();
			
			file.transferTo(new File(dir, newName));
			report.setImageUrl("/uploads/report/" + newName);
		}
		reportDao.insert(report);
	}

	@Override
	public void updateStatus(int id, String status) {
		reportDao.updateStatus(id, status);
	}
}
