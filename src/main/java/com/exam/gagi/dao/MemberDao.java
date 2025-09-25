package com.exam.gagi.dao;

import org.apache.ibatis.annotations.Param;

import com.exam.gagi.model.Member;
import com.exam.gagi.model.MypageViewDto;

public interface MemberDao {

	void insertMember(Member member);

	Member findByEmail(String email);

	int checkId(String userid);

	int checkNm(String nickname);

	// 비밀번호 찾기
	String findPassword(@Param("email") String email, @Param("phone") String phone);

	String findId(@Param("username") String username, @Param("phone") String phone);

	void updatePassword(@Param("email") String email, @Param("newPassword") String newPassword);

	// userId로 조회
	Member findById(int id);

	// 마이페이지 신상+ 집계함수
	MypageViewDto myPageInfo(int id);

}
