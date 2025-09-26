package com.exam.gagi.service;

import com.exam.gagi.model.Notice;

public interface NoticeService extends BaseBoardService<Notice> {

	// 조회수 증가
	void incrementViewCount(int id);

	// 단일 공지 조회
	Notice getById(int id);

}
