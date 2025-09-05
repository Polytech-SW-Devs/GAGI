package com.exam.gagi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.exam.gagi.model.Notice;
import com.exam.gagi.model.Review;
import com.exam.gagi.service.BaseBoardService;
import com.exam.gagi.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeContoller extends BaseBoardController<Notice> {
	
	private final NoticeService noticeService;
	
	@Autowired
	public NoticeContoller(NoticeService noticeService) {
		super(noticeService, "notice");
		this.noticeService = noticeService;
	}
	
	@Override
	protected int getIdFromPost(Notice post) {
		return post.getId();
	}

}
