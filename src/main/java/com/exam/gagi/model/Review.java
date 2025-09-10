package com.exam.gagi.model;

import java.time.LocalDateTime;

public class Review {
	private int id;
	private int order_item_id;
	private int reviewer_id;
	private int target_id;
	private int rating_number;
	private String comment_text;
	private LocalDateTime created_at;
	private LocalDateTime updated_at;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrder_item_id() {
		return order_item_id;
	}
	public void setOrder_item_id(int order_item_id) {
		this.order_item_id = order_item_id;
	}
	public int getReviewer_id() {
		return reviewer_id;
	}
	public void setReviewer_id(int reviewer_id) {
		this.reviewer_id = reviewer_id;
	}
	public int getTarget_id() {
		return target_id;
	}
	public void setTarget_id(int target_id) {
		this.target_id = target_id;
	}
	public int getRating_number() {
		return rating_number;
	}
	public void setRating_number(int rating_number) {
		this.rating_number = rating_number;
	}
	public String getComment_text() {
		return comment_text;
	}
	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}
	public LocalDateTime getCreated_at() {
		return created_at;
	}
	public void setCreated_at(LocalDateTime created_at) {
		this.created_at = created_at;
	}
	public LocalDateTime getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(LocalDateTime updated_at) {
		this.updated_at = updated_at;
	}
	
}
