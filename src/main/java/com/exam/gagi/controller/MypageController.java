package com.exam.gagi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.exam.gagi.model.Member;
import com.exam.gagi.model.MypageViewDto;
import com.exam.gagi.model.OrderSaleViewDto;
import com.exam.gagi.model.OrdersSaleDetailViewDto;
import com.exam.gagi.model.RecentOrderDto;
import com.exam.gagi.pager.MyPagePager;
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
	String mypage(Model model, @SessionAttribute(name = "loginUser", required = false) Member loginUser) {
		if (loginUser == null) {
			return "redirect:/login";
		}
		int id = loginUser.getId();
		MypageViewDto view = service.view(id);
		model.addAttribute("view", view);
		return PATH + "mypage";
	}

	// 구매 내역 조회
	@GetMapping("/myorder")
	String myOrders(Model model, @SessionAttribute(name = "loginUser", required = false) Member loginUser,
			@ModelAttribute("pager") MyPagePager pager) {
		if (loginUser == null) {
			return "redirect:/login";
		}

		int userId = loginUser.getId();
		pager.setUserId(userId);

		List<RecentOrderDto> list = service.orderList(pager);
		model.addAttribute("list", list);
		return PATH + "myorder";
	}

	@PostMapping("/cancelOrder")
	@ResponseBody
	public Map<String, Object> cancelOrder(@RequestParam int id) {
		Map<String, Object> response = new HashMap<>();

		try {
			// 주문 취소 처리
			boolean result = service.cancelOrder(id);

			if (result) {
				response.put("success", true);
				response.put("message", "주문이 성공적으로 취소되었습니다.");
			} else {
				response.put("success", false);
				response.put("message", "주문 취소에 실패했습니다.");
			}

		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "서버 오류가 발생했습니다: " + e.getMessage());
		}

		return response;
	}

	// 판매내역
	@GetMapping("/mysale")
	String mySales(Model model, @SessionAttribute(name = "loginUser", required = false) Member loginUser,
			@ModelAttribute("pager") MyPagePager pager) {

		if (loginUser == null) {
			return "redirect:/login";
		}

		int userId = loginUser.getId();
		pager.setUserId(userId);

		List<OrderSaleViewDto> list = service.saleList(pager);
		model.addAttribute("list", list);

		return PATH + "mysale";
	}

	@GetMapping("/mysaleDetail/{id}")
	public String mysaleDetail(@PathVariable("id") int id,
			@SessionAttribute(name = "loginUser", required = false) Member loginUser, Model model) {
		if (loginUser == null) {
			return "redirect:/login";
		}

		OrdersSaleDetailViewDto item = service.detail(id);
		model.addAttribute("item", item);
		return PATH + "mysaleDetail";
	}

	// 주문상태 업데이트
	@PostMapping("/updateOrderStatus")
	@ResponseBody
	public Map<String, Object> updateOrderStatus(@RequestParam int id, @RequestParam String orderStatus)
			throws Exception {
		Map<String, Object> response = new HashMap<>();
		try {
			// TODO: OrdersService에 updateOrderStatus 메소드를 추가하고 구현해야 합니다.
			// 이 메소드는 업데이트 성공 시 true, 실패 시 false를 반환한다고 가정합니다.
			boolean isSuccess = service.updateOrderStatus(id, orderStatus);

			if (isSuccess) {
				response.put("success", true);
				response.put("message", "주문상태가 성공적으로 변경되었습니다.");
			} else {
				response.put("success", false);
				response.put("message", "주문 상태 업데이트에 실패했습니다.");
			}
		} catch (Exception e) {
			// 실제 운영에서는 로깅 라이브러리(e.g., SLF4J)를 사용하여 에러를 기록해야 합니다.
			// log.error("Error updating order status for orderId: {}", orderId, e);
			response.put("success", false);
			response.put("message", "서버 처리 중 오류가 발생했습니다.");
		}
		return response;
	}
}
