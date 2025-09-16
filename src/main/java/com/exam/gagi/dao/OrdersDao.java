package com.exam.gagi.dao;

import java.util.List;
import java.util.Map;

import com.exam.gagi.dto.OrderDetailDto;
import com.exam.gagi.dto.OrderSearchDto;
import com.exam.gagi.dto.SaleDetailDto;
import com.exam.gagi.dto.SaleSearchDto;
import com.exam.gagi.model.Orders;

public interface OrdersDao {

	void add(Orders item);

	List<Orders> salelist(SaleSearchDto searchDto);

	List<OrderDetailDto> orderList(OrderSearchDto searchDto);

	int getTotal(String userId);

	int getSaleTotal(String sellerId);

	SaleDetailDto getSaleDetail(Map<String, Object> params);
}