package com.exam.gagi.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.exam.gagi.dao.BaseBoardDao;

public abstract class BaseBoardDaoImpl<T> implements BaseBoardDao<T> {
	protected final SqlSession sqlSession;
    protected final String namespace; // Mapper namespace
    
    protected BaseBoardDaoImpl(SqlSession sqlSession, String namespace) {
		this.sqlSession = sqlSession;
		this.namespace = namespace;
	}
    
    @Override
    public List<T> selectList(String search, int offset, int size) {
    	Map<String, Object> param = new HashMap<>();
        param.put("search", search);
        param.put("offset", offset);
        param.put("size", size);
        return sqlSession.selectList(namespace + ".selectList", param);
    }
    
    @Override
    public int selectCount(String search) {
    	return sqlSession.selectOne(namespace + ".selectCount", search);
    }
    
    @Override
    public T selectPost(int id) {
    	return sqlSession.selectOne(namespace + ".selectPost", id);
    }
}
