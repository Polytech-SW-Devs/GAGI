package com.exam.gagi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.gagi.model.Address;
import com.exam.gagi.model.Member;
import com.exam.gagi.service.AddressService;
import com.exam.gagi.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	// 로그인 페이지 요청
	@GetMapping("/login")
	public String loginPage(Model model) {
		// 게시판 메뉴 취득
		return "login";
	}
	
	// 로그인 처리
	@PostMapping("/login")
	public String login(@RequestParam String email,
						@RequestParam String password,
						HttpSession session,
						Model model) {
		Member loginUser = memberService.login(email, password);
		if(loginUser != null) {
			// 로그인 성공 → 세션에 회원 정보 저장
			session.setAttribute("loginUser", loginUser);
			// 홈화면으로 이동
			return "redirect:/";  // "/"는 홈 컨트롤러 매핑
		} else {
			// 로그인 실패 → 로그인 페이지로
			model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
			return "login";
		}
	}

	// 회원가입 페이지 요청
	@GetMapping("/join")
	public String joinPage() {
		// 게시판 메뉴 취득

		return "join";
	}

	// 회원가입 요청
	@PostMapping("/join")
	public String joinAply(Member member, Address address, RedirectAttributes redirectAttributes) {
		memberService.signup(member, address);
        redirectAttributes.addFlashAttribute("msg", "회원가입 완료!");
        return "redirect:/login";
		// 회원가입 정보 저장
		// 게시판 메뉴 취득
//		return "index";
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
