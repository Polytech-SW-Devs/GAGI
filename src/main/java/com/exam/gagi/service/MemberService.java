package com.exam.gagi.service;

public interface MemberService {

	boolean checkId(String userid);

	boolean checkNm(String nickname);

	String findId(String username, String phone); // 유저아이디 찾기

	String findPassword(String email, String phone); // 비밀번호 찾기

	void passwordUpdate(String email, String newPassword); // 비밀번호 업데이트



}