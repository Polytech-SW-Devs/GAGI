package com.exam.gagi.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.MyBoardDao;
import com.exam.gagi.model.Category;
import com.exam.gagi.model.MyBoard;

@Repository
public class MyBoardDaoImpl implements MyBoardDao {

	final private String path = "myboard.";
	
	@Autowired
	SqlSession sql;
	
	@Override
	public List<MyBoard> list() {
		return sql.selectList(path + "list");
	}

	@Override
	public void add(MyBoard myboard) {
		sql.insert(path + "add", myboard);
	}

	@Override
	public List<Category> categories() {
		return sql.selectList(path + "categoryList");
	}
	
}
