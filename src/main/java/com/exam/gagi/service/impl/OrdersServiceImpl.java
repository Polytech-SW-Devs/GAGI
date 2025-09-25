package com.exam.gagi.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.gagi.dao.MemberDao;
import com.exam.gagi.dao.OrdersDao;
import com.exam.gagi.model.MypageViewDto;
import com.exam.gagi.model.OrderSaleViewDto;
import com.exam.gagi.model.OrdersSaleDetailViewDto;
import com.exam.gagi.model.RecentOrderDto;
import com.exam.gagi.pager.MyPagePager;
import com.exam.gagi.service.OrdersService;

@Service
public class OrdersServiceImpl implements OrdersService {

	@Autowired
	OrdersDao dao;
	@Autowired
	MemberDao memberDao;

	// 구매내역
	@Override
	public List<RecentOrderDto> orderList(MyPagePager pager) {
		int total = dao.orderTotal(pager);
		pager.setTotal(total);
		return dao.orderList(pager);
	}

	// 판매내역
	@Override
	public List<OrderSaleViewDto> saleList(MyPagePager pager) {
		int total = dao.saleTotal(pager);
		pager.setTotal(total);
		return dao.saleList(pager);
	}

	@Override
	public OrdersSaleDetailViewDto detail(int id) {

		return dao.datail(id);
	}

	@Override
	public boolean updateOrderStatus(int id, String orderStatus) {
		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("orderStatus", orderStatus);

		// DAO의 updateOrderStatus 메소드를 호출합니다.
		// 이 DAO 메소드는 업데이트된 행의 수를 반환해야 합니다.
		int affectedRows = dao.updateOrderStatus(params);

		return affectedRows > 0;
	}

	@Override
	public boolean cancelOrder(int id) {
		// 주문 취소는 주문 상태를 '취소'로 업데이트하는 것과 동일하므로
		// 기존의 updateOrderStatus 메소드를 재사용합니다.
		return this.updateOrderStatus(id, "취소");
	}

	@Transactional
	@Override
	public MypageViewDto view(int id) {
		// 회원정보 + 집계
		MypageViewDto dto = memberDao.myPageInfo(id);

		// 최근 구매내역 3개
		// MyPagePager를 생성하여 최근 3개의 구매내역을 가져옵니다.
		MyPagePager pager = new MyPagePager();
		pager.setUserId(id); // 현재 마이페이지를 조회하는 사용자의 ID 설정
		pager.setPage(1);    // 첫 번째 페이지
		pager.setPerPage(3); // 3개만 가져오기

		dto.setRecentOrders(dao.orderList(pager)); // 새로운 orderList 메소드 사용

		return dto;
	}

}
