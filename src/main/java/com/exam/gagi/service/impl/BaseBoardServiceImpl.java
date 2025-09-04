package com.exam.gagi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.exam.gagi.service.BaseBoardService;

public abstract class BaseBoardServiceImpl<T> implements BaseBoardService<T> {
	protected final SqlSession sqlSession;
	// 각 Mapper namespace 지정
    protected final String namespace;
    
    protected BaseBoardServiceImpl(SqlSession sqlSession, String namespace) {
		this.sqlSession = sqlSession;
		this.namespace = namespace;
	}
    
    // 공통 리스트 조회(검색 + 페이징)
    @Override
    public List<T> getList(String search, int page, int size) {
    	int offset = (page - 1) * size;
        Map<String, Object> param = new HashMap<>();
        param.put("search", search);
        param.put("offset", offset);
        param.put("size", size);
        return sqlSession.selectList(namespace + ".selectList", param);
    }
    
    // 총 게시글 수
    @Override
    public int getCount(String search) {
    	return sqlSession.selectOne(namespace + ".selectCount", search);
    }
	
    // 게시글 상세 조회
    @Override
    public T getPost(int id) {
    	return sqlSession.selectOne(namespace + ".selectPost", id);
    }
}
