package com.exam.gagi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.ReplyDao;
import com.exam.gagi.model.Reply;
import com.exam.gagi.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	private final ReplyDao replyDao;
	
	@Autowired
	public ReplyServiceImpl(ReplyDao replyDao) {
		this.replyDao = replyDao; 
	}

	@Override
	public void addReply(Reply reply) {
		replyDao.insertReply(reply);
	}

	@Override
	public List<Reply> getRepliesByPost(int postId, String boardType) {
		return replyDao.selectRepliesByPost(postId, boardType);
	}

	@Override
	public void deleteReply(int id, int userId) {
		replyDao.deleteReply(id, userId);
	}
	

}
