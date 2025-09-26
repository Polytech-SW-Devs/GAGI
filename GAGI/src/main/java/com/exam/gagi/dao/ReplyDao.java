package com.exam.gagi.dao;

import java.util.List;

import com.exam.gagi.model.Reply;

public interface ReplyDao {

	void insertReply(Reply reply);

	List<Reply> selectRepliesByPost(int postId, String boardType);

	void deleteReply(int id, int userId);

}
