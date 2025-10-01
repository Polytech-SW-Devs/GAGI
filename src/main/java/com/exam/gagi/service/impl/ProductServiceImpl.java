package com.exam.gagi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.gagi.dao.ProductDao;
import com.exam.gagi.model.Items;
import com.exam.gagi.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao dao;

	@Override // 로그인한 유저가 등록한 리스트 조회
	public List<Items> list(int userId) {
		return dao.list(userId);
	}

	@Override // 추가
	public void add(Items item) {
		dao.add(item);

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
	public List<Items> totalList() {
		return dao.totalList();
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

}
