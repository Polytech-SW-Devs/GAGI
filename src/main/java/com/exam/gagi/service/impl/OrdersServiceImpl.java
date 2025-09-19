package com.exam.gagi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.OrdersDao;

import com.exam.gagi.model.Item;
import com.exam.gagi.model.MyBoard;

import com.exam.gagi.model.OrderDetailDto;
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
	public List<Orders> salelist(String sellerId) {
		return dao.salelist(sellerId);
	}

	@Override
	public List<OrderDetailDto> orderList(String userId) {
		return dao.orderList(userId);
	}

	//내 게시글 페이지
	@Override
	public List<MyBoard> list() {
		return dao.list();
	}

}
