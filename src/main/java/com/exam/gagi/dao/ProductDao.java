package com.exam.gagi.dao;

import java.util.List;
import java.util.Map;

import com.exam.gagi.model.Category;
import com.exam.gagi.model.ItemImage;
import com.exam.gagi.model.Items;
import com.exam.gagi.model.MainItemDTO;
import com.exam.gagi.pager.MyPagePager;
import com.exam.gagi.pager.SearchPager;

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

	// 최신 상품 4개 조회
	List<MainItemDTO> findLatestItems();

	// 인기 상품 8개 조회
	List<MainItemDTO> findTopPurchasedItems();

	// 카테고리별 상품 개수
	int countItemsByCategory(int categoryId);

	// 검색별 상품 개수
	int countSearchItems(String searchKeyword);

	// 카테고리별 상품 리스트
	List<MainItemDTO> getItemsByCategory(int categoryId, SearchPager pager);

	// 검색별 상품 리스트
	Category getCategoryById(int categoryId);

	List<MainItemDTO> searchItems(SearchPager pager);

}
