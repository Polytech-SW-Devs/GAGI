package com.exam.gagi.dao;

import org.apache.ibatis.annotations.Param;

public interface MemberDao {

	int checkId(String userid);

	int checkNm(String nickname);
	
	
	// 비밀번호 찾기
	String findPassword(@Param("email") String email,
            @Param("phone") String phone);

	String findIdByUsernameAndPhone(@Param("username") String username,
            @Param("phone") String phone);

	void updatePassword(@Param("email") String email, @Param("newPassword") String newPassword);
}
