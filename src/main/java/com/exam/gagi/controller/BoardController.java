package com.exam.gagi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class BoardController {
	
	// Ȩ ȭ�鿡�� ������ Ŭ�� �� �Խ��� ���� ������
	@GetMapping
	public String customerCenter() {
		// JSP���� Q&A, FAQ, �������� ��ũ�� ������
		return "customer/customerCenter";
	}
}
