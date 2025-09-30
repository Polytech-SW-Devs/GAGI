package com.exam.gagi.dao;

import java.util.List;

import com.exam.gagi.model.Items;
import com.exam.gagi.pager.Pager;

public interface ProductDao {

	void add(Items item);

	List<Items> list(int userId);

	void delete(int id);

	void update(Items item);

	Items item(int id);

	List<Items> totalList(Pager pager);

}
