package com.exam.gagi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.OrderDao;
import com.exam.gagi.model.Order;
import com.exam.gagi.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;

	@Override
	public Order getOrderById(int orderId) {
		return orderDao.selectOrderById(orderId);
	}
	

}
