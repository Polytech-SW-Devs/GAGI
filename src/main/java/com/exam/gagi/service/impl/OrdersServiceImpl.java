package com.exam.gagi.service.impl;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.OrdersDao;
import com.exam.gagi.model.Orders;
import com.exam.gagi.pager.Pager;
import com.exam.gagi.service.OrdersService;

@Service
public class OrdersServiceImpl implements OrdersService {

	@Autowired
	OrdersDao dao;

	@Override
	public List<Orders> orderList(Pager pager) {
		int total = dao.orderTotal(pager);
		pager.setTotal(total);
		return dao.orderList(pager);
	}

	@Override
	public List<Orders> saleList(Pager pager) {
		int total = dao.saleTotal(pager);
		pager.setTotal(total);
		return dao.saleList(pager);
	}

}
