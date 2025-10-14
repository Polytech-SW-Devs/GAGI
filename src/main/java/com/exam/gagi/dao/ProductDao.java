package com.exam.gagi.dao;

import java.util.List;
import java.util.Map;

import com.exam.gagi.model.ItemImage;
import com.exam.gagi.model.Category;
import com.exam.gagi.model.Items;
import com.exam.gagi.pager.MyPagePager;

public interface ProductDao {

	void add(Items item);

	List<Items> list(MyPagePager pager);

	void delete(int id);

	void update(Items item);

	Items item(int id);

	List<Items> totalList(MyPagePager pager);

	// 재고 증감 메서드
	int changeAmount(Map<String, Object> params);

	// 테스트용 상품+이미지 등록
	void addWithImage(ItemImage image);

	List<Category> getCategory();

	void updateViews(int id);

	void addItemImage(ItemImage itemImage); //이미지 저장

}
