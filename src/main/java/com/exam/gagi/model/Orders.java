package com.exam.gagi.model;

import java.sql.Timestamp;

//판매자 내역 페이지 Entity
public class Orders extends BaseEntity {
	// 주문 번호
	private Long id;
	// 주문자 ID
	private Long userId;
	// 거래 유형
	private String transactionType;
	// 주문 상태
	private String orderStatus;
	// 총 주문 금액
	private double totalPrice;
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
	// 직거래 장소
	private String meetingLocation;
	// 직거래 일시
	private Timestamp meetingDateTime;
	// 거래 연락처
	private String contactInfo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
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

	public String getMeetingLocation() {
		return meetingLocation;
	}

	public void setMeetingLocation(String meetingLocation) {
		this.meetingLocation = meetingLocation;
	}

	public Timestamp getMeetingDateTime() {
		return meetingDateTime;
	}

	public void setMeetingDateTime(Timestamp meetingDateTime) {
		this.meetingDateTime = meetingDateTime;
	}

	public String getContactInfo() {
		return contactInfo;
	}

	public void setContactInfo(String contactInfo) {
		this.contactInfo = contactInfo;
	}

}
