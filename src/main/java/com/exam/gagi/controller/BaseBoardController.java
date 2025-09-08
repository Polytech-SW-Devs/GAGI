package com.exam.gagi.controller;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.gagi.service.BaseBoardService;

public abstract class BaseBoardController<T> {
	
	// 공통 service
	protected final BaseBoardService<T> service;
	protected final String viewPath;
	
	// 생성자에서 service 주입

	public BaseBoardController(BaseBoardService<T> service, String viewPath) {
		this.service = service;
		this.viewPath = viewPath;
	}

	@GetMapping ("/list")
	public String list(@RequestParam(defaultValue = "") String search,
					   @RequestParam(defaultValue = "1") int page,
					   Model model) {
		List<T> list = service.getList(search, page, 10);
		int total = service.getCount(search);
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		return viewPath + "/list";
		
	}
	
	@GetMapping("/{id}")
	public String detail(@PathVariable int id, Model model) {
		T post = service.getPost(id);
		model.addAttribute("post", post);
		return viewPath + "/detail"; 
	}
	
	@GetMapping("/write")
	public String writeForm() {
		return viewPath + "/write";
	}

	// 홈 화면에서 고객센터 클릭 → 게시판 선택 페이지
	@GetMapping
	public String customerCenter() {
		// JSP에서 Q&A, FAQ, 공지사항 링크만 보여줌
		return "customer/customerCenter";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute T post) {
		service.create(post);
		return "redirect:/" + viewPath;
	}
	
	@GetMapping("/edit/{id}")
	public String editForm(@PathVariable int id, Model model) {
		T post = service.getPost(id);
		model.addAttribute("post", post);
		return viewPath + "/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute T post) {
		service.update(post);
		return "redirect:/" + viewPath + "/" + getIdFromPost(post);
	}
	/*
	@PostMapping("/delete/{id}")
	public String delete(@PathVariable int id) {
		service.delete(id);
		return "redirect:/" + viewPath;
	}
	*/

	// 개별 게시판에서 구현
	protected abstract int getIdFromPost(T post);
}
