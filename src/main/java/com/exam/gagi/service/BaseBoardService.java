package com.exam.gagi.service;

import java.util.List;

public abstract class BaseBoardService<T> {
	
	// 공통 리스트 조회(페이징 + 검색)
	public abstract List<T> getList(String search, int page, int size);
	
	// 공통 게시글 상세 조회
	public abstract T getPost(int id);
	
	// 공통 글 개수 조회(페이징 계산용)
	public abstract int getCount(String search);

}
