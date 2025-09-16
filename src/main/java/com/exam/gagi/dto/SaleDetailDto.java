package com.exam.gagi.dto;

import java.math.BigDecimal;
import java.util.List;

import com.exam.gagi.model.OrderItem;

public class SaleDetailDto {

    // 주문 정보
    private Long orderId;
    private String createdAtFormatted;
    private String transactionType;
    private String paymentMethod;

    // 구매자 정보
    private String buyerName;
    private String buyerPhone;
    private String buyerEmail;

    // 배송지 정보
    private String recipientName;
    private String recipientPhone;
    private String deliveryZipcode;
    private String deliveryAddressMain;
    private String deliveryAddressDetail;
    private String deliveryMemo;

    // 상품 및 가격 정보
    private List<OrderItem> orderItems;
    private BigDecimal saleSubTotal;

    // Getters and Setters
    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getCreatedAtFormatted() {
        return createdAtFormatted;
    }

    public void setCreatedAtFormatted(String createdAtFormatted) {
        this.createdAtFormatted = createdAtFormatted;
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

    public String getBuyerName() {
        return buyerName;
    }

    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName;
    }

    public String getBuyerPhone() {
        return buyerPhone;
    }

    public void setBuyerPhone(String buyerPhone) {
        this.buyerPhone = buyerPhone;
    }

    public String getBuyerEmail() {
        return buyerEmail;
    }

    public void setBuyerEmail(String buyerEmail) {
        this.buyerEmail = buyerEmail;
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

    public BigDecimal getSaleSubTotal() {
        return saleSubTotal;
    }

    public void setSaleSubTotal(BigDecimal saleSubTotal) {
        this.saleSubTotal = saleSubTotal;
    }
}