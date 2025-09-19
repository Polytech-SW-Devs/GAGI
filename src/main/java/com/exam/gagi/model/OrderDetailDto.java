package com.exam.gagi.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class OrderDetailDto {
	
    private int orderId; // 주문 구분을 위한 ID
    private Timestamp orderDate;
    private String shippingStatus;
    private List<OrderItemDto> orderItems;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

	public LocalDateTime getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDateTime orderDate) {
		this.orderDate = orderDate;
	}

	public String getShippingStatus() {
		return shippingStatus;
	}

	public void setShippingStatus(String shippingStatus) {
		this.shippingStatus = shippingStatus;
	}

	public List<OrderItemDto> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<OrderItemDto> orderItems) {
		this.orderItems = orderItems;
	}

	// --- JSP에서 바로 출력할 수 있는 변환 Getter ---
	public String getOrderDateStr() {
		if (orderDate == null)
			return "";
		return orderDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	}
}