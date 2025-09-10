package com.exam.gagi.dao;

import java.util.List;

import com.exam.gagi.model.Category;
import com.exam.gagi.model.MyBoard;

public interface MyBoardDao {

	List<MyBoard> list();

	void add(MyBoard myboard);

	List<Category> categories();



}
