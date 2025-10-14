package com.exam.gagi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.gagi.dao.ProductDao;
import com.exam.gagi.model.Category;
import com.exam.gagi.model.ItemImage;
import com.exam.gagi.model.Items;
import com.exam.gagi.model.MainItemDTO;
import com.exam.gagi.pager.MyPagePager;
import com.exam.gagi.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao dao;
	
	@Override//로그인한 유저가 등록한 리스트 조회
	public List<Items> list(int id, MyPagePager pager) {
		
		int total = dao.countByUserId(id);
		
		pager.setTotal(total);
		pager.setUserId(id);
		
		return dao.list(pager);
	}	
	
	@Transactional
	@Override//추가
	public void add(Items item) {
		dao.add(item);
		for(ItemImage itemImage : item.getItemImages()) {
			itemImage.setItemId(item.getId());
			dao.addItemImage(itemImage);
		}
	}

	@Override
	public void delete(int id) {
		dao.delete(id);

	}

	@Override
	public Items item(int id) {
		return dao.item(id);
	}

	@Override
	public void update(Items item) {
		dao.update(item);
	}

	@Override
	public List<Items> totalList(MyPagePager pager) {
		return dao.totalList(pager);
	}

	@Override
	public List<Category> getCategory() {
		return dao.getCategory();
	}

	// 재고 증감 메서드
	@Transactional
	@Override
	public void changeAmount(int itemId, int amountChange) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", itemId);
		params.put("amount", amountChange);

		int affectedRows = dao.changeAmount(params);

		if (affectedRows == 0) {
			throw new IllegalStateException("재고 부족으로 변경 실패");
		}
	}

	// 테스트용 상품+이미지 등록
	@Transactional
	@Override
	public void addWithImage(Items item) {
		System.out.println("### SERVICE: 서비스 시작 시점 이미지 리스트 사이즈: "
				+ (item.getItemImages() != null ? item.getItemImages().size() : "null"));
		dao.add(item);
		System.out.println("### DEBUG: 상품 등록 후 반환된 item.id: " + item.getId());

		for (ItemImage image : item.getItemImages()) {
			image.setItemId(item.getId());
			System.out.println("### DEBUG: 이미지에 설정된 itemId: " + image.getItemId());
			dao.addWithImage(image);
		}
	}

	@Override
	public void increaseViews(int id) {
		dao.updateViews(id);
	}
	
	

	// 최신 상품 4개 조회
	@Override
	public List<MainItemDTO> getLatestItems() {

		return dao.findLatestItems();
	}

	// 인기 상품 8개 조회
	@Override
	public List<MainItemDTO> getTopPurchasedItems() {

		return dao.findTopPurchasedItems();
	}

}
