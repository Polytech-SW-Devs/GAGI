package com.exam.gagi.service;

import java.util.List;

import com.exam.gagi.model.OrderDetailDto;
import com.exam.gagi.model.Orders;

public interface OrdersService {

	void add(Orders item);

	List<Orders> salelist();

	List<OrderDetailDto> getDetailedOrderHistory(String userId);

}