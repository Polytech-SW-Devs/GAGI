package com.exam.gagi.controller;

import org.springframework.web.bind.annotation.GetMapping;

import com.exam.gagi.service.BaseBoardService;

public abstract class BaseBoardController<T> {

	private final BaseBoardService<T> service;
	private final String viewPath;

	public BaseBoardController(BaseBoardService<T> service, String viewPath) {
		this.service = service;
		this.viewPath = viewPath;
	}

	// 홈 화면에서 고객센터 클릭 → 게시판 선택 페이지
	@GetMapping
	public String customerCenter() {
		// JSP에서 Q&A, FAQ, 공지사항 링크만 보여줌
		return "customer/customerCenter";
	}
}
