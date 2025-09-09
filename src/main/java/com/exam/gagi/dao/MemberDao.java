package com.exam.gagi.dao;

import com.exam.gagi.model.Member;

public interface MemberDao {

	Member findByEmail(String email);
	
	void insertMember(Member member);
	
	int checkId(String userid);

	int checkNm(String nickname);


}
