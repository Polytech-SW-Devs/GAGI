package com.exam.gagi.model;

public class ItemImage extends BaseEntity {
    private Long id; // 이미지 ID
    private Long itemId; // 상품 ID (FK)
    private String imageUrl; // 이미지 경로
    private int sortOrder; // 정렬 순서

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getItemId() {
        return itemId;
    }

    public void setItemId(Long itemId) {
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
