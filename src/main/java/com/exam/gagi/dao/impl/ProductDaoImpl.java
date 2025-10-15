package com.exam.gagi.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.ProductDao;
import com.exam.gagi.model.Category;
import com.exam.gagi.model.ItemImage;
import com.exam.gagi.model.Items;
import com.exam.gagi.model.MainItemDTO;
import com.exam.gagi.pager.MyPagePager;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	SqlSession sql;

	@Override
	public void add(Items item) {
		sql.insert("product.add", item);
	}
	
	@Override
	public int countByUserId(int id) {
		return sql.selectOne("product.countByUserId", id);
	}

	@Override
	public List<Items> list(MyPagePager pager) {
		return sql.selectList("product.list", pager);
	}

	@Override
	public int delete(Map<String, Object> param) {
		//return sql.update("product.delete", param);
		return sql.delete("product.delete", param);
	}

	@Override//상세페이지 상품 가져오기
	public Items item(int id) {
		return sql.selectOne("product.item", id);
	}
	
	@Override//이미지 리스트
	public List<ItemImage> ImageList(int itemId) {
		return sql.selectList("product.imageList", itemId);
	}

	@Override
	public void update(Items item) {
		sql.update("product.update", item);
	}

	@Override

	public List<Items> totalList(MyPagePager pager) {
		return sql.selectList("product.totalList", pager);
	}

	// 재고 증감 메서드
	@Override
	public int changeAmount(Map<String, Object> params) {

		return sql.update("product.changeAmount", params);
	}

	// 테스트용 상품+이미지 등록
	@Override
	public void addWithImage(ItemImage image) {
		sql.insert("product.addWithImage", image);
	}

	@Override
	public List<Category> getCategory() {
		return sql.selectList("product.selectCategory");

	}

	// 조회수 증가
	@Override
	public void updateViews(int id) {
		sql.update("product.updateViews", id);
	}

	@Override
	public void addItemImage(ItemImage image) {
		sql.insert("product.add_image", image);
	}
	
	// 최신 상품 4개 조회
	@Override
	public List<MainItemDTO> findLatestItems() {

		return sql.selectList("product.findLatestItems");
	}

	// 인기 상품 8개 조회
	@Override
	public List<MainItemDTO> findTopPurchasedItems() {

		return sql.selectList("product.findTopPurchasedItems");

	}

	@Override
	public void unsetMainImage(int itemId) {
		sql.update("product.unsetMainImage", itemId);
	}

	@Override
	public void setMainImage(int imageId) {
		sql.update("product.setMainImage", imageId);
	}

	

}
