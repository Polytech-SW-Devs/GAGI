package com.exam.gagi.service;

import java.util.List;

import com.exam.gagi.model.Category;
import com.exam.gagi.model.Item;

public interface ProductService {

	List<Item> list(int userId);//로그인한 유저가 등록한 상품만 조회
	
	void add(Item item);

	void delete(int id);

	Item item(int id);

	void update(Item item);

	List<Item> totalList();




	

	
}
