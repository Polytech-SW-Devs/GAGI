package com.exam.gagi.dao;

import com.exam.gagi.model.Order;

public interface OrderDao {

	// 단일 주문 조회 (주문 ID 기준)
	Order selectOrderById(int orderId);


}
