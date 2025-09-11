package com.exam.gagi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.gagi.model.Member;
import com.exam.gagi.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

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
		// 게시판 메뉴 취득
	    
//		return "index";
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
			return "redirect:/";
		} else {
			model.addAttribute("error", "이메일 또는 비밀번호가 올바르지 않습니다.");
			return "login";
		}
	}

	// 중복아이디 체크
	@ResponseBody
	@GetMapping("/checkid")
	public String checkId(@RequestParam(value = "data") String userid) {
		return String.valueOf(memberService.checkId(userid));
	}

	// 중복닉네임 체크
	@ResponseBody
	@GetMapping("/checknm")
	public String checkNm(@RequestParam(value = "data") String nickname) {
		return String.valueOf(memberService.checkNm(nickname));
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
