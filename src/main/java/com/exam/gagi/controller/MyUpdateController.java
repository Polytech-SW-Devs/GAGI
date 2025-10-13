package com.exam.gagi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.gagi.model.Member;
import com.exam.gagi.service.MyUpdateService;

@Controller
@RequestMapping("/mypage")
public class MyUpdateController {

	@Autowired
	MyUpdateService service;
	
	private final String path = "/mypage";
	
	@GetMapping("/myUpdate")
	public String getMyImpormation(
					@SessionAttribute(name = "loginUser", required = false) Member loginUser,
					Model model,
					RedirectAttributes rttr) {
		
		// 로그인 확인
	    if (loginUser == null) {
	    	rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
	        return "redirect:/login"; // 로그인 페이지로 이동
	    }
		
		Member member = service.myUpdate(loginUser.getId());
		
		model.addAttribute("member", member);
		
		return  path + "/myUpdate";
	}
	
	@PostMapping("/myUpdate")
	public String postMyImpormation(
					Member member,
					@SessionAttribute(name = "loginUser", required = false) Member loginUser,
					RedirectAttributes rttr) {
		
		// 로그인 확인
	    if (loginUser == null) {
	    	rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
	        return "redirect:/login"; // 로그인 페이지로 이동
	    }
	    
	    member.setId(loginUser.getId());
	    
	    service.myFetch(member);
		
		rttr.addFlashAttribute("msg", "개인정보가 수정되었습니다.");
		return "redirect:/mypage";
	}
}
