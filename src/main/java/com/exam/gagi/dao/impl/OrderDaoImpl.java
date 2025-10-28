package com.exam.gagi.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.OrderDao;
import com.exam.gagi.model.Order;

@Repository
public class OrderDaoImpl implements OrderDao {

	private final SqlSession sqlSession;
	
	public OrderDaoImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public Order selectOrderById(int orderId) {
		return sqlSession.selectOne("order.getOrderById", orderId);
	}


}
