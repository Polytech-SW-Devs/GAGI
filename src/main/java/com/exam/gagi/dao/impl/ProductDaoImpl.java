package com.exam.gagi.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.ProductDao;
import com.exam.gagi.model.Items;
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
	public List<Items> list(MyPagePager pager) {
		return sql.selectList("product.list", pager);
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
	public List<Items> totalList(MyPagePager pager) {
		return sql.selectList("product.totalList", pager);
	}

}
