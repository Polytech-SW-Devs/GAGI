package com.exam.gagi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.OrdersDao;
import com.exam.gagi.dto.OrderDetailDto;
import com.exam.gagi.dto.OrderSearchDto;
import com.exam.gagi.dto.SaleDetailDto;
import com.exam.gagi.dto.SaleSearchDto;
import com.exam.gagi.model.Orders;
import com.exam.gagi.service.OrdersService;

@Service
public class OrdersServiceImpl implements OrdersService {

	@Autowired
	OrdersDao dao;

	@Override
	public void add(Orders item) {
		dao.add(item);
	}

	@Override
	public List<Orders> salelist(SaleSearchDto searchDto) {
		return dao.salelist(searchDto);
	}

	@Override
	public List<OrderDetailDto> orderList(OrderSearchDto searchDto) {
		return dao.orderList(searchDto);
	}

	@Override
	public int getTotal(int userId) {
		return dao.getTotal(userId);
	}

	@Override
	public int getSaleTotal(int sellerId) {
		return dao.getSaleTotal(sellerId);
	}

	@Override
	public SaleDetailDto getSaleDetail(int orderId, int sellerId) {
		Map<String, Object> params = new HashMap<>();
		params.put("orderId", orderId);
		params.put("sellerId", sellerId);
		return dao.getSaleDetail(params);
	}

}
