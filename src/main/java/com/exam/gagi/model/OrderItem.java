package com.exam.gagi.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class OrderItem {
	private int id; // 주문 상세 번호
	private int orderId; // 주문 ID (FK)
	private int itemId; // 상품 ID (FK)
	private Integer quantity; // 수량
	private BigDecimal price; // 주문 당시 가격
	private String orderStatus; // 주문 상품 상태
	private LocalDateTime createdAt; // 생성일

	private Items item; // ITEM_ID FK 참조

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public Items getItem() {
		return item;
	}

	public void setItem(Items item) {
		this.item = item;
	}

	// 편의 메서드
	public BigDecimal getTotalPrice() {
		if (price != null && quantity != null) {
			return price.multiply(BigDecimal.valueOf(quantity));
		}
		return BigDecimal.ZERO;
	}
}
