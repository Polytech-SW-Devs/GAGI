package com.exam.gagi.pager;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class MyPagePager extends Pager {

	private int userId;
	private String orderStatus; // 주문 상태 필터

	@Override
	public String getQuery() {
		String query = super.getQuery();

		try {
			if (orderStatus != null && !orderStatus.isEmpty()) {
				query += "&orderStatus=" + URLEncoder.encode(orderStatus, StandardCharsets.UTF_8.name());
			}
		} catch (UnsupportedEncodingException e) {
			// StandardCharsets.UTF_8.name()은 항상 유효하므로 이 예외는 거의 발생하지 않습니다.
		}

		return query;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

}