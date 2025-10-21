package com.exam.gagi.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.OrdersDao;
import com.exam.gagi.model.OrderSaleViewDto;
import com.exam.gagi.model.Orders;
import com.exam.gagi.model.OrdersSaleDetailViewDto;
import com.exam.gagi.model.RecentOrderDto;
import com.exam.gagi.pager.MyPagePager;

@Repository
public class OrdersDaoImpl implements OrdersDao {

	@Autowired
	SqlSession sql;

	// 구매내역
	@Override
	public List<RecentOrderDto> orderList(MyPagePager pager) {

		return sql.selectList("orders.orderList", pager);
	}

	// 구매내역 전체 페이징
	@Override
	public int orderTotal(MyPagePager pager) {

		return sql.selectOne("orders.orderTotal", pager);
	}

	// 판매내역 전체 페이징

	@Override
	public int saleTotal(MyPagePager pager) {

		return sql.selectOne("orders.saleTotal", pager);

	}

	// 판매내역
	@Override
	public List<OrderSaleViewDto> saleList(MyPagePager pager) {
		return sql.selectList("orders.saleList", pager);

	}

	// 판매 상세 내역
	@Override
	public OrdersSaleDetailViewDto datail(int id) {

		return sql.selectOne("orders.detail", id);
	}

	// 주문상태 변경
	@Override
	public int updateOrderStatus(Map<String, Object> params) {
		return sql.update("orders.updateOrderStatus", params);
	}

	@Override
	public Orders item(int id) {
		return sql.selectOne("orders.item", id);
	}
	
	// SONG: 새로 추가 - 주문 저장
    @Override
    public void insertOrder(Orders order) {
        sql.insert("orders.insertOrder", order);
    }

}
