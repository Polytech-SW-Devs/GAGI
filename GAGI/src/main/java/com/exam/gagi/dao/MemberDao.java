package com.exam.gagi.dao;

import com.exam.gagi.model.Member;

public interface MemberDao {

	void insertMember(Member member);
	
	Member findByEmail(String email);
	
	int checkId(String userid);

	int checkNm(String nickname);


}
