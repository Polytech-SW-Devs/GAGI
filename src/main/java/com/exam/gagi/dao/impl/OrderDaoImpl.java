package com.exam.gagi.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.OrderDao;
import com.exam.gagi.model.OrderHistoryDTO;
import com.exam.gagi.model.Orders;

@Repository
public class OrderDaoImpl implements OrderDao {
	@Autowired
	SqlSession sql;

	@Override
	public void add(Orders item) {
		sql.insert("orders.add", item);
	}

	@Override
	public List<Orders> saleList() {
		List<Orders> selectList = sql.selectList("orders.salelist");
		System.out.println("selectList: " + selectList);
		return selectList;
	}

	@Override
	public List<OrderHistoryDTO> orderList(Long id) {
		return sql.selectList("orders.orderlist", id);
	}

}
