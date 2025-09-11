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

import com.exam.gagi.model.Member;
import com.exam.gagi.service.MemberService;


@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;


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
	

	// 아이디 찾기 페이지 요청
	@GetMapping("/findId")
	public String findIdPage() {
	    return "findId"; // findId.jsp
	}

	// 아이디 찾기 처리
	@PostMapping("/findId")
	public String findId(@ModelAttribute Member member, Model model) {
	    String email = memberService.findId(member.getUsername(), member.getPhone());
	    if(email != null) {
	        model.addAttribute("email", email);
	        return "findIdSuccess";
	    } else {
	        model.addAttribute("error", "일치하는 회원 정보가 없습니다.");
	        return "findId";
	    }
	}
	
	// 비밀번호 찾기 페이지 요청
	@GetMapping("/findPw")
	public String findPwPage() {
	    return "findPw"; // findPw.jsp
	}

	// 비밀번호 찾기 처리
	@PostMapping("/findPw")
	public String findPw(@ModelAttribute Member member, Model model) {
	    String userpw = memberService.findPassword(member.getEmail(), member.getPhone());
	    if(userpw != null) {
	        model.addAttribute("email", member.getEmail());
	        return "findPwSuccess";
	    } else {
	        model.addAttribute("error", "일치하는 회원 정보가 없습니다.");
	        return "findPw";
	    }
	}
	@PostMapping("/updatePw")
	public String updatePassword(@ModelAttribute Member member,
	                             RedirectAttributes redirectAttributes,
	                             Model model) {

	    if (!member.getPassword().equals(member.getPassword())) {
	        model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
	        return "updatePw";
	    }

	    memberService.passwordUpdate(member.getEmail(), member.getPassword());

	    redirectAttributes.addFlashAttribute("success", "비밀번호가 성공적으로 변경되었습니다. 로그인해주세요.");
	    return "redirect:/login";
	}
}
