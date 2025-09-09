package com.exam.gagi.model;

import java.sql.Timestamp;

public abstract class BaseEntity {
	private Timestamp createdAt; // 생성일
	private Timestamp updatedAt; // 수정일

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}

}
