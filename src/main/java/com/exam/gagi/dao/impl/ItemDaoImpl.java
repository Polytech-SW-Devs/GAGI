package com.exam.gagi.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.ItemDao;

@Repository
public class ItemDaoImpl implements ItemDao {
	
	@Autowired
    private SqlSession sqlSession;
	
	private static final String NAMESPACE = "item.";

	@Override
	public String selectTitleById(int productId) {
		return sqlSession.selectOne(NAMESPACE + "selectTitleById", productId);
	}

}
