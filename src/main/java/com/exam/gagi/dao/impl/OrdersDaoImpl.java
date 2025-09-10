package com.exam.gagi.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.OrdersDao;
import com.exam.gagi.model.OrderDetailDto;
import com.exam.gagi.model.Orders;

@Repository
public class OrdersDaoImpl implements OrdersDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public void add(Orders item) {
		sql.insert("orders.add",item);
	}

	@Override
	public List<Orders> salelist() {
		return sql.selectList("orders.salelist");
	}

	@Override
	public List<OrderDetailDto> getDetailedOrderHistory(String userId) {
		return sql.selectList("orders.getDetailedOrderHistory", userId);
	}

}