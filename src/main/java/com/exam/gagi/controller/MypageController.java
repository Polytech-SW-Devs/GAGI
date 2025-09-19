package com.exam.gagi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.exam.gagi.dto.OrderDetailDto;
import com.exam.gagi.dto.OrderSearchDto;
import com.exam.gagi.dto.SaleDetailDto;
import com.exam.gagi.dto.SaleSearchDto;
import com.exam.gagi.model.Member;
import com.exam.gagi.model.Orders;
import com.exam.gagi.pager.Pager;
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

	// 마이페이지 메인 화면
	@GetMapping("")
	String mypage(Model model, HttpSession session, Pager pager) {
		// 세션에서 member 정보 가져오기
		Member member = (Member) session.getAttribute("loginUser");

		// 로그인되지 않은 경우 로그인 페이지로 리다이렉트
		if (member == null) {
			return "redirect:/login";
		}

		int memberId = member.getId();

		// 총 주문 수량으로 Pager 설정
		pager.setTotal(ordersService.getTotal(memberId));

		// OrderSearchDto 생성 및 설정
		OrderSearchDto searchDto = new OrderSearchDto();
		searchDto.setUserId(memberId);
		searchDto.setPager(pager);

		// 주문 내역 조회 (페이징 적용)
		List<OrderDetailDto> orderHistory = ordersService.orderList(searchDto);

		model.addAttribute("orderHistory", orderHistory);
		model.addAttribute("pager", pager);

		return PATH + "mypage";
	}

	// 내 게시글 보기
	@GetMapping("/myarticle")
	String myArticles() {
		return PATH + "myarticle";
	}

	// 구매 내역 조회
	@GetMapping("/myorder")
	String myOrders(Model model, HttpSession session, Pager pager) {
		// 세션에서 member 정보 가져오기
		Member member = (Member) session.getAttribute("loginUser");

		// 로그인되지 않은 경우 로그인 페이지로 리다이렉트
		if (member == null) {
			return "redirect:/login";
		}

		int memberId = member.getId();

		// 총 주문 수량으로 Pager 설정
		pager.setTotal(ordersService.getTotal(memberId));

		// OrderSearchDto 생성 및 설정
		OrderSearchDto searchDto = new OrderSearchDto();
		searchDto.setUserId(memberId);
		searchDto.setPager(pager);

		// 주문 내역 조회 (페이징 적용)
		List<OrderDetailDto> orderHistory = ordersService.orderList(searchDto);

		model.addAttribute("orderHistory", orderHistory);
		model.addAttribute("pager", pager);

		return PATH + "myorder";
	}

	// 판매내역
	@GetMapping("/mysale")
	String mySales(Model model, HttpSession session, Pager pager) {

		// 세션에서 member 정보 가져오기
		Member member = (Member) session.getAttribute("loginUser");

		// 로그인되지 않은 경우 로그인 페이지로 리다이렉트
		if (member == null) {
			return "redirect:/login";
		}

		int sellerId = member.getId();

		// 총 판매내역 수량으로 Pager 설정
		pager.setTotal(ordersService.getSaleTotal(sellerId));

		// SaleSearchDto 생성 및 설정
		SaleSearchDto searchDto = new SaleSearchDto(sellerId, pager);

		List<Orders> list = ordersService.salelist(searchDto);

		model.addAttribute("list", list);
		model.addAttribute("pager", pager);

		return PATH + "mysale";
	}

	@GetMapping("/mysaleDetail/{orderId}")
	public String mysaleDetail(@PathVariable("orderId") int orderId, Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");
		if (member == null) {
			return "redirect:/login";
		}
		int sellerId = member.getId();

		SaleDetailDto order = ordersService.getSaleDetail(orderId, sellerId);

		model.addAttribute("order", order);
		return PATH + "mysaleDetail";
	}
}
