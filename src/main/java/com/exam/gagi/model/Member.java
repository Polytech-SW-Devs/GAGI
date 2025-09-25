package com.exam.gagi.model;

import java.time.LocalDateTime;

public class Member {
	// 회원번호 (PK)
	private int id;
	// 이름
	private String username;
	// 아이디 = 이메일 (로그인용)
	private String email;
	// 비밀번호 (소셜 로그인 시 NULL 가능)
	private String password;
	// 전화번호
	private String phone;
	// 회원 유형 (구매자/판매자/관리자)
	private String userType;
	// 로그인 유형 (로컬/소셜)
	private String loginType;
	// 소셜 계정 고유 ID
	private String providerId;
	// 프로필 이미지 경로
	private String profileImage;
	// 계정 상태 (active, suspended 등)
	private String status;
	// 생성일
	private LocalDateTime createdAt;
	// 수정일
	private LocalDateTime updatedAt;
	// 닉네임
	private String nickname;

	// 비밀번호 확인용
	private String confirmPassword;

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	public String getProviderId() {
		return providerId;
	}

	public void setProviderId(String providerId) {
		this.providerId = providerId;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	// 비밀번호 확인용
	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

}
