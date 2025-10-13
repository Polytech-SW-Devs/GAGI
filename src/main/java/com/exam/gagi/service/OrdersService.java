package com.exam.gagi.service;

import java.util.List;

import com.exam.gagi.model.MypageViewDto;
import com.exam.gagi.model.OrderSaleViewDto;
import com.exam.gagi.model.Orders;
import com.exam.gagi.model.OrdersSaleDetailViewDto;
import com.exam.gagi.model.RecentOrderDto;
import com.exam.gagi.pager.MyPagePager;

public interface OrdersService {
	// 구매내역
	List<RecentOrderDto> orderList(MyPagePager pager);

	// 판매내역
	List<OrderSaleViewDto> saleList(MyPagePager pager);

	// 판매 상세 내역
	OrdersSaleDetailViewDto detail(int id);

	// 주문 상태 변경(판매자 기준)
	boolean updateOrderStatus(int id, String orderStatus);

	// 주문 취소(구매자 기준)
	boolean cancelOrder(int id);

	// 마이페이지 뷰
	MypageViewDto view(int id);

	// 주문번호로 Orders 조회
	Orders item(int id);

}