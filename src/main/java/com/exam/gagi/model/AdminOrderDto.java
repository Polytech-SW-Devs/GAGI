package com.exam.gagi.model;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

public class AdminOrderDto {
	private int id; // 주문 ID

	private String nickname; // 판매자

	private String title; // 상품명

	private Integer amount; // 수량
	private Integer totalPrice; // 총 주문 금액
	private LocalDateTime createdAt; // 주문일
	private String orderStatus; // 주문 상태

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

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	@JsonIgnore // LocalDateTime 필드는 JSON 직렬화에서 제외
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	// JSP용 getter이자 JSON 직렬화 시 사용될 필드
	@JsonProperty("createdAt") // JSON 필드 이름을 "createdAt"으로 지정
	public Date getCreatedAtDate() {
		return createdAt == null ? null : Date.from(createdAt.atZone(ZoneId.systemDefault()).toInstant());
	}
}
