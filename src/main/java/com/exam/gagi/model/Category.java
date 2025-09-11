package com.exam.gagi.model;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class Category {
	private int categoryId;
	private String name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate createDt;
	private LocalDate updateDt;
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public LocalDate getCreateDt() {
		return createDt;
	}
	public void setCreateDt(LocalDate createDt) {
		this.createDt = createDt;
	}
	public LocalDate getUpdateDt() {
		return updateDt;
	}
	public void setUpdateDt(LocalDate updateDt) {
		this.updateDt = updateDt;
	}
	
	
}
