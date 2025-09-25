package com.exam.gagi.model;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

public class OrderSaleViewDto {
	// 주문PK(Orders)
	private int id;
	// 주문일자(Orders)
	private LocalDateTime createdAt;
	// 상품명(Items)
	private String title;
	// 수량(Orders)
	private Integer amount;
	// 총 금액(Orders)
	private Integer totalPrice;
	// 주문처리 상태(Orders)
	private String orderStatus;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
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

	// JSP용 getter
	public Date getCreatedAtDate() {
		return createdAt == null ? null : Date.from(createdAt.atZone(ZoneId.systemDefault()).toInstant());
	}
}
