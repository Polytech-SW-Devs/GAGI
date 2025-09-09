package com.exam.gagi.dao;

import java.util.List;

import com.exam.gagi.model.OrderHistoryDTO;
import com.exam.gagi.model.Orders;

public interface OrderDao {

	void add(Orders item);

	List<Orders> saleList();

	List<OrderHistoryDTO> orderList(Long id);

}
