package com.exam.gagi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.gagi.dao.MemberDao;
import com.exam.gagi.dao.OrdersDao;
import com.exam.gagi.dao.ProductDao;
import com.exam.gagi.model.MypageViewDto;
import com.exam.gagi.model.OrderSaleViewDto;
import com.exam.gagi.model.Orders;
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
	@Autowired
	ProductDao productDao;

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

	@Transactional
	@Override
	public boolean updateOrderStatus(int id, String orderStatus) {
		if ("취소".equals(orderStatus)) {
			Orders item = dao.item(id);

			if (item == null) {
				// 주문이 존재하지 않을시 예외처리
				throw new IllegalArgumentException("주문 ID " + id + "에 해당하는 주문을 찾을 수 없습니다.");
			}

			int itemId = item.getItemId();
			int amount = item.getAmount();

			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", itemId);
			params.put("amount", amount);

			int affectedRows = productDao.changeAmount(params);

			if (affectedRows <= 0) {
				// 재고 복구 실패 시 RuntimeException을 발생시켜 전체 트랜잭션을 롤백
				throw new RuntimeException("재고 복구에 실패했습니다. 주문 ID: " + id);
			}

		}

		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("orderStatus", orderStatus);

		// DAO의 updateOrderStatus 메소드를 호출합니다.
		// 이 DAO 메소드는 업데이트된 행의 수를 반환해야 합니다.
		int affectedRows = dao.updateOrderStatus(params);

		return affectedRows > 0;
	}

	@Transactional
	@Override
	public boolean cancelOrder(int id) {

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
		pager.setPage(1); // 첫 번째 페이지
		pager.setPerPage(3); // 3개만 가져오기

		dto.setRecentOrders(dao.orderList(pager)); // 새로운 orderList 메소드 사용

		return dto;
	}

	// 주문번호로 Orders 조회
	@Override
	public Orders item(int id) {
		return dao.item(id);
	}

}
