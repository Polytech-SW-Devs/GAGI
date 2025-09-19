package com.exam.gagi.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.OrdersDao;
import com.exam.gagi.dto.OrderDetailDto;
import com.exam.gagi.dto.OrderSearchDto;
import com.exam.gagi.dto.SaleDetailDto;
import com.exam.gagi.dto.SaleSearchDto;
import com.exam.gagi.model.Orders;

@Repository
public class OrdersDaoImpl implements OrdersDao {

	@Autowired
	SqlSession sql;

	@Override
	public void add(Orders item) {
		sql.insert("orders.add", item);
	}

	@Override
	public List<Orders> salelist(SaleSearchDto searchDto) {
		return sql.selectList("orders.salelist", searchDto);
	}

	@Override
	public List<OrderDetailDto> orderList(OrderSearchDto searchDto) {
		return sql.selectList("orders.orderList", searchDto);
	}

	@Override
	public int getTotal(int userId) {
		return sql.selectOne("orders.getTotal", userId);
	}

	@Override
	public int getSaleTotal(int sellerId) {
		return sql.selectOne("orders.getSaleTotal", sellerId);
	}

	@Override
	public SaleDetailDto getSaleDetail(Map<String, Object> params) {
		List<SaleDetailDto> list = sql.selectList("orders.getSaleDetail", params);
		return list.isEmpty() ? null : list.get(0);
	}
}
