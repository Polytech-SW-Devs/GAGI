package com.exam.gagi.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.OrdersDao;
import com.exam.gagi.model.Orders;
import com.exam.gagi.pager.Pager;

@Repository
public class OrdersDaoImpl implements OrdersDao {

	@Autowired
	SqlSession sql;

	@Override
	public List<Orders> orderList(Pager pager) {

		return sql.selectList("orders.orderList", pager);
	}

	@Override
	public int orderTotal(Pager pager) {

		return sql.selectOne("orders.orderTotal", pager);
	}

	@Override
	public int saleTotal(Pager pager) {

		return sql.selectOne("orders.saleTotal", pager);

	}

	@Override
	public List<Orders> saleList(Pager pager) {
		return sql.selectList("orders.saleList", pager);

	}

}
