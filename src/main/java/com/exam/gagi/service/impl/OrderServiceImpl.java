package com.exam.gagi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.OrderDao;
import com.exam.gagi.model.OrderHistoryDTO;
import com.exam.gagi.model.Orders;
import com.exam.gagi.service.OrderService;

//판매자 내역 서비스Impl
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderDao dao;

	@Override
	public List<Orders> saleList() {

		return dao.saleList();
	}

	@Override
	public List<OrderHistoryDTO> getOrderList(Long id) {
		return dao.orderList(id);
	}

}
