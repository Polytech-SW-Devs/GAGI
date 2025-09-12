package com.exam.gagi.service;

import java.util.List;

import com.exam.gagi.model.MyBoard;
import com.exam.gagi.model.OrderDetailDto;
import com.exam.gagi.model.Orders;

public interface OrdersService {

	void add(Orders item);

	List<Orders> salelist(String sellerId);

	List<OrderDetailDto> orderList(String userId);

	// 더미 order만들기
	void createDummyOrder(long userId);
	
	// 내 게시글 페이지
	List<MyBoard> list();

}