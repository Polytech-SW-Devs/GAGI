package com.exam.gagi.pager;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class AdminOrderPager extends PagerV2 {
	private int id;
	private String nickname;
	private String title;
	private String orderStatus;

	private String startDate;
	private String endDate;

	@Override
	public String getQuery() {
		String query = super.getQuery();

		if (id > 0) {
			query += "&id=" + id;
		}
		if (nickname != null && !nickname.isBlank()) {
			query += String.format("&nickname=%s", URLEncoder.encode(nickname, StandardCharsets.UTF_8));
		}
		if (title != null && !title.isBlank()) {
			query += String.format("&title=%s", URLEncoder.encode(title, StandardCharsets.UTF_8));
		}
		if (orderStatus != null && !orderStatus.isBlank()) {
			query += String.format("&orderStatus=%s", URLEncoder.encode(orderStatus, StandardCharsets.UTF_8));
		}

		if (startDate != null && !startDate.isBlank()) {
			query += String.format("&startDate=%s", URLEncoder.encode(startDate, StandardCharsets.UTF_8));
		}
		if (endDate != null && !endDate.isBlank()) {
			query += String.format("&endDate=%s", URLEncoder.encode(endDate, StandardCharsets.UTF_8));
		}

		return query;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
}