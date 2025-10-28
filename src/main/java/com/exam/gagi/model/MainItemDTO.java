package com.exam.gagi.model;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

public class MainItemDTO {
	private int id;
	private String title;
	private int price;
	private String filename;
	private int purchaseCount;
	private String sellerName;
	private LocalDateTime createdAt;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getPurchaseCount() {
		return purchaseCount;
	}

	public void setPurchaseCount(int purchaseCount) {
		this.purchaseCount = purchaseCount;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	// JSP용 getter
	public Date getCreatedAtDate() {
		return createdAt == null ? null : Date.from(createdAt.atZone(ZoneId.systemDefault()).toInstant());
	}
}
