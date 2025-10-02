package com.exam.gagi.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.ProductDao;
import com.exam.gagi.model.ItemImage;
import com.exam.gagi.model.Items;
import com.exam.gagi.pager.Pager;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	SqlSession sql;

	@Override
	public void add(Items item) {
		sql.insert("product.add", item);

	}

	@Override
	public List<Items> list(int userId) {
		return sql.selectList("product.list", userId);
	}

	@Override
	public void delete(int id) {
		sql.selectOne("product.delete", id);

	}

	@Override
	public Items item(int id) {
		return sql.selectOne("product.item", id);
	}

	@Override
	public void update(Items item) {
		sql.update("product.update", item);
	}

	@Override
	public List<Items> totalList(Pager pager) {
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

}
