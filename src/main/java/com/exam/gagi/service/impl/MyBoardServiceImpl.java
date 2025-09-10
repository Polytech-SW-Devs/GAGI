package com.exam.gagi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.MyBoardDao;
import com.exam.gagi.model.Category;
import com.exam.gagi.model.MyBoard;
import com.exam.gagi.service.MyBoardService;

@Service
public class MyBoardServiceImpl implements MyBoardService {

	@Autowired
	MyBoardDao dao;
	
	@Override
	public List<MyBoard> list() {
		return dao.list();
	}

	@Override
	public void add(MyBoard myboard) {
		
		dao.add(myboard);
	}

	@Override
	public List<Category> categoryList() {
		return dao.categories();
	}


}
