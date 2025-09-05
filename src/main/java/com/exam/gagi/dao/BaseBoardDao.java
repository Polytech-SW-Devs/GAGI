package com.exam.gagi.dao;

import java.util.List;
import java.util.Map;

public interface BaseBoardDao<T> {
	// 공통 리스트 조회(검색 + 페이징)
	List<T> selectList(Map<String, Object> params);

	// 총 게시글 수 조회(페이징용)
	int selectCount(String search);

	// 게시글 상세 조회
	T selectPost(int id);

	// 공통 crud
	void insert(T post);
	void update(T post);
//	void delete(int id);

}
