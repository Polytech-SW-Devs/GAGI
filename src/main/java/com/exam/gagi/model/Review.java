package com.exam.gagi.model;

import java.time.LocalDateTime;

public class Review {
	// 리뷰 id
	private int id;
	// 주문 상세 id
	private int orderItemId;
	// 작성자
	private int reviewerId;
	// 대상
	private int targetId;
	// 평점
	private int ratingNumber;
	// 리뷰 내용
	private String commentText;
	// 생성일
	private LocalDateTime createdAt;
	// 수정일
	private LocalDateTime updatedAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}
	public int getReviewerId() {
		return reviewerId;
	}
	public void setReviewerId(int reviewerId) {
		this.reviewerId = reviewerId;
	}
	public int getTargetId() {
		return targetId;
	}
	public void setTargetId(int targetId) {
		this.targetId = targetId;
	}
	public int getRatingNumber() {
		return ratingNumber;
	}
	public void setRatingNumber(int ratingNumber) {
		this.ratingNumber = ratingNumber;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
}
