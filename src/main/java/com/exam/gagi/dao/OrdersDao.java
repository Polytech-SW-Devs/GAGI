package com.exam.gagi.dao;

import java.util.List;
import java.util.Map;

import com.exam.gagi.model.OrderSaleViewDto;
import com.exam.gagi.model.Orders;
import com.exam.gagi.model.OrdersSaleDetailViewDto;
import com.exam.gagi.model.RecentOrderDto;
import com.exam.gagi.pager.MyPagePager;

public interface OrdersDao {
	// 구매내역
	List<RecentOrderDto> orderList(MyPagePager pager);

	// 구매내역 전체 페이징
	int orderTotal(MyPagePager pager);

	// 판매내역 전체 페이징
	int saleTotal(MyPagePager pager);

	// 판매내역
	List<OrderSaleViewDto> saleList(MyPagePager pager);

	// 판매 상세 내역
	OrdersSaleDetailViewDto datail(int id);

	// 주문 상태 변경
	int updateOrderStatus(Map<String, Object> params);

	// 주문번호로 Orders 조회
	Orders item(int id);

}
