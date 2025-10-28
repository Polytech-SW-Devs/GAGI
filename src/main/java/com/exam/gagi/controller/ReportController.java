package com.exam.gagi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.exam.gagi.model.Member;
import com.exam.gagi.model.Report;
import com.exam.gagi.model.Review;
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
	protected long getIdFromPost(Report post) {
		return post.getDefectId();
	}

	// 파일 업로드 기능
	@PostMapping("/writeFile")
	public String writeFile(@ModelAttribute Report report,
						@RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
						HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "redirect:/login";
		}
		
		report.setUserId(loginUser.getId());

		try {
			reportService.writeReport(report, imageFile);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/report/write?error=true";
		}
		return "redirect:/report/list";
	}
	
	// 신고 상태 변경 (관리자용)
	@PostMapping("/status/{id}")
	@ResponseBody
	public String updateStatus(@PathVariable("id") int id, @RequestParam("status") String status) {
		reportService.updateStatus(id, status);
		return "OK";
	}

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/report")
public class ReportController {

    // 신고 목록 페이지로 이동
    @GetMapping("/list")
    public String list() {
        return "report/list";  // /WEB-INF/views/report/list.jsp 로 이동
    }

}
