package com.exam.gagi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.gagi.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	// 로그인 페이지 요청
	@GetMapping("/login")
	public String loginPage() {
		// 게시판 메뉴 취득
		
		return "login";
	}
	
	// 회원가입 페이지 요청
	@GetMapping("/join")
	public String joinPage() {
		// 게시판 메뉴 취득
		
		return "join";
	}
	
	// 회원가입 요청
	@PostMapping("/join")
	public String joinAply() {
		// 회원가입 정보 저장
		// 게시판 메뉴 취득
		
		return "index";
	}
	
	// 중복아이디 체크
	@ResponseBody
	@GetMapping("/checkid")
	public String checkId(@RequestParam(value="data") String userid) {
		return String.valueOf(memberService.checkId(userid));
	}
	
	// 중복닉네임 체크
	@ResponseBody
	@GetMapping("/checknm")
	public String checkNm(@RequestParam(value="data") String nickname) {
		return String.valueOf(memberService.checkNm(nickname));
	}
}
