package com.exam.gagi.service;

import java.util.List;


import com.exam.gagi.model.Orders;
import com.exam.gagi.pager.Pager;

public interface OrdersService {

	List<Orders> orderList(Pager pager);

	List<Orders> saleList(Pager pager);

}