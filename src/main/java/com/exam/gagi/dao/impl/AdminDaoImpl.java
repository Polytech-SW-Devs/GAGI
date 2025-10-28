package com.exam.gagi.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.AdminDao;
import com.exam.gagi.model.AdminOrderDto;
import com.exam.gagi.model.AdminProductDto;
import com.exam.gagi.model.AdminUserDto;
import com.exam.gagi.pager.AdminOrderPager;
import com.exam.gagi.pager.AdminProductPager;
import com.exam.gagi.pager.AdminUserPager;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	SqlSession sql;

	@Override
	public List<AdminProductDto> getProducts(AdminProductPager pager) {

		return sql.selectList("admin.getProducts", pager);
	}

	@Override
	public int getProductsCount(AdminProductPager pager) {
		return sql.selectOne("admin.getProductsCount", pager);
	}

	@Override
	public List<AdminUserDto> getUsers(AdminUserPager pager) {

		return sql.selectList("admin.getUsers", pager);
	}

	@Override
	public int getUserCount(AdminUserPager pager) {
		return sql.selectOne("admin.getUserCount", pager);
	}

	@Override
	public List<AdminOrderDto> getOrders(AdminOrderPager pager) {
		return sql.selectList("admin.getOrders", pager);
	}

	@Override
	public int getOrderCount(AdminOrderPager pager) {
		return sql.selectOne("admin.getOrderCount", pager);
	}

}
