package com.exam.gagi.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.ReplyDao;
import com.exam.gagi.model.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	private final SqlSession sqlSession;
	
	@Autowired
	public ReplyDaoImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertReply(Reply reply) {
		sqlSession.insert("reply.insertReply", reply);
	}

	@Override
    public List<Reply> selectRepliesByPost(int postId, String boardType) {
        return sqlSession.selectList("reply.selectRepliesByPost",
                                     new java.util.HashMap<String, Object>() {{
                                         put("postId", postId);
                                         put("boardType", boardType);
                                     }});
	}

	@Override
	public void deleteReply(int id, int userId) {
		java.util.Map<String, Object> param = new java.util.HashMap<>();
		param.put("id", id);
		param.put("userId", userId);
		sqlSession.delete("reply.deleteReply", param);
	}
	
}
