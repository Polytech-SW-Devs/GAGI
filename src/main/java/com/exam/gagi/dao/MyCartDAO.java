package com.exam.gagi.dao;

import com.exam.gagi.model.MyCart;
import java.util.List;

public interface MyCartDAO {

    void insertCart(MyCart cart);

    List<MyCart> findByUserId(int userId);

    MyCart findByUserAndItem(int userId, int itemId);

    void updateQuantity(int userId, int itemId, int quantity);

    void deleteCartItem(int userId, int itemId);

    void deleteAllByUserId(int userId);

	int findItemStock(int itemId);
}

