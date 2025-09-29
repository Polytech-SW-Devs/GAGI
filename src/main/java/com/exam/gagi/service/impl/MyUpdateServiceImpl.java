package com.exam.gagi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.MyUpdateDao;
import com.exam.gagi.model.Member;
import com.exam.gagi.service.MyUpdateService;

@Service
public class MyUpdateServiceImpl implements MyUpdateService {

	@Autowired
	MyUpdateDao dao;
	
	@Override
	public Member myUpdate(int id) {
		return dao.selectMyUpdate(id);
	}

	@Override
	public void myFetch(Member member) {
		
		dao.MyUpdate(member);
	}

}
