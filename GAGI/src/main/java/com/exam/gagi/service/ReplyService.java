package com.exam.gagi.service;

import java.util.List;

import com.exam.gagi.model.Reply;

public interface ReplyService {

	void addReply(Reply reply);

	List<Reply> getRepliesByPost(int postId, String boardType);

	void deleteReply(int id, int userId);

}
