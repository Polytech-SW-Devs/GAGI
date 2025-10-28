package com.exam.gagi.pager;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class AdminUserPager extends PagerV2 {
	private int id;
	private String username;
	private String nickname;
	private String email;
	private String phone;

	private String startDate;
	private String endDate;

	@Override
	public String getQuery() {
		String query = super.getQuery();

		if (id > 0) {
			query += "&id=" + id;
		}
		if (username != null && !username.isBlank()) {
			query += String.format("&username=%s", URLEncoder.encode(username, StandardCharsets.UTF_8));
		}
		if (nickname != null && !nickname.isBlank()) {
			query += String.format("&nickname=%s", URLEncoder.encode(nickname, StandardCharsets.UTF_8));
		}
		if (email != null && !email.isBlank()) {
			query += String.format("&email=%s", URLEncoder.encode(email, StandardCharsets.UTF_8));
		}
		if (phone != null && !phone.isBlank()) {
			query += String.format("&phone=%s", URLEncoder.encode(phone, StandardCharsets.UTF_8));
		}

		if (startDate != null && !startDate.isBlank()) {
			query += String.format("&startDate=%s", URLEncoder.encode(startDate, StandardCharsets.UTF_8));
		}
		if (endDate != null && !endDate.isBlank()) {
			query += String.format("&endDate=%s", URLEncoder.encode(endDate, StandardCharsets.UTF_8));
		}

		return query;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
}