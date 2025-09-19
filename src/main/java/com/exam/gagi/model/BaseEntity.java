package com.exam.gagi.model;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

public abstract class BaseEntity {

	private LocalDateTime createdAt; // 생성일

	private LocalDateTime updatedAt; // 수정일

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

	// JSP용 getter
	public Date getCreatedAtDate() {
		return createdAt == null ? null : Date.from(createdAt.atZone(ZoneId.systemDefault()).toInstant());
	}

}
