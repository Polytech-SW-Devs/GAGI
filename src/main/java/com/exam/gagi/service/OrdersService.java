package com.exam.gagi.service;

import java.util.List;

import com.exam.gagi.model.MyBoard;
import com.exam.gagi.model.Orders;

public interface OrdersService {

	void add(Orders item);

	List<Orders> salelist(String sellerId);


	// 더미 order만들기
	void createDummyOrder(int l);


}