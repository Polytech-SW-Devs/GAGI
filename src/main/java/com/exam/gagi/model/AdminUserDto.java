package com.exam.gagi.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

public class AdminUserDto {
    private int id; // 회원 ID
    private String username; // 사용자명
    private String nickname; // 닉네임
    private String email; // 이메일
    private String phone; // 전화번호
    private LocalDateTime createdAt; // 가입일

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @JsonProperty("username")
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

    @JsonIgnore // LocalDateTime 필드는 JSON 직렬화에서 제외
    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    // JSON 직렬화 시 사용될 필드 (java.util.Date 타입)
    @JsonProperty("createdAt") // JSON 필드 이름을 "createdAt"으로 지정
    public Date getCreatedAtDate() {
        return createdAt == null ? null : Date.from(createdAt.atZone(ZoneId.systemDefault()).toInstant());
    }
}