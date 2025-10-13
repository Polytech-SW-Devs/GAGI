package com.exam.gagi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.exam.gagi.model.Member;

@Controller
public class IndexController {

	@GetMapping("/")
	public String home(HttpSession session, Model model) {
		// 로그인 사용자 정보 가져오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		model.addAttribute("loginUser", loginUser);
		return "index";
	}
}
