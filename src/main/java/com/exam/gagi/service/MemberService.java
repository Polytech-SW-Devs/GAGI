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


}
