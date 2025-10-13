package com.exam.gagi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.NoticeDao;
import com.exam.gagi.model.Notice;
import com.exam.gagi.service.NoticeService;

@Service
public class NoticeServiceImpl extends BaseBoardServiceImpl<Notice> implements NoticeService {

	private final NoticeDao noticeDao;

	@Autowired
	public NoticeServiceImpl(NoticeDao noticeDao) {
		super(noticeDao);
		this.noticeDao = noticeDao;
	}

	@Override
	public void incrementViewCount(int id) {
		noticeDao.incrementViewCount(id);
	}

	@Override
	public Notice getById(int id) {
		return noticeDao.selectNotice(id);
	}
	
	
	
}
