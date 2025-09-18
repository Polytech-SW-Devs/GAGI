package com.exam.gagi.dao;

import java.util.List;

import com.exam.gagi.model.Category;
import com.exam.gagi.model.Item;

public interface ProductDao {

	void add(Item item);

	List<Item> list(int userId);

	void delete(int id);

	void update(Item item);

	Item item(int id);

	List<Item> totalList();

	
}
