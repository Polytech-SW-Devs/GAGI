package com.exam.gagi.service;

import com.exam.gagi.model.Member;

public interface MemberService {

	// 회원가입
	void insertMember(Member member);
	// 로그인
	Member findByEmail(String email);
	// 로그인
	Member login(String email, String password);
	// 중복 아이디 체크
	boolean checkId(String userid);
	// 중복 닉네임 체크
	boolean checkNm(String nickname);

	String findId(String username, String phone); // 유저아이디 찾기


	String findPassword(String email, String phone); // 비밀번호 찾기

	void passwordUpdate(String email, String newPassword); // 비밀번호 업데이트

	//userId로 조회
	Member findById(int id);

}

