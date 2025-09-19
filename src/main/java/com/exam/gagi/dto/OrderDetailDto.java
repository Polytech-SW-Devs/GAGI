package com.exam.gagi.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class OrderDetailDto {
    private int id; // 주문 ID
    private LocalDateTime createdAt; // 주문일

    private Integer itemId; // 상품 ID
    private String thumbnailUrl; // 상품 썸네일
    private String itemName; // 상품명
    private Integer amount; // 수량
    private BigDecimal price; // 단가
    private BigDecimal totalPrice; // 총 가격
    private String orderStatus; // 주문 상태

    // Orders 정보 추가
    private String transactionType;
    private String paymentMethod;
    private String recipientName;
    private String recipientPhone;
    private String deliveryZipcode;
    private String deliveryAddressMain;
    private String deliveryAddressDetail;
    private String deliveryMemo;

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

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public String getThumbnailUrl() {
        return thumbnailUrl;
    }

    public void setThumbnailUrl(String thumbnailUrl) {
        this.thumbnailUrl = thumbnailUrl;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
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

    public String getCreatedAtStr() {
        if (createdAt == null)
            return "";
        return createdAt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
    }
}
