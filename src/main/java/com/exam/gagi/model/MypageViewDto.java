package com.exam.gagi.model;

import java.util.List;

public class MypageViewDto {
	// 회원 기본정보
	private String username;
	private String email;
	private String phone;
	private String nickname;

	// 집계 값
	private int totalPurchase; // 총 구매 금액
	private int totalSales; // 총 판매 금액

	// 최근 구매내역 3건
	private List<RecentOrderDto> recentOrders;

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getTotalPurchase() {
		return totalPurchase;
	}

	public void setTotalPurchase(int totalPurchase) {
		this.totalPurchase = totalPurchase;
	}

	public int getTotalSales() {
		return totalSales;
	}

	public void setTotalSales(int totalSales) {
		this.totalSales = totalSales;
	}

	public List<RecentOrderDto> getRecentOrders() {
		return recentOrders;
	}

	public void setRecentOrders(List<RecentOrderDto> recentOrders) {
		this.recentOrders = recentOrders;
	}

}
