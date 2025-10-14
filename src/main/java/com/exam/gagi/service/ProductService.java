package com.exam.gagi.service;

import java.util.List;

import com.exam.gagi.model.Category;
import com.exam.gagi.model.Items;
import com.exam.gagi.model.MainItemDTO;
import com.exam.gagi.pager.MyPagePager;

public interface ProductService {

	List<Items> list(int id, MyPagePager pager);// 로그인한 유저가 등록한 상품만 조회

	void add(Items item);

	void delete(int id);

	Items item(int id);

	void update(Items item);

	List<Items> totalList(MyPagePager pager);

	// 재고 증감 메서드
	void changeAmount(int itemId, int amountChange);

	// 테스트용 상품+이미지 등록
	void addWithImage(Items item);

	List<Category> getCategory();

	void increaseViews(int id);

	// 최신 상품 4개 조회
	List<MainItemDTO> getLatestItems();

	// 인기 상품 8개 조회
	List<MainItemDTO> getTopPurchasedItems();

}
