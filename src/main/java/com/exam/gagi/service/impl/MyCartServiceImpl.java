package com.exam.gagi.service.impl;

import com.exam.gagi.dao.MyCartDAO;
import com.exam.gagi.model.MyCart;
import com.exam.gagi.service.MyCartService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyCartServiceImpl implements MyCartService {

    private final MyCartDAO myCartDAO;

    public MyCartServiceImpl(MyCartDAO myCartDAO) {
        this.myCartDAO = myCartDAO;
    }

    @Override
    public void addCart(MyCart cart) {
        MyCart existing = myCartDAO.findByUserAndItem(cart.getUserId(), cart.getItemId());
        if (existing != null) {
            int newQuantity = existing.getQuantity() + cart.getQuantity();
            myCartDAO.updateQuantity(cart.getUserId(), cart.getItemId(), newQuantity);
        } else {
            myCartDAO.insertCart(cart);
        }
    }

    @Override
    public List<MyCart> getCartByUserId(int userId) {
        return myCartDAO.findByUserId(userId);
    }

    @Override
    public MyCart getCartItem(int userId, int itemId) {
        return myCartDAO.findByUserAndItem(userId, itemId);
    }

    @Override
    public void updateCartQuantity(int userId, int itemId, int quantity) {
        myCartDAO.updateQuantity(userId, itemId, quantity);
    }
    
    @Override
    public int updateCartQuantityWithStockCheck(int userId, int itemId, int requestedQty) {
        int stock = myCartDAO.findItemStock(itemId); // amount 컬럼 조회
        int finalQty = Math.min(requestedQty, stock); // 재고보다 크면 재고로 제한

        myCartDAO.updateQuantity(userId, itemId, finalQty);
        return finalQty; // 실제 반영된 수량 반환
    }

    @Override
    public void removeCartItem(int userId, int itemId) {
        myCartDAO.deleteCartItem(userId, itemId);
    }

    @Override
    public void clearCart(int userId) {
        myCartDAO.deleteAllByUserId(userId);
    }
    
    @Override
    public int addCartWithStockCheck(int userId, int itemId, int quantity) {
        int stock = myCartDAO.findItemStock(itemId);
        int finalQty = Math.min(quantity, stock);

        MyCart cart = new MyCart();
        cart.setUserId(userId);
        cart.setItemId(itemId);
        cart.setQuantity(finalQty);

        myCartDAO.insertCart(cart);
        return finalQty; // 실제 담긴 수량 반환
    }
}

