package com.exam.gagi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.exam.gagi.model.Items;
import com.exam.gagi.service.ProductService;

@Controller
public class HomeController {

	@Autowired
	ProductService productService;

	// 홈페이지 호출 //전체게시글 리스트 호출
	@GetMapping("/")
	String totalList(Model model) {
		List<Items> totalList = productService.totalList();
		model.addAttribute("totalList", totalList);
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
		// 게시판 메뉴 취득
//	    return "home";
		
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
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	@GetMapping("/cart")
	public String cartPage() {
		// 장바구니
		return "cart";
	}
	
}
