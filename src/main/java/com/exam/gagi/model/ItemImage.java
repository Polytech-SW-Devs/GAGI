package com.exam.gagi.model;

public class ItemImage extends BaseEntity {

	private int id; // 이미지 ID
	private int itemId; // 상품 ID (FK)
	private String imageUrl; // 이미지 경로
	private int sortOrder; // 정렬 순서

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
    
    public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public int getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}

}
