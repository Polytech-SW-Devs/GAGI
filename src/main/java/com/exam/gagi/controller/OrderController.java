package com.exam.gagi.controller;

import com.exam.gagi.model.Address;
import com.exam.gagi.model.Buy;
import com.exam.gagi.model.Items;
import com.exam.gagi.model.Member;
import com.exam.gagi.model.MyCart;
import com.exam.gagi.model.OrderSaleViewDto;
import com.exam.gagi.model.Orders;
import com.exam.gagi.service.BuyService;
import com.exam.gagi.service.DeleveryService;
import com.exam.gagi.service.MemberService;
import com.exam.gagi.service.MyCartService;
import com.exam.gagi.service.OrdersService;
import com.exam.gagi.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Field;
import java.util.List;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private final DeleveryService deleveryService;
	private final MemberService memberService;
	private final MyCartService myCartService;
	private final OrdersService ordersService;
	private final BuyService buyService;
	private final ProductService productService;
	
	public OrderController(MemberService memberService, MyCartService myCartService, DeleveryService deleveryService ,OrdersService orderService, BuyService buyService, ProductService productService) {
		this.memberService = memberService;
		this.myCartService = myCartService;
		this.deleveryService=deleveryService;
		this.ordersService=orderService;
		this.buyService=buyService;
		this.productService=productService;
	}

	@GetMapping("/buynow/{id}")
	public String buynow(HttpSession session, @PathVariable("id") int itemUserId, Model model, @RequestParam("quantity") int quantity) {
		// 회원 정보 불러오기
		
		Member user = (Member) session.getAttribute("loginUser");
		if(user == null) return "../login";
		
		// 상품 정보 불러오기 (productId로)
		Buy item = buyService.item(itemUserId);
		System.out.println("itemId = " + item.getId());
		
		int userId = user.getId();
		System.out.println("userId = "+userId);
		
		// 총합 계산
		int totalPrice = item.getPrice() * quantity;
		
		// 주소 목록 불러오기
		List<Address> addressList = deleveryService.addressList(userId);
		
		// JSP로 데이터 전달
		model.addAttribute("user", user);
		model.addAttribute("item", item);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("addressList", addressList);
		model.addAttribute("quantity", quantity);
		
		
		return "order/orderOnce"; // → order.jsp
	}

    	//결제완료처리
		@PostMapping("/buynowcomplete")
		public String buynowcomplete( HttpSession session,
		        @RequestParam int userId,
		        @RequestParam String receiverName,
		        @RequestParam String receiverPhone,
		        @RequestParam String zipCode,
		        @RequestParam String address,
		        @RequestParam String addressDetail,
		        @RequestParam String title,
		        Model model, Buy item) {
		
    	// 전화번호에서 - 제거
		receiverPhone = receiverPhone.replaceAll("[^0-9]", "");
    	
		
		
		
		
		// 2. Orders 테이블에 저장
		Orders order = new Orders();
		order.setUserId(userId);
		order.setItemId(item.getId());
		order.setPrice(item.getPrice());
		order.setAmount(item.getAmount());
		order.setTotalPrice(item.getPrice()*item.getAmount());
		order.setTransactionType("배송");
		order.setPaymentMethod("계좌이체"); // 임시 결제 수단
		order.setDeliveryMemo("없음"); // 배송요청사항        
		order.setRecipientName(receiverName);
		order.setRecipientPhone(receiverPhone);
		order.setDeliveryZipcode(zipCode);
		order.setDeliveryAddressMain(address);
		order.setDeliveryAddressDetail(addressDetail);
		order.setOrderStatus("입금준비"); // 결제 완료 처리
		
		buyService.saveOrder(order); // Orders 저장
		
		
		
		// 4. 모델에 주문 정보 전달
		model.addAttribute("order", order);
		model.addAttribute("title", title);
		
		// ✅ 총 결제 금액 계산
		int totalPrice = item.getPrice()*item.getAmount();
		model.addAttribute("totalPrice", totalPrice);
		
		return "order/orderOnceComplete"; 
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
            order.setOrderStatus("입금준비"); // 결제 완료 처리

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
