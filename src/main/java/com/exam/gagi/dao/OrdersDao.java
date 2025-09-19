package com.exam.gagi.dao;

import java.util.List;
import com.exam.gagi.model.Orders;
import com.exam.gagi.pager.Pager;

public interface OrdersDao {

	List<Orders> orderList(Pager pager);

	int orderTotal(Pager pager);
	int saleTotal(Pager pager);

	List<Orders> saleList(Pager pager);

}

