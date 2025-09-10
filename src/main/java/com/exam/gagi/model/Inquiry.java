package com.exam.gagi.model;

import java.time.LocalDateTime;

public class Inquiry {
	// 문의 id
	private int id;
	// 문의자
	private int userId;
	// 응답자(관리자)
	private int reponderId;
	// 문의 카테고리
	private String category;
	// 제목
	private String subject;
	// 내용
	private String message;
	// 상태(open, closed)
	private String status;
	// 생성일
	private LocalDateTime createdAt;
	// 응답일
	private LocalDateTime respondedAt;
	// 수정일
	private LocalDateTime updatedAt;
	
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
	public int getReponderId() {
		return reponderId;
	}
	public void setReponderId(int reponderId) {
		this.reponderId = reponderId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	public LocalDateTime getRespondedAt() {
		return respondedAt;
	}
	public void setRespondedAt(LocalDateTime respondedAt) {
		this.respondedAt = respondedAt;
	}
	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
	
	
}
