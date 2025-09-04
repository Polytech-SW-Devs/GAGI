package com.exam.gagi.model;

import java.time.LocalDateTime;

public class Inquiry {
	private int id;
	private int user_id;
	private int reponder_id;
	private String category;
	private String subject;
	private String message;
	private String status;
	private LocalDateTime created_at;
	private LocalDateTime responded_at;
	private LocalDateTime updated_at;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getReponder_id() {
		return reponder_id;
	}
	public void setReponder_id(int reponder_id) {
		this.reponder_id = reponder_id;
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
	public LocalDateTime getCreated_at() {
		return created_at;
	}
	public void setCreated_at(LocalDateTime created_at) {
		this.created_at = created_at;
	}
	public LocalDateTime getResponded_at() {
		return responded_at;
	}
	public void setResponded_at(LocalDateTime responded_at) {
		this.responded_at = responded_at;
	}
	public LocalDateTime getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(LocalDateTime updated_at) {
		this.updated_at = updated_at;
	}
	
	
}
