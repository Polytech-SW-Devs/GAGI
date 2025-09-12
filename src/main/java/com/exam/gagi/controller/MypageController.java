package com.exam.gagi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.gagi.model.Member;
import com.exam.gagi.model.OrderDetailDto;
import com.exam.gagi.model.Orders;
import com.exam.gagi.service.OrdersService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	private final OrdersService ordersService; // 서비스 계층 주입
	private final String PATH = "mypage/";

	// 생성자 주입
	public MypageController(OrdersService service) {
		this.ordersService = service;
	}

	// mypage 진입
	@GetMapping("")
	String mypage(Model model) {

		return PATH + "mypage";
	}

	// 내 게시글 보기
	@GetMapping("/myarticle")
	String myArticles() {
		return PATH + "myarticle";
	}

	// 구매 내역
	@GetMapping("/myorder")
	String myOrders(Model model, HttpSession session) {
		// 로그인 임시 코드 (무조건 덮어쓰기)
		Member testMember = new Member();
		testMember.setId(4); // DB에 주문 내역이 있는 사용자 ID
		testMember.setEmail("buy@example.com");
		testMember.setNickname("buy유저");
		session.setAttribute("member", testMember);
		System.out.println("임시 세션이 생성되었습니다. 사용자 ID: 4");
		// 임시 코드 끝

		// 세션에서 member 정보 가져오기
		Member member = (Member) session.getAttribute("member");

		// 로그인되지 않은 경우 로그인 페이지로 리다이렉트
		if (member == null) {
			return "redirect:/login";
		}

		String memberId = String.valueOf(member.getId());

		// 주문 내역 조회 (계층 구조로 변경)
		List<OrderDetailDto> orderHistory = ordersService.orderList(memberId);
		model.addAttribute("orderHistory", orderHistory);
		return PATH + "myorder";
	}

	// 판매내역
	@GetMapping("/mysale")
	String mySales(Model model, HttpSession session) {
		// 로그인 임시 코드 (무조건 덮어쓰기)
		Member testMember = new Member();
		testMember.setId(1); // DB에 주문 내역이 있는 사용자 ID
		testMember.setEmail("sale@example.com");
		testMember.setNickname("sale유저");
		session.setAttribute("member", testMember);
		System.out.println("임시 세션이 생성되었습니다. 사용자 ID: 1");
		// 임시 코드 끝

		// 세션에서 member 정보 가져오기
		Member member = (Member) session.getAttribute("member");

		// 로그인되지 않은 경우 로그인 페이지로 리다이렉트
		if (member == null) {
			return "redirect:/login";
		}

		String sellerId = String.valueOf(member.getId());
		List<Orders> list = ordersService.salelist(sellerId);

		System.out.println("list: " + list);
		model.addAttribute("list", list);
		return PATH + "mysale";
	}

	// 구매내역 데이터 추가
	@PostMapping("/add-dummy-order")
	public String addDummyOrder(HttpSession session) {
		Member member = (Member) session.getAttribute("member");

		if (member != null) {
			ordersService.createDummyOrder(1L); // Changed to 1L
		}

		return "redirect:/mypage/myorder";
	}

	@GetMapping("/mysaleDetail")
	public String mysaleDetail(@RequestParam("orderId") Long orderId, Model model) {
		// TODO: ordersService.getOrderByIdWithItems(orderId) 구현 필요
		// 현재는 임시로 null 반환
		Orders order = null; // ordersService.getOrderByIdWithItems(orderId);
		model.addAttribute("order", order);
		return PATH + "mysaleDetail";
	}
}