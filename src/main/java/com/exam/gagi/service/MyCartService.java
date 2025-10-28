package com.exam.gagi.service;

import com.exam.gagi.model.MyCart;

import java.util.List;

public interface MyCartService {

    void addCart(MyCart cart);

    List<MyCart> getCartByUserId(int userId);

    MyCart getCartItem(int userId, int itemId);

    void updateCartQuantity(int userId, int itemId, int quantity);

    void removeCartItem(int userId, int itemId);

    void clearCart(int userId);

    // 재고 체크 후 실제 반영된 수량 반환
    int updateCartQuantityWithStockCheck(int userId, int itemId, int quantity);

    int addCartWithStockCheck(int userId, int itemId, int quantity);
}
