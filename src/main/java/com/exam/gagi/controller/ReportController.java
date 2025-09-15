
package com.exam.gagi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.gagi.model.Report;
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
		return post.getDefectId(); 
	}
	
	/* 사용자 */
	// 내 신고 내역
	@GetMapping("/user/{userId}")
	public String listByUser(@PathVariable int userId, Model model) {
		List<Report> reports = reportService.getReportsByUser(userId);
		model.addAttribute("list", reports);
		return "report/userReports";
	}
	
	/* 관리자 */
	// 모든 신고 목록 (관리자 전용)
	@GetMapping("/admin/list")
	public String listAll(Model model) {
		List<Report> reports = reportService.getAllReports();
		model.addAttribute("list", reports);
		return "report/adminList";
	}
	
	// 신고 상태 업데이트 (관리자 전용)
	@PostMapping("/admin/{id}/status")
	public String updateStatus(@PathVariable int id, @RequestParam String status) {
		reportService.updateStatus(id, status);
		return "redirect:/report/adminList";
	}
}
