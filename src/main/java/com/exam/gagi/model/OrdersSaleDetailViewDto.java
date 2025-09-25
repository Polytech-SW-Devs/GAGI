package com.exam.gagi.model;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

public class OrdersSaleDetailViewDto {
	// 주문번호(Orders)
	private int id;
	// 주문일자(Orders)
	private LocalDateTime createdAt;
	// 거래유형 (Orders)
	private String transactionType;
	// 결제 수단(Orders)
	private String paymentMethod;

	// 주문자 이름(Users)
	private String username;
	// 주문자 연락처(Users)
	private String phone;
	// 주문자 이메일(Users)
	private String email;

	// 수령인(Orders)
	private String recipientName;
	// 수령인 연락처(Orders)
	private String recipientPhone;
	// 배송지 우편번호(Orders)
	private String deliveryZipcode;
	// 배송지 기본(Orders)
	private String deliveryAddressMain;
	// 배송지 상세(Orders)
	private String deliveryAddressDetail;
	// 배송지 메모(Orders)
	private String deliveryMemo;
	// 총 가격(Orders)
	private int totalPrice;

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

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getRecipientPhone() {
		return recipientPhone;
	}

	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}

	public String getDeliveryZipcode() {
		return deliveryZipcode;
	}

	public void setDeliveryZipcode(String deliveryZipcode) {
		this.deliveryZipcode = deliveryZipcode;
	}

	public String getDeliveryAddressMain() {
		return deliveryAddressMain;
	}

	public void setDeliveryAddressMain(String deliveryAddressMain) {
		this.deliveryAddressMain = deliveryAddressMain;
	}

	public String getDeliveryAddressDetail() {
		return deliveryAddressDetail;
	}

	public void setDeliveryAddressDetail(String deliveryAddressDetail) {
		this.deliveryAddressDetail = deliveryAddressDetail;
	}

	public String getDeliveryMemo() {
		return deliveryMemo;
	}

	public void setDeliveryMemo(String deliveryMemo) {
		this.deliveryMemo = deliveryMemo;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	// JSP용 getter
	public Date getCreatedAtDate() {
		return createdAt == null ? null : Date.from(createdAt.atZone(ZoneId.systemDefault()).toInstant());
	}
}
