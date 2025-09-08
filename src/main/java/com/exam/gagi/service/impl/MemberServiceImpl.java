package com.exam.gagi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.MemberDao;
import com.exam.gagi.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	private final MemberDao memberDao;
	
	@Autowired
	public MemberServiceImpl(MemberDao memberDao){
		this.memberDao = memberDao;
	}
	
	@Override
	public boolean checkId(String userid) {	
		return memberDao.checkId(userid) == 0; // 0�̸� ��� ����
	}

	@Override
	public boolean checkNm(String nickname) {
		return memberDao.checkNm(nickname) == 0; // 0�̸� ��� ����
	}

}
