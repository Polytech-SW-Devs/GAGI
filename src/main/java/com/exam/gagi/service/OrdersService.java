package com.exam.gagi.service;

import java.util.List;

import com.exam.gagi.dto.OrderDetailDto;
import com.exam.gagi.dto.OrderSearchDto;
import com.exam.gagi.dto.SaleDetailDto;
import com.exam.gagi.dto.SaleSearchDto;
import com.exam.gagi.model.Orders;

public interface OrdersService {

	void add(Orders item);

	List<Orders> salelist(SaleSearchDto searchDto);

	List<OrderDetailDto> orderList(OrderSearchDto searchDto);

	int getTotal(int memberId);

	int getSaleTotal(int sellerId);

	SaleDetailDto getSaleDetail(int orderId, int sellerId);

}