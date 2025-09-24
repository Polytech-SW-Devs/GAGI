package com.exam.gagi.controller;

import com.exam.gagi.model.MyCart;
import com.exam.gagi.service.MyCartService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/mycart")
public class MyCartController {

    private final MyCartService myCartService;

    public MyCartController(MyCartService myCartService) {
        this.myCartService = myCartService;
    }

    @PostMapping("/add")
    public String addCart(@RequestBody MyCart cart) {
        myCartService.addCart(cart);
        return "장바구니에 추가되었습니다.";
    }

    @GetMapping("/user/{userId}")
    public List<MyCart> getCart(@PathVariable int userId) {
        return myCartService.getCartByUserId(userId);
    }

    @PutMapping("/update")
    public String updateQuantity(@RequestBody MyCart cart) {
        myCartService.updateCartQuantity(cart.getUserId(), cart.getItemId(), cart.getQuantity());
        return "수량이 업데이트되었습니다.";
    }

    @DeleteMapping("/delete")
    public String deleteItem(@RequestBody MyCart cart) {
        myCartService.removeCartItem(cart.getUserId(), cart.getItemId());
        return "장바구니에서 삭제되었습니다.";
    }

    @DeleteMapping("/clear/{userId}")
    public String clearCart(@PathVariable int userId) {
        myCartService.clearCart(userId);
        return "장바구니가 비워졌습니다.";
    }
}

