package com.exam.gagi.dao.impl;

import java.util.HashMap;
import java.util.Map;

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
	public void insertMember(Member member) {
		sqlSession.insert("member.insertMember", member);
	}
	
	@Override
	public Member findByEmail(String email) {
		return sqlSession.selectOne("member.findByEmail", email);
	}
	
	@Override
	public int checkId(String userid) {
		return sqlSession.selectOne("member.checkId", userid);
	}

	@Override
	public int checkNm(String nickname) {
		return sqlSession.selectOne("member.checkNm", nickname);
	}



	@Override
    public String findId(String username, String phone) {
        Map<String, String> params = new HashMap<>();
        params.put("username", username);
        params.put("phone", phone);
        return sqlSession.selectOne("member.findId", params);
    }

	@Override
	public String findPassword(String email, String phone) {
		java.util.Map<String, Object> param = new java.util.HashMap<>();
	    param.put("email", email);
	    param.put("phone", phone);
	    return sqlSession.selectOne("member.findPassword", param);
	}

	@Override
	public void updatePassword(String email, String newPassword) {
		 Map<String, Object> params = new HashMap<>();
		 params.put("email", email);
		 params.put("newPassword", newPassword);
		 System.out.println("DEBUG >>> email=" + email + ", newPassword=" + newPassword);
		 sqlSession.update("member.updatePassword", params);
	
	}

}

