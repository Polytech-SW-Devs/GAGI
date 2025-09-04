package com.exam.gagi.service;

import java.util.List;

public interface BaseBoardService<T> {
	
	// 공통 리스트 조회(검색 + 페이징)
	List<T> getList(String search, int page, int size);	
	// 총 게시글 수
	int getCount(String search);	
	// 게시글 상세 조회
	T getPost(int id);

	void create(T post);

	void update(T post);

//	void delete(int id); 
}
