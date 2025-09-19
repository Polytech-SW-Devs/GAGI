package com.exam.gagi.model;

import java.util.List;

public class MyImpormationDto {
	// 회원 ID (pk)
	private int memberId;
	// 닉네임
	private String nickname;
	// 비밀번호 (소셜 로그인 시 NULL 가능)
	private String password;
	// 아이디 = 이메일 (로그인용)
	private String email;
	// 전화번호
	private String phone;
	
	private List<Address> addresses;

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public List<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}
	
	

}
