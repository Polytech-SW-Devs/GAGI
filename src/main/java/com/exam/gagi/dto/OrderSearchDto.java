package com.exam.gagi.dto;

import com.exam.gagi.pager.Pager;

public class OrderSearchDto {
    private String userId;
    private Pager pager;

    public OrderSearchDto() {
    }
    
    public OrderSearchDto(String userId, Pager pager) {
        this.userId = userId;
        this.pager = pager;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Pager getPager() {
        return pager;
    }

    public void setPager(Pager pager) {
        this.pager = pager;
    }
}