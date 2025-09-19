package com.exam.gagi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.exam.gagi.model.Member;
import com.exam.gagi.model.Orders;
import com.exam.gagi.pager.Pager;
import com.exam.gagi.service.OrdersService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	private final OrdersService service; // 서비스 계층 주입
	private final String PATH = "mypage/";

	// 생성자 주입
	public MypageController(OrdersService service) {
		this.service = service;
	}

	// 마이페이지 메인 화면
	@GetMapping("")
	String mypage(Model model, HttpSession session, Pager pager) {

		return PATH + "mypage";
	}

	// 내 게시글 보기
	@GetMapping("/myarticle")
	String myArticles() {
		return PATH + "myarticle";
	}

	// 구매 내역 조회
	@GetMapping("/myorder")
	String myOrders(Model model, @SessionAttribute(name = "loginUser", required = false) Member loginUser,
			Pager pager) {
		if (loginUser == null) {
			return "redirect:/login";
		}

		int userId = loginUser.getId();
		pager.setUserId(userId);

		List<Orders> list = service.orderList(pager);
		model.addAttribute("list", list);
		return PATH + "myorder";
	}

	// 판매내역
	@GetMapping("/mysale")
	String mySales(Model model, @SessionAttribute(name = "loginUser", required = false) Member loginUser, Pager pager) {

		if (loginUser == null) {
			return "redirect:/login";
		}

		int userId = loginUser.getId();
		pager.setUserId(userId);

		List<Orders> list = service.saleList(pager);
		model.addAttribute("list", list);

		return PATH + "mysale";
	}

	@GetMapping("/mysaleDetail/{orderId}")
	public String mysaleDetail(@PathVariable("orderId") int orderId, Model model, HttpSession session) {
		return null;
	}
}
