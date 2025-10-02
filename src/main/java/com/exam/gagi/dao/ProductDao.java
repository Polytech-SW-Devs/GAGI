package com.exam.gagi.dao;

import java.util.List;
import java.util.Map;

import com.exam.gagi.model.ItemImage;
import com.exam.gagi.model.Items;
import com.exam.gagi.pager.Pager;

public interface ProductDao {

	void add(Items item);

	List<Items> list(int userId);

	void delete(int id);

	void update(Items item);

	Items item(int id);

	List<Items> totalList(Pager pager);

	// 재고 증감 메서드
	int changeAmount(Map<String, Object> params);

	// 테스트용 상품+이미지 등록
	void addWithImage(ItemImage image);

}
