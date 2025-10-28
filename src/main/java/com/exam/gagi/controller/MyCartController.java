package com.exam.gagi.controller;

import com.exam.gagi.model.MyCart;
import com.exam.gagi.service.MyCartService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mycart")
public class MyCartController {

    private final MyCartService myCartService;

    public MyCartController(MyCartService myCartService) {
        this.myCartService = myCartService;
    }
    
    @GetMapping("/view/{userId}")
    public String viewCart(@PathVariable int userId, Model model) {
        List<MyCart> cartList = myCartService.getCartByUserId(userId);

        int totalPrice = cartList.stream()
                                 .mapToInt(item -> item.getPrice() * item.getQuantity())
                                 .sum();

        model.addAttribute("cartList", cartList);
        model.addAttribute("totalPrice", totalPrice);

        return "mycart"; // => mycart.jsp
    }
    
    
    @GetMapping("/user/{userId}")
    public List<MyCart> getCart(@PathVariable int userId) {
        return myCartService.getCartByUserId(userId);
    }

    @PostMapping("/update")
    @ResponseBody
    public Map<String, Object> updateQuantity(@RequestBody MyCart cart) {
        System.out.println("== updateQuantity 요청 ==");
        System.out.println("userId: " + cart.getUserId());
        System.out.println("itemId: " + cart.getItemId());
        System.out.println("quantity: " + cart.getQuantity());

        Map<String, Object> response = new HashMap<>();
        try {
            myCartService.updateCartQuantity(cart.getUserId(), cart.getItemId(), cart.getQuantity());
            response.put("status", "success");
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "fail");
        }
        return response;
    }

    @GetMapping("/delete")
    public String deleteCart(@RequestParam int userId,
                             @RequestParam int itemId) {
        System.out.println("🛒 deleteCart 호출됨 - userId=" + userId + ", itemId=" + itemId);

        myCartService.removeCartItem(userId, itemId);

        System.out.println("✅ 장바구니 삭제 완료, redirect 실행");

        return "redirect:/mycart/view/" + userId;
    }

    @DeleteMapping("/clear/{userId}")
    public String clearCart(@PathVariable int userId) {
        myCartService.clearCart(userId);
        return "장바구니가 비워졌습니다.";
    }
    
    // 장바구니 추가 (AJAX 용)
    @PostMapping("/add")
    @ResponseBody
    public Map<String, Object> addCartAjax(@RequestParam Integer userId,
                                           @RequestParam int itemId,
                                           @RequestParam int quantity) {
        Map<String, Object> response = new HashMap<>();
        try {
            MyCart existing = myCartService.getCartItem(userId, itemId);
            if (existing != null) {
                int newQuantity = existing.getQuantity() + quantity;
                myCartService.updateCartQuantity(userId, itemId, newQuantity);
            } else {
                MyCart cart = new MyCart();
                cart.setUserId(userId);
                cart.setItemId(itemId);
                cart.setQuantity(quantity);
                myCartService.addCart(cart);
            }

            response.put("status", "success");
            response.put("message", "장바구니에 담겼습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "fail");
            response.put("message", "장바구니 담기 실패");
        }
        return response;
    }
}

