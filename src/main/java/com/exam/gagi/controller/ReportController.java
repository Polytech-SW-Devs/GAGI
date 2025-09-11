/*
package com.exam.gagi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.exam.gagi.model.Report;
import com.exam.gagi.service.BaseBoardService;
import com.exam.gagi.service.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController extends BaseBoardController<Report> {
	
	private final ReportService reportService;

	@Autowired
	public ReportController(ReportService reportService) {
		super(reportService, "report");
		this.reportService = reportService;
	}

	@Override 
	protected int getIdFromPost(Report post) { 
		return post.getId(); }
	
}*/
