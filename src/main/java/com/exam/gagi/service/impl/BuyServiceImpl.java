package com.exam.gagi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.BuyDao;
import com.exam.gagi.model.Buy;
import com.exam.gagi.model.Items;
import com.exam.gagi.model.OrderSaleViewDto;
import com.exam.gagi.model.Orders;
import com.exam.gagi.service.BuyService;


@Service
public class BuyServiceImpl implements BuyService{

	@Autowired
	BuyDao dao;

	@Override
	public OrderSaleViewDto buy() {
		return dao.buy();
	}

	@Override
	public Buy item(int id) {
		
		return dao.item(id);
	}

	@Override
	public void saveOrder(Orders order) {
		dao.saveOrder(order);
		
	}
	
	

}
