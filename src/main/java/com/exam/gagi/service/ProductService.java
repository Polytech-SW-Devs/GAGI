package com.exam.gagi.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.exam.gagi.model.Category;
import com.exam.gagi.model.ItemImage;
import com.exam.gagi.model.Items;
import com.exam.gagi.model.MainItemDTO;
import com.exam.gagi.pager.MyPagePager;
import com.exam.gagi.pager.SearchPager; // SearchPager import 추가

public interface ProductService {

	List<Items> list(int id, MyPagePager pager);// 로그인한 유저가 등록한 상품만 조회

	void add(Items item);

	int delete(int id, int loginUser);

	Items item(int id);

	void update(Items item, MultipartFile[] uploadFile, String mainImageIndex);


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

	// 카테고리별 아이템 개수 조회
	int countItemsByCategory(int categoryId);

	// 검색 키워드별 아이템 개수 조회
	int countSearchItems(String searchKeyword);

	// 카테고리별 아이템 페이징 조회
	List<MainItemDTO> getItemsByCategory(int categoryId, SearchPager pager);

	// 검색 키워드별 아이템 페이징 조회
	public Category getCategoryById(int categoryId);

	public List<MainItemDTO> searchItems(SearchPager pager);

	boolean deleteImage(int id);

}
