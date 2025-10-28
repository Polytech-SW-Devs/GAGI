package com.exam.gagi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.AdminDao;
import com.exam.gagi.model.AdminOrderDto;
import com.exam.gagi.model.AdminProductDto;
import com.exam.gagi.model.AdminUserDto;
import com.exam.gagi.pager.AdminOrderPager;
import com.exam.gagi.pager.AdminProductPager;
import com.exam.gagi.pager.AdminUserPager;
import com.exam.gagi.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDao dao;

	@Override
	public Map<String, Object> getProducts(AdminProductPager pager) {
		int total = dao.getProductsCount(pager);
		pager.setTotal(total);

		List<AdminProductDto> products = dao.getProducts(pager);

		Map<String, Object> map = new HashMap<>();
		map.put("pager", pager);
		map.put("products", products);

		return map;
	}

	@Override
	public Map<String, Object> getUsers(AdminUserPager pager) {
		int total = dao.getUserCount(pager);
		pager.setTotal(total);

		List<AdminUserDto> users = dao.getUsers(pager);

		Map<String, Object> map = new HashMap<>();
		map.put("pager", pager);
		map.put("users", users);

		return map;
	}

	@Override
	public Map<String, Object> getOrders(AdminOrderPager pager) {
		int total = dao.getOrderCount(pager);
		pager.setTotal(total);

		List<AdminOrderDto> orders = dao.getOrders(pager);

		Map<String, Object> map = new HashMap<>();
		map.put("pager", pager);
		map.put("orders", orders);

		return map;
	}

}
