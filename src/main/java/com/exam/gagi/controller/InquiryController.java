package com.exam.gagi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.gagi.model.Inquiry;
import com.exam.gagi.service.InquiryService;

@Controller
@RequestMapping("/inquiry")
public class InquiryController extends BaseBoardController<Inquiry> {

	private final InquiryService inquiryService;
	
	@Autowired
	public InquiryController(InquiryService inquiryService) {
		super(inquiryService, "inquiry");
		this.inquiryService = inquiryService;
	}
	
	@Override
	protected int getIdFromPost(Inquiry post) {
		return post.getId();
	}
	
	// 특정 문의 답변 여부 확인
	@GetMapping("/answered/{id}")
	@ResponseBody
	public boolean isAnswered(@PathVariable int id) {
		Inquiry inquiry = inquiryService.getById(id);
		return inquiry != null && inquiry.getRespondedAt() != null;
	}
	
	// 전체 미답변 문의 수
	@GetMapping("/unanswered-count")
	@ResponseBody
	public int unansweredCount() {
		return inquiryService.getUnansweredCount();
	}
	
	// 특정 유저의 문의 목록
	@GetMapping("/user/{userId}")
	@ResponseBody
	public List<Inquiry> userInquiries(@PathVariable int userId) {
		return inquiryService.getByUserId(userId);
	}
	
}
