package com.exam.gagi.service;

import java.util.List;

import com.exam.gagi.model.Category;
import com.exam.gagi.model.MyBoard;

public interface MyBoardService {

	List<MyBoard> list();

	void add(MyBoard myboard);

	List<Category> categoryList();


}
