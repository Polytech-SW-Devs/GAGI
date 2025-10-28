package com.exam.gagi.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.MyUpdateDao;
import com.exam.gagi.model.Member;

@Repository
public class MyUpdateDaoImpl implements MyUpdateDao {

	@Autowired
	SqlSession sql;

	private final String path = "myUpdate.";
	
	@Override
	public Member selectMyUpdate(int id) {
		return sql.selectOne(path + "mySelect", id);
	}

	@Override
	public void MyUpdate(Member member) {
		sql.update(path + "myUpdate", member);
	}

}
