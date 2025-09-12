package com.exam.gagi.dao;

import java.util.List;

import com.exam.gagi.model.Item;
import com.exam.gagi.model.MyBoard;
import com.exam.gagi.model.OrderDetailDto;
import com.exam.gagi.model.OrderItem;
import com.exam.gagi.model.Orders;

public interface OrdersDao {

	void add(Orders item);

	List<Orders> salelist(String sellerId);

	List<OrderDetailDto> orderList(String userId);

	// OrderItem 더미 데이터 추가메서드
	void addOrderItem(OrderItem orderItem);

	// 랜덤 상품리스트 가져오는 메서드
	List<Item> findRandomItems(int limit);

	// 내 게시글 페이지
	List<MyBoard> list();

}
