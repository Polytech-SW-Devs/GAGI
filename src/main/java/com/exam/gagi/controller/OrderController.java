package com.exam.gagi.controller;

import com.exam.gagi.model.Member;
import com.exam.gagi.model.MyCart;
import com.exam.gagi.service.MemberService;
import com.exam.gagi.service.MyCartService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    private final MemberService memberService;
    private final MyCartService myCartService;

    public OrderController(MemberService memberService, MyCartService myCartService) {
        this.memberService = memberService;
        this.myCartService = myCartService;
    }

    // ✅ 결제 페이지로 이동
    @GetMapping("/checkout")
    public String checkoutPage(@RequestParam int userId, Model model) {

        // 1. 회원 정보 불러오기
    	Member user = memberService.findById(userId);
    	
    	System.out.println("checkout userId=" + userId);
    	System.out.println("user=" + user);

        // 2. 장바구니 목록 불러오기
        List<MyCart> cartList = myCartService.getCartByUserId(userId);

        // 3. 총합 계산
        int totalPrice = cartList.stream()
                .mapToInt(item -> item.getPrice() * item.getQuantity())
                .sum();

        // 4. JSP로 데이터 전달
        model.addAttribute("user", user);
        model.addAttribute("cartList", cartList);
        model.addAttribute("totalPrice", totalPrice);
        
        return "order/order"; // → order.jsp
    }

    // ✅ 주문 완료 처리
    @PostMapping("/complete")
    public String completeOrder(@RequestParam int userId,
                                @RequestParam String receiverName,
                                @RequestParam String address,
                                @RequestParam String phone,
                                Model model) {

        // 여기에 주문정보 저장 로직 추가 (OrderService.saveOrder(...))
        // ex) orderService.createOrder(userId, receiverName, address, phone);

        // 장바구니 비우기
        myCartService.clearCart(userId);

        model.addAttribute("message", "주문이 완료되었습니다!");
        return "orderComplete"; // → orderComplete.jsp
    }
}
