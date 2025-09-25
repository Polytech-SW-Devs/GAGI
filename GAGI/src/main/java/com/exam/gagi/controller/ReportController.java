
package com.exam.gagi.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
	@GetMapping("/write")
	@Override
	public String writeForm() {
		// 신고게시판은 기본 write.jsp 대신 writeWithFile.jsp 사용
		return "report/writeWithFile";
	}
	
	@GetMapping("/writeWithFile")
	public String writeWithFileForm() {
		return "report/writeWithFile";
	}
	
	// 신고 작성 (파일 업로드 포함)
	@PostMapping("/writeWithFile")
	public String write(@ModelAttribute Report post,
						@RequestParam(value="imageFile", required=false) MultipartFile file) {

	    // 파일 처리
		if(file != null && !file.isEmpty()) {
			try {
				String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
				String uploadPath = "C:/upload/" + fileName;
				file.transferTo(new File(uploadPath));
				
				post.setImageUrl("/uploads/" + fileName);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		reportService.create(post);
		return "redirect:/report/list";
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
	
	// 관리자 상세 조회
	@GetMapping("/admin/{id}")
	public String adminDetail(@PathVariable int id, Model model) {
		Report report = reportService.getPost(id);
		model.addAttribute("post", report);
		return "report/adminDetail";
	}
	
	// 신고 상태 업데이트 (관리자 전용)
	@PostMapping("/admin/{id}/status")
	public String updateStatus(@PathVariable int id, @RequestParam String status) {
		reportService.updateStatus(id, status);
		return "redirect:/report/adminList";
	}
}
