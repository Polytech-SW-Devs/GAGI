package com.exam.gagi.model;

public class Orders extends BaseEntity {
<<<<<<< HEAD
	// 주문PK
	private int id;
	// 주문자 (FK)
	private int userId;
	// 상품 ID (FK)
	private Integer itemId;
	// 상품 단가
	private Integer price;
	// 주문 수량
	private Integer amount;
=======
	// 주문 번호
	private int id;
	// 주문자 ID
	private int userId;
	// 거래 유형
	private String transactionType;
>>>>>>> main
	// 총 주문 금액
	private Integer totalPrice;
	// 거래유형 (배송/직거래)
	private String transactionType;
	// 결제 수단
	private String paymentMethod;
	// 수령인 이름
	private String recipientName;
	// 수령인 연락처
	private String recipientPhone;
	// 배송지 우편번호
	private String deliveryZipcode;
	// 배송지 주소(기본)
	private String deliveryAddressMain;
	// 배송지 주소(상세)
	private String deliveryAddressDetail;
	// 배송 요청사항
	private String deliveryMemo;
	// 주문 상태
	private String orderStatus;


	// JOIN으로 가져올 추가 필드들
	private String title; // 상품명
	private String imageUrl; // 상품 썸네일

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

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
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

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

}