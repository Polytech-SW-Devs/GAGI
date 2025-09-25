package com.exam.gagi.dao;

import com.exam.gagi.model.Notice;

public interface NoticeDao extends BaseBoardDao<Notice> {

	void incrementViewCount(int id);

	Notice selectNotice(int id);

}
