package com.exam.gagi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.exam.gagi.model.Items;
import com.exam.gagi.model.Member;
import com.exam.gagi.pager.MyPagePager;
import com.exam.gagi.service.MemberService;
import com.exam.gagi.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ProductService service;

	@Autowired
	MemberService mService;

	// 게시글 리스트
	@GetMapping("product/list")
	String list(HttpSession session, Model model, MyPagePager pager) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) {
			System.out.println("로그인 정보가 없습니다. 로그인하세요");
			return "redirect:/login";
		}
		int userId = loginUser.getId();
		pager.setUserId(userId);
		List<Items> list = service.list(pager);
		model.addAttribute("list", list);
		return "/product/list";
	}

	// 게시글 등록
	@GetMapping("product/add")
	String add() {
		return "/product/add";
	}
	@PostMapping("product/add")
	String add(HttpSession session, Items item) {

		System.out.println("title: " + item.getTitle());
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) {
			System.out.println("로그인 정보가 없습니다. 로그인하세요");
			return "redirect:/login";
		}
		item.setUserId(loginUser.getId());
		service.add(item);
		return "redirect:./list";
	}

	// 게시글 삭제
	@GetMapping("product/delete/{id}")
	String delete(@PathVariable("id") int id) {
		service.delete(id);
		return "redirect:/product/list";
	}

	// 게시글 수정
	@GetMapping("product/update/{id}")
	String update(@PathVariable("id") int id, Model model) {
		Items item = service.item(id);
		model.addAttribute("item", item);
		return "/product/update";
	}
	@PostMapping("product/update/{id}")
	String update(@PathVariable("id") int id, Items item, Model model) {
		item.setId(id);
		service.update(item);
		return "redirect:/product/list";
	}

	// 상세페이지
	@GetMapping("/product/detail/{id}")
	String detail(@PathVariable int id, Model model) {
		Items item = service.item(id);
		Member member = mService.findById(item.getUserId());
		model.addAttribute("item", item);  
		model.addAttribute("member", member);
		return "/product/detail";
	}

}
