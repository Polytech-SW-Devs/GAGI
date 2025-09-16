package com.exam.gagi.dto;

import com.exam.gagi.pager.Pager;

public class SaleSearchDto {
    private String sellerId;
    private Pager pager;

    public SaleSearchDto() {
    }

    public SaleSearchDto(String sellerId, Pager pager) {
        this.sellerId = sellerId;
        this.pager = pager;
    }

    public String getSellerId() {
        return sellerId;
    }

    public void setSellerId(String sellerId) {
        this.sellerId = sellerId;
    }

    public Pager getPager() {
        return pager;
    }

    public void setPager(Pager pager) {
        this.pager = pager;
    }
}
