package com.exam.gagi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.exam.gagi.model.Member;
import com.exam.gagi.service.InquiryService;
import com.exam.gagi.service.MemberService;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	InquiryService inquiryService;
	
	//홈페이지 호출
	@GetMapping("/")
	String home(HttpSession session, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		model.addAttribute("loginUser", loginUser);
		return "home";	
	}
	
	// 회원가입 페이지 요청
	@GetMapping("/join")
	public String joinPage() {
		// 게시판 메뉴 취득
		return "join";
	}
	
	// 회원가입 요청
	@PostMapping("/join")
	public String joinAply(Member member) {
		memberService.insertMember(member);
	    return "redirect:/login";	
	}
	
	// 로그인 페이지 요청
	@GetMapping("/login")
	public String loginPage() {
		// 게시판 메뉴 취득
		return "login";
	}
	
	// 로그인 처리
	@PostMapping("/login")
	public String login(Member member, HttpSession session, Model model) {
		Member loginUser = memberService.findByEmail(member.getEmail());
		if(loginUser != null && loginUser.getPassword().equals(member.getPassword())) {
			session.setAttribute("loginUser", loginUser);
			System.out.println(loginUser);
			
			
			return "redirect:/";
		} else {
			model.addAttribute("error", "이메일 또는 비밀번호가 올바르지 않습니다.");
			return "login";
		}
	}
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
}
