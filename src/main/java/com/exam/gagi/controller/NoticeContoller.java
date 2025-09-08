package com.exam.gagi.controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.gagi.model.Notice;
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
	
	// 공지사항 상세 보기 + 조회수 증가 + 유효기간 체크
	@GetMapping("/view/{id}")
	@ResponseBody
	public Notice viewNotice(@PathVariable int id) {
		noticeService.incrementViewCount(id);  // 조회수 증가
		Notice notice = noticeService.getById(id);
		
		// 유효기간 확인(만료 여부)
		boolean active = (notice.getExpires_at() == null || notice.getExpires_at().isAfter(LocalDateTime.now()));
		notice.setActive(active);
		return notice;
	}

}
