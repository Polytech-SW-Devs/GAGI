package com.exam.gagi.service;

import java.util.List;

import com.exam.gagi.model.Items;

public interface ProductService {

	List<Items> list(int userId);// 로그인한 유저가 등록한 상품만 조회

	void add(Items item);

	void delete(int id);

	Items item(int id);

	void update(Items item);

	List<Items> totalList();

}
