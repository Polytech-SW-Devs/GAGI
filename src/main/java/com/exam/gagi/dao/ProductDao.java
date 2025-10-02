package com.exam.gagi.dao;

import java.util.List;

import com.exam.gagi.model.Items;
import com.exam.gagi.pager.MyPagePager;

public interface ProductDao {

	void add(Items item);

	List<Items> list(MyPagePager pager);

	void delete(int id);

	void update(Items item);

	Items item(int id);

	List<Items> totalList(MyPagePager pager);

}
