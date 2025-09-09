package com.exam.gagi.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.MemberDao;
import com.exam.gagi.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	private final SqlSession sqlSession;
	
	public MemberDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	@Override
	public Member findByEmail(String email) {
		return sqlSession.selectOne("member.findByEmail", email);
	}
	
	@Override
	public void insertMember(Member member) {
		sqlSession.insert("member.insertMember", member);
	}
	
	@Override
	public int checkId(String userid) {
		return sqlSession.selectOne("member.checkId", userid);
	}

	@Override
	public int checkNm(String nickname) {
		return sqlSession.selectOne("member.checkNm", nickname);
	}


}
