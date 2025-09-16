package com.exam.gagi.model;

import java.math.BigDecimal;
import java.time.format.DateTimeFormatter;
import java.util.List;

//판매자 내역 페이지 Entity
public class Orders extends BaseEntity {
	// 주문 번호
	private int id;
	// 주문자 ID
	private int userId;
	// 거래 유형
	private String transactionType;
	// 총 주문 금액
	private BigDecimal totalPrice;
	// 결제 수단
	private String paymentMethod;
	// 수령인 이름
	private String recipientName;
	// 수령인 연락처
	private String recipientPhone;
	// 배종지 우편번호
	private String deliveryZipcode;
	// 배송지 주소(기본)
	private String deliveryAddressMain;
	// 배송지 주소(상세)
	private String deliveryAddressDetail;
	// 배송 요청사항
	private String deliveryMemo;
	private List<OrderItem> orderItems;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
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

	public List<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	public String getCreatedAtFormatted() {
		if (getCreatedAt() == null) {
			return "";
		}
		return getCreatedAt().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}

}
