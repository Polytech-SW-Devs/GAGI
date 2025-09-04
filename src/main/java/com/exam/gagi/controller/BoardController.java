package com.exam.gagi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class BoardController {

	// 홈 화면에서 고객센터 클릭 → 게시판 선택 페이지
	@GetMapping
	public String customerCenter() {
		// JSP에서 Q&A, FAQ, 공지사항 링크만 보여줌
		return "customer/customerCenter";
	}
}
