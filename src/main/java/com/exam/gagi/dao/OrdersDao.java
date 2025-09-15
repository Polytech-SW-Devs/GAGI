package com.exam.gagi.dao;

import java.util.List;

import com.exam.gagi.model.OrderDetailDto;
import com.exam.gagi.model.Orders;

public interface OrdersDao {

	void add(Orders item);

	List<Orders> salelist(String sellerId);

	List<OrderDetailDto> orderList(String userId);
}
