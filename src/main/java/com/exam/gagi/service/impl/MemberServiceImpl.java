package com.exam.gagi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.AddressDao;
import com.exam.gagi.dao.MemberDao;
import com.exam.gagi.model.Address;
import com.exam.gagi.model.Member;
import com.exam.gagi.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private AddressDao addressDao;
	
	@Override
	public Member login(String email, String password) {
		Member member = memberDao.findByEmail(email);
//		if(member != null && BCrypt.checkpw(password, member.getPassword())) {
			return member;			
//		}
//		return null;
	}
	
	@Override
	public void signup(Member member, Address address) {
//		String hashedPassword = BCrypt.hashpw(member.getPassword(), BCrypt.gensalt());
//		member.setPassword(hashedPassword);
		// 1. 회원 저장
		memberDao.insertMember(member);
		// 2. 기본 배송지 저장
		address.setUserId(member.getId());
		address.setIsDefault("Y");
		addressDao.insertAddress(address);
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
