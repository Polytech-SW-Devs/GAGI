package com.exam.gagi.dao;

import java.util.List;

import com.exam.gagi.model.Notice;

public interface NoticeDao extends BaseBoardDao<Notice> {

	void incrementViewCount(int id);

	Notice selectNotice(int id);

//	List<Notice> list();

}
