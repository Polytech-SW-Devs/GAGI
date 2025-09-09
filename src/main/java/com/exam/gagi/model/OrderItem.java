package com.exam.gagi.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class OrderItem {
    private Long id; // 주문 상세 번호
    private Long orderId; // 주문 ID (FK)
    private Long itemId; // 상품 ID (FK)
    private int quantity; // 수량
    private BigDecimal price; // 주문 당시 가격
    private Timestamp createdAt; // 생성일

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getItemId() {
        return itemId;
    }

    public void setItemId(Long itemId) {
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

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
