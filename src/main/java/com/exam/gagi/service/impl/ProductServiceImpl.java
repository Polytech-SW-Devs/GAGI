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
		Items item = dao.item(id);
		if(item != null) {
			List<ItemImage> image = dao.ImageList(id);
			item.setItemImages(image);
		}
		
		return item;
		
	}
	
	@Transactional
	@Override
	public void update(Items item, org.springframework.web.multipart.MultipartFile[] uploadFile, String mainImageIndex) {
		final String uploadPath = "d:/upload/";
		
		// 1. 상품 기본 정보 업데이트
		dao.update(item);
		
		// 2. 새로운 이미지 파일 업로드 처리
		List<ItemImage> newImages = new java.util.ArrayList<>();
		if (uploadFile != null && uploadFile.length > 0) {
			for (org.springframework.web.multipart.MultipartFile file : uploadFile) {
				if (file.isEmpty()) {
					continue;
				}
				
				String filename = file.getOriginalFilename();
				String uuid = java.util.UUID.randomUUID().toString();
				String savedName = uuid + "_" + filename;
				
				try {
					file.transferTo(new java.io.File(uploadPath + savedName));
					
					ItemImage image = new ItemImage();
					image.setFileName(savedName);
					image.setUuid(uuid);
					image.setItemId(item.getId());
					image.setImageUrl(uploadPath + savedName);
					image.setSortOrder(2); // 기본값은 대표 이미지 아님
					
					dao.addItemImage(image);
					newImages.add(image);
					
				} catch (IllegalStateException | java.io.IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		// 3. 대표 이미지 설정
		if (mainImageIndex != null && !mainImageIndex.isEmpty()) {
			// 먼저 해당 상품의 모든 이미지를 일반 이미지로 설정
			dao.unsetMainImage(item.getId());
			
			if (mainImageIndex.startsWith("new_")) {
				// 새로 업로드된 이미지 중 하나를 대표 이미지로 설정
				try {
					int newImageIdx = Integer.parseInt(mainImageIndex.substring(4));
					if (newImageIdx >= 0 && newImageIdx < newImages.size()) {
						int newImageId = newImages.get(newImageIdx).getId();
						dao.setMainImage(newImageId);
					}
				} catch (NumberFormatException e) {
					e.printStackTrace();
				}
			} else {
				// 기존 이미지를 대표 이미지로 설정
				try {
					int existingImageId = Integer.parseInt(mainImageIndex);
					dao.setMainImage(existingImageId);
				} catch (NumberFormatException e) {
					e.printStackTrace();
				}
			}
		}
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

	@Override
	public void add(ItemImage image) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateItemImage(int id, List<ItemImage> itemImage) {
		// TODO Auto-generated method stub
		
	}

}
