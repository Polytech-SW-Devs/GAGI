package com.exam.gagi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.exam.gagi.service.BaseBoardService;

public abstract class BaseBoardServiceImpl<T> implements BaseBoardService<T> {
	protected final SqlSession sqlSession;
	// �� Mapper namespace ����
    protected final String namespace;
    
    protected BaseBoardServiceImpl(SqlSession sqlSession, String namespace) {
		this.sqlSession = sqlSession;
		this.namespace = namespace;
	}
    
    // ���� ����Ʈ ��ȸ(�˻� + ����¡)
    @Override
    public List<T> getList(String search, int page, int size) {
    	int offset = (page - 1) * size;
        Map<String, Object> param = new HashMap<>();
        param.put("search", search);
        param.put("offset", offset);
        param.put("size", size);
        return sqlSession.selectList(namespace + ".selectList", param);
    }
    
    // �� �Խñ� ��
    @Override
    public int getCount(String search) {
    	return sqlSession.selectOne(namespace + ".selectCount", search);
    }
	
    // �Խñ� �� ��ȸ
    @Override
    public T getPost(int id) {
    	return sqlSession.selectOne(namespace + ".selectPost", id);
    }
}
