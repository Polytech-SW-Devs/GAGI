package com.exam.gagi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.ItemDao;
import com.exam.gagi.service.itemService;

@Service
public class itemServiceImpl implements itemService {
	
	@Autowired
	private ItemDao itemDao;

	@Override
	public String getTitleById(int productId) {
		return itemDao.selectTitleById(productId);
	}

}
