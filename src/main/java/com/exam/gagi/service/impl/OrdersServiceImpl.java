package com.exam.gagi.service.impl;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.gagi.dao.OrdersDao;
import com.exam.gagi.model.Item;
import com.exam.gagi.model.OrderDetailDto;
import com.exam.gagi.model.OrderItem;
import com.exam.gagi.model.Orders;
import com.exam.gagi.service.OrdersService;

@Service
public class OrdersServiceImpl implements OrdersService {

	@Autowired
	OrdersDao dao;
	
	@Override
	public void add(Orders item) {
		dao.add(item);
	}

	@Override
	public List<Orders> salelist(String sellerId) {
		return dao.salelist(sellerId);
	}

	@Override
	public List<OrderDetailDto> orderList(String userId) {
		return dao.orderList(userId);
	}

	@Transactional
	@Override
	public void createDummyOrder(long userId) {
		// 1. DB에서 임의의 상품 1~3개를 가져온다.
		int itemCount = ThreadLocalRandom.current().nextInt(1, 4); // 1, 2, or 3
		List<Item> randomItems = dao.findRandomItems(itemCount);
		
		if (randomItems.isEmpty()) {
			// 상품이 하나도 없으면 더미 데이터 생성 불가
			return;
		}

		// 2. 주문(Orders) 객체 생성
		Orders order = new Orders();
		order.setUserId(userId);
		
		// 2-1. 총 가격 계산
		BigDecimal totalPrice = BigDecimal.ZERO;
		for (Item item : randomItems) {
			// 각 상품의 가격을 더함 (수량은 1로 가정)
			totalPrice = totalPrice.add(item.getPrice());
		}
		order.setTotalPrice(totalPrice);

		// 2-2. 임의의 주문 상태 설정 (Orders에서는 제거됨)
		List<String> statuses = Arrays.asList("입금완료", "배송중", "배송완료");
		String randomStatus = statuses.get(ThreadLocalRandom.current().nextInt(statuses.size()));
		// order.setOrderStatus(randomStatus); // Orders에서 제거됨
		
		// 2-3. 기타 더미 데이터 채우기
		order.setTransactionType("DELIVERY"); // 또는 "DIRECT"
		order.setPaymentMethod("CARD");
		order.setRecipientName("더미 수령인");
		order.setRecipientPhone("010-0000-0000");
		order.setDeliveryZipcode("12345");
		order.setDeliveryAddressMain("더미 주소");
		order.setDeliveryAddressDetail("상세주소");
		order.setDeliveryMemo("문 앞에 놓아주세요.");
		// order.setMeetingLocation(null); // 제거됨
		// order.setMeetingDateTime(null); // 제거됨
		// order.setContactInfo(null); // 제거됨

		// 3. 주문(Orders)을 DB에 추가. 이 때 order 객체에 생성된 ID가 담긴다.
		dao.add(order);
		Long orderId = order.getId();

		// 4. 주문상품(OrderItem) 객체들을 생성하고 DB에 추가
		for (Item item : randomItems) {
			OrderItem orderItem = new OrderItem();
			orderItem.setOrderId(orderId);
			orderItem.setItemId(item.getId());
			orderItem.setQuantity(1); // 수량은 1로 고정
			orderItem.setPrice(item.getPrice()); // 주문 당시 가격
			orderItem.setOrderStatus(randomStatus); // OrderItem에 주문 상태 설정
			
			dao.addOrderItem(orderItem);
		}
	}

}
