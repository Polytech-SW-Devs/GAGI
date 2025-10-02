package com.exam.gagi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.ProductDao;
import com.exam.gagi.model.Category;
import com.exam.gagi.model.Items;
import com.exam.gagi.pager.MyPagePager;
import com.exam.gagi.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao dao;
	
	@Override//로그인한 유저가 등록한 리스트 조회
	public List<Items> list(MyPagePager pager) {
		return dao.list(pager);
	}	
	@Override//추가
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
	public List<Items> totalList(MyPagePager pager) {
		return dao.totalList(pager);
	}

}
