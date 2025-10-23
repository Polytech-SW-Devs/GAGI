package com.exam.gagi.model;

import java.sql.Timestamp;
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
	// 주문자 (users)
	private int userId;
	// 이미지 (items)
	private String itmeImage;
	// 상품 단가 (items)
	private int price;
	// 상품 아이디 (items)
	private int itemId;
	
	
	
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
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getItmeImage() {
		return itmeImage;
	}

	public void setItmeImage(String itmeImage) {
		this.itmeImage = itmeImage;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	// JSP용 getter
	public Date getCreatedAtDate() {
		return createdAt == null ? null : Date.from(createdAt.atZone(ZoneId.systemDefault()).toInstant());
	}
}
