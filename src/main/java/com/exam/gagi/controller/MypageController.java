package com.exam.gagi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

	@GetMapping("")
	String mypage(Model model) {

		return PATH + "mypage";
	}

	@GetMapping("/myarticle")
	String myArticles() {
		return PATH + "myarticle";
	}

	@GetMapping("/myorder")
	String myOrders(Model model, HttpSession session) {
		// 로그인 임시 코드
		// 세션에 "member"가 없으면, 테스트용 Member 객체를 생성하여 세션에 저장
		if (session.getAttribute("member") == null) {
			Member testMember = new Member();
			testMember.setId(2); // DB에 주문 내역이 있는 사용자 ID
			testMember.setEmail("test@example.com");
			testMember.setNickname("테스트유저");
			session.setAttribute("member", testMember);
			System.out.println("임시 세션이 생성되었습니다. 사용자 ID: 2");
		}
		// 임시 코드 끝

		// 세션에서 member 정보 가져오기
		Member member = (Member) session.getAttribute("member");

		// 로그인되지 않은 경우 로그인 페이지로 리다이렉트
		if (member == null) {
			return "redirect:/login";
		}

		String memberId = String.valueOf(member.getId());

		// 주문 내역 조회 (계층 구조로 변경)
		List<OrderDetailDto> orderHistory = ordersService.getDetailedOrderHistory(memberId);
		model.addAttribute("orderHistory", orderHistory);
		return PATH + "myorder";
	}

	@GetMapping("/mysale")
	String mySales(Model model) {
		List<Orders> list = ordersService.salelist();
		System.out.println("list: " + list);
		model.addAttribute("list", list);
		return PATH + "mysale";
	}
}