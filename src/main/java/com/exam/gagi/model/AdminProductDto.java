package com.exam.gagi.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

public class AdminProductDto {
	private int id; // 상품 ID

	private String filename; // 상품 썸네일
	private String title; // 상품명

	private int price; // 판매 가격
	private int amount; // 수량/재고

	private String nickname; // 판매자

	private LocalDateTime createdAt; // 등록일

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@JsonIgnore // LocalDateTime 필드는 JSON 직렬화에서 제외
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	// JSP용 getter이자 JSON 직렬화 시 사용될 필드
	@JsonProperty("createdAt") // JSON 필드 이름을 "createdAt"으로 지정
	public Date getCreatedAtDate() {
		return createdAt == null ? null : Date.from(createdAt.atZone(ZoneId.systemDefault()).toInstant());
	}

}
