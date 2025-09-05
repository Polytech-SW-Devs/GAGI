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
    public List<T> selectList(Map<String, Object> params) {
        return sqlSession.selectList(namespace + ".selectList", params);
    }
    
    @Override
    public int selectCount(String search) {
    	return sqlSession.selectOne(namespace + ".selectCount", search);
    }
    
    @Override
    public T selectPost(int id) {
    	return sqlSession.selectOne(namespace + ".selectPost", id);
    }
    
    @Override
    public void insert(T post) {
        sqlSession.insert(namespace + ".insert", post);
    }

    @Override
    public void update(T post) {
        sqlSession.update(namespace + ".update", post);
    }
    /*
    @Override
    public void delete(int id) {
        sqlSession.delete(namespace + ".delete", id);
    }
    */
}
