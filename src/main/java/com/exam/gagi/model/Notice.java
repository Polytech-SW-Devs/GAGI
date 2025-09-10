package com.exam.gagi.model;

import java.time.LocalDateTime;

public class Notice {
	private int id;
	private String title;
	private String content;
	private String visible;
	private LocalDateTime posted_at;
	private LocalDateTime expires_at;
	private int admin_id;
	private LocalDateTime created_at;
	private LocalDateTime updated_at;
	
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getVisible() {
		return visible;
	}
	public void setVisible(String visible) {
		this.visible = visible;
	}
	public LocalDateTime getPosted_at() {
		return posted_at;
	}
	public void setPosted_at(LocalDateTime posted_at) {
		this.posted_at = posted_at;
	}
	public LocalDateTime getExpires_at() {
		return expires_at;
	}
	public void setExpires_at(LocalDateTime expires_at) {
		this.expires_at = expires_at;
	}
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
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
