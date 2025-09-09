package com.exam.gagi.service;

import java.util.List;

import com.exam.gagi.model.OrderHistoryDTO;
import com.exam.gagi.model.Orders;

//판매자 내역 서비스
public interface OrderService {

	List<Orders> saleList();

	List<OrderHistoryDTO> getOrderList(Long id);

}
