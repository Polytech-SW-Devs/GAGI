package com.exam.gagi.dto;

import com.exam.gagi.pager.Pager;

public class SaleSearchDto {
    private int sellerId;
    private Pager pager;

    public SaleSearchDto() {
    }

    public SaleSearchDto(int sellerId, Pager pager) {
        this.sellerId = sellerId;
        this.pager = pager;
    }

    public int getSellerId() {
        return sellerId;
    }

    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }

    public Pager getPager() {
        return pager;
    }

    public void setPager(Pager pager) {
        this.pager = pager;
    }
}