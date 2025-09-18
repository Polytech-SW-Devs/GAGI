package com.exam.gagi.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class OrderItem {
    private int id; // 주문 상세 번호
    private int orderId; // 주문 ID (FK)
    private int itemId; // 상품 ID (FK)
    private int quantity; // 수량
    private BigDecimal price; // 주문 당시 가격
    private String orderStatus; // 주문 상품 상태
    private Item item; // 상품 정보
    private Timestamp createdAt; // 생성일

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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
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

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
