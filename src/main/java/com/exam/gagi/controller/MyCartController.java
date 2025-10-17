package com.exam.gagi.controller;

import com.exam.gagi.dao.MyCartDAO;
import com.exam.gagi.model.MyCart;
import com.exam.gagi.service.MyCartService;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
    public ResponseEntity<Map<String, Object>> updateQuantity(@RequestBody MyCart cart) {
        System.out.println("== updateQuantity 요청 ==");
        System.out.println("userId: " + cart.getUserId());
        System.out.println("itemId: " + cart.getItemId());
        System.out.println("quantity: " + cart.getQuantity());

        Map<String, Object> response = new HashMap<>();
        try {
            int finalQty = myCartService.updateCartQuantityWithStockCheck(
                    cart.getUserId(), cart.getItemId(), cart.getQuantity()
            );

            response.put("status", "success");
            response.put("finalQuantity", finalQty);
            if (finalQty < cart.getQuantity()) {
                response.put("message", "재고가 부족하여 최대 수량(" + finalQty + ")으로 조정되었습니다.");
            }

            return ResponseEntity
                    .ok()
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(response);

        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "fail");
            response.put("message", "수량 업데이트 실패");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(response);
        }
    }

    @PostMapping("/add")
    @ResponseBody
    public Map<String, Object> addCartAjax(@RequestParam Integer userId,
                                           @RequestParam int itemId,
                                           @RequestParam int quantity) {
        Map<String, Object> response = new HashMap<>();
        try {
            MyCart existing = myCartService.getCartItem(userId, itemId);
            int finalQty;
            if (existing != null) {
                int requestedQty = existing.getQuantity() + quantity;
                finalQty = myCartService.updateCartQuantityWithStockCheck(userId, itemId, requestedQty);
            } else {
                finalQty = myCartService.addCartWithStockCheck(userId, itemId, quantity);
            }

            response.put("status", "success");
            response.put("finalQuantity", finalQty);

            if (finalQty < quantity) {
                response.put("message", "재고가 부족하여 일부만 장바구니에 담겼습니다. (" + finalQty + ")");
            } else {
                response.put("message", "장바구니에 담겼습니다.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "fail");
            response.put("message", "장바구니 담기 실패");
        }
        return response;
    }
    
    @GetMapping("/delete")
    public String deleteCartItem(@RequestParam int userId, @RequestParam int itemId) {
        try {
            // itemId가 유효한지 먼저 확인
            Integer stock = null;
            try {
                stock = myCartService.getCartItem(userId, itemId) != null
                        ? myCartService.getCartItem(userId, itemId).getQuantity()
                        : null;
            } catch (Exception e) {
                stock = null;
            }

            // 장바구니에서 삭제 시도 (itemId 없어도 조용히 넘어가게)
            myCartService.removeCartItem(userId, itemId);
            System.out.println("🗑️ 장바구니 항목 삭제됨 (itemId=" + itemId + ")");

        } catch (Exception e) {
            System.out.println("⚠️ 이미 삭제된 아이템이거나 존재하지 않습니다: " + itemId);
        }

        return "redirect:/mycart/view/" + userId;
    }
    
}

