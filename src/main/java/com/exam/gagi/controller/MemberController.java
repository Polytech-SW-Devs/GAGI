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

	// �α��� ������ ��û
	@GetMapping("/login")
	public String loginPage() {
		// �Խ��� �޴� ���
		
		return "login";
	}
	
	// ȸ������ ������ ��û
	@GetMapping("/join")
	public String joinPage() {
		// �Խ��� �޴� ���
		
		return "join";
	}
	
	// ȸ������ ��û
	@PostMapping("/join")
	public String joinAply() {
		// ȸ������ ���� ����
		// �Խ��� �޴� ���
		
		return "index";
	}
	
	// �ߺ����̵� üũ
	@ResponseBody
	@GetMapping("/checkid")
	public String checkId(@RequestParam(value="data") String userid) {
		return String.valueOf(memberService.checkId(userid));
	}
	
	// �ߺ��г��� üũ
	@ResponseBody
	@GetMapping("/checknm")
	public String checkNm(@RequestParam(value="data") String nickname) {
		return String.valueOf(memberService.checkNm(nickname));
	}
}
