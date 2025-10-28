package com.exam.gagi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.gagi.model.Member;
import com.exam.gagi.service.MemberService;
import com.exam.gagi.service.MyUpdateService;

@Controller
@RequestMapping("/mypage")
public class MyUpdateController {

	@Autowired
	MyUpdateService service;

	@Autowired
	MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder encoder;

	private final String path = "/mypage";

	@GetMapping("/myUpdate")
	public String getMyImpormation(@SessionAttribute(name = "loginUser", required = false) Member loginUser,
			Model model, RedirectAttributes rttr) {

		// 로그인 확인
		if (loginUser == null) {
			rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/login"; // 로그인 페이지로 이동
		}

		Member member = service.myUpdate(loginUser.getId());

		model.addAttribute("member", member);

		return path + "/myUpdate";
	}

	@PostMapping("/myUpdate")
	public String postMyImpormation(Member member, Model model,
			@SessionAttribute(name = "loginUser", required = false) Member loginUser, RedirectAttributes rttr) {

		// 로그인 확인

		if (loginUser == null) {
			rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/login"; // 로그인 페이지로 이동
		}
		
		boolean passwordChange = member.getNewPassword() != null && !member.getNewPassword().isEmpty();
		if(passwordChange = true) {
			if(member.getNewPassword() == null && member.getNewPassword().isEmpty()) {
				rttr.addFlashAttribute("passwordError", "새 비밀번호확인란을 입력하세요.");
			}else if(!member.getConfirmPassword().equals(member.getNewPassword())){
				rttr.addFlashAttribute("passwordError", "새 비밀번호가 일치하지 않습니다.");
				return "redirect:./myUpdate";
			}
			member.setPassword(member.getNewPassword());
		}
		System.out.println("user id = " + loginUser.getId());
		
		if (member.getPhone() == null) {
			rttr.addFlashAttribute("phoneError", "휴대폰전호를 입력하세요.");
			return "redirect:./myUpdate";
		} else if (member.getPhone().length() > 14) {
			rttr.addFlashAttribute("phoneError", "'-'를 포함하여 전화번호를 입력하세요");
			return "redirect:./myUpdate";
		}
		service.myFetch(member);
		rttr.addFlashAttribute("msg", "개인정보가 수정되었습니다.");
		return "redirect:/mypage";
	}

	@ResponseBody
	@GetMapping("/checknm/{nickname}")
	String checknm(@PathVariable String nickname) throws Exception {
		Thread thread = new Thread();
		if (memberService.checkNm(nickname))
			return "OK";
		return "FAIL";

	}

}
