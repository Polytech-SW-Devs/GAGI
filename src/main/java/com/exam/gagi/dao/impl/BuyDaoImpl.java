package com.exam.gagi.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.BuyDao;
import com.exam.gagi.model.Buy;
import com.exam.gagi.model.Items;
import com.exam.gagi.model.OrderSaleViewDto;
import com.exam.gagi.model.Orders;

@Repository
public class BuyDaoImpl implements BuyDao {
	
	@Autowired
	SqlSession sql;
		
	@Override
	public OrderSaleViewDto buy() {
		return null;
	}

	@Override
	public Buy item(int id) {
		
		return sql.selectOne("buy.buyone",id);
	}

	@Override
	public void saveOrder(Orders order) {
		sql.insert("buy.saveOrder",order);
		
	}

}
