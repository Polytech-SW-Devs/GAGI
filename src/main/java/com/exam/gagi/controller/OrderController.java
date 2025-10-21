package com.exam.gagi.controller;

import com.exam.gagi.model.Address;
import com.exam.gagi.model.Member;
import com.exam.gagi.model.MyCart;
import com.exam.gagi.model.Orders;
import com.exam.gagi.service.DeleveryService;
import com.exam.gagi.service.MemberService;
import com.exam.gagi.service.MyCartService;
import com.exam.gagi.service.OrdersService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private final DeleveryService deleveryService;
    private final MemberService memberService;
    private final MyCartService myCartService;
    private final OrdersService ordersService;

    public OrderController(MemberService memberService, MyCartService myCartService, DeleveryService deleveryService ,OrdersService orderService) {
        this.memberService = memberService;
        this.myCartService = myCartService;
        this.deleveryService=deleveryService;
        this.ordersService=orderService;
    }

    // ✅ 결제 페이지로 이동
    @GetMapping("/checkout")
    public String checkoutPage(@RequestParam int userId, Model model) {

        // 1. 회원 정보 불러오기
        Member user = memberService.findById(userId);

        System.out.println("checkout userId = " + userId);
        System.out.println("user = " + user);

        // 2. 장바구니 목록 불러오기
        List<MyCart> cartList = myCartService.getCartByUserId(userId);

        // 3. 총합 계산
        int totalPrice = cartList.stream()
                .mapToInt(item -> item.getPrice() * item.getQuantity())
                .sum();

        // ✅ 4. 주소 목록 불러오기 (DeleveryService 활용)
        List<Address> addressList = deleveryService.addressList(userId);

        // ✅ 5. JSP로 데이터 전달
        model.addAttribute("user", user);
        model.addAttribute("cartList", cartList);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("addressList", addressList);

        return "order/order"; // → order.jsp
    }

    //장바구니 결제완료처리
    @PostMapping("/complete")
    public String completeOrder(
            @RequestParam int userId,
            @RequestParam String receiverName,
            @RequestParam String receiverPhone,
            @RequestParam String zipCode,
            @RequestParam String address,
            @RequestParam String addressDetail,
            Model model) {

        // 전화번호에서 - 제거
    	 receiverPhone = receiverPhone.replaceAll("[^0-9]", "");

        // 1. 장바구니 전체 불러오기 (테스트용)
        List<MyCart> cartList = myCartService.getCartByUserId(userId);

        // 2. 장바구니 아이템 하나씩 Orders 테이블에 저장
        for (MyCart cart : cartList) {
            Orders order = new Orders();
            order.setUserId(userId);
            order.setItemId(cart.getItemId());
            order.setPrice(cart.getPrice());
            order.setAmount(cart.getQuantity());
            order.setTotalPrice(cart.getPrice() * cart.getQuantity());
            order.setTransactionType("배송");
            order.setPaymentMethod("간편결제"); // 임시 결제 수단
            order.setRecipientName(receiverName);
            order.setRecipientPhone(receiverPhone);
            order.setDeliveryZipcode(zipCode);
            order.setDeliveryAddressMain(address);
            order.setDeliveryAddressDetail(addressDetail);
            order.setOrderStatus("입금완료"); // 결제 완료 처리

            ordersService.saveOrder(order); // Orders 저장
        }

        // 3. 장바구니 비우기
        myCartService.clearCart(userId);

        // 4. 모델에 주문 정보 전달
        model.addAttribute("orderList", cartList);

        // ✅ 총 결제 금액 계산
        int totalPrice = cartList.stream().mapToInt(c -> c.getPrice() * c.getQuantity()).sum();
        model.addAttribute("totalPrice", totalPrice);

        return "order/orderComplete"; // orderComplete.jsp
    }

}
