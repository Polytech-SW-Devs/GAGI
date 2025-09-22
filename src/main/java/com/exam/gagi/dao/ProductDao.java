package com.exam.gagi.dao;

import java.util.List;

import com.exam.gagi.model.Items;

public interface ProductDao {

	void add(Items item);

	List<Items> list(int userId);

	void delete(int id);

	void update(Items item);

	Items item(int id);

	List<Items> totalList();

}
