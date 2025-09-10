package com.exam.gagi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.exam.gagi.dao.BaseBoardDao;
import com.exam.gagi.service.BaseBoardService;

public class BaseBoardServiceImpl<T> implements BaseBoardService<T> {
	protected final BaseBoardDao<T> dao;
    
    public BaseBoardServiceImpl(BaseBoardDao<T> dao) {
		this.dao = dao;
	}

	// 공통 리스트 조회(검색 + 페이징)
    @Override
    public List<T> getList(String search, int page, int size) {
    	Map<String, Object> params = new HashMap<>();
    	params.put("search", search);
        params.put("offset", (page - 1) * size);
        params.put("size", size);
        return dao.selectList(params);
    }
    
    // 총 게시글 수
    @Override
    public int getCount(String search) {
    	return dao.selectCount(search);
    }
	
    // 게시글 상세 조회
    @Override
    public T getPost(int id) {
    	return dao.selectPost(id);
    }
    
    @Override
    public void create(T post) {
        dao.insert(post); // 실제 DB 처리
    }

    @Override
    public void update(T post) {
        dao.update(post);
    }
    /*
    @Override
    public void delete(int id) {
        dao.delete(id);
    }
    */
}
