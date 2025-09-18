package com.exam.gagi.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

public class Item extends BaseEntity {
	private int id; // 상품 번호
	private int userId; // 등록한 회원 번호 (FK)
	private int categoryId; // 카테고리 번호 (FK)
	private String title; // 상품 제목
	private String description; // 상품 설명
	private String delivery; // 거래 지역/주소
	private String isDirectDeal; // 직거래 가능 여부 (Y/N)
	private BigDecimal price; // 판매 가격
	private int amount; // 수량
	private String bankAccountNumber; // 판매자 계좌번호
	private String salesStatus; // 판매 상태
	private int views; // 조회수
	private Timestamp deletedAt; // 삭제일 (soft delete)
	private Timestamp createdAt; //생성일

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

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getIsDirectDeal() {
		return isDirectDeal;
	}

	public void setIsDirectDeal(String isDirectDeal) {
		this.isDirectDeal = isDirectDeal;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getBankAccountNumber() {
		return bankAccountNumber;
	}

	public void setBankAccountNumber(String bankAccountNumber) {
		this.bankAccountNumber = bankAccountNumber;
	}

	public String getSalesStatus() {
		return salesStatus;
	}

	public void setSalesStatus(String salesStatus) {
		this.salesStatus = salesStatus;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public Timestamp getDeletedAt() {
		return deletedAt;
	}

	public void setDeletedAt(Timestamp deletedAt) {
		this.deletedAt = deletedAt;
	}

	public Timestamp getCreateAt() {
		return createdAt;
	}

	public void setCreateAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	
}
