package com.exam.gagi.model;

import java.util.List;

public class ItemImage extends BaseEntity {

	private int id; // 이미지 ID
	private int itemId; // 상품 ID (FK)
	private String imageUrl; // 이미지 경로
	private int sortOrder; // 정렬 순서
	// 원본 파일명
	private String filename;
	// 서버 저장용 추가 파일명
	private String uuid;

	// 썸네일 리스트 (1:N)
	private List<ItemThumbnails> thumbnails;

	// getter / setter
	public List<ItemThumbnails> getThumbnails() {
		return thumbnails;
	}

	public void setThumbnails(List<ItemThumbnails> thumbnails) {
		this.thumbnails = thumbnails;
	}

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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

}
