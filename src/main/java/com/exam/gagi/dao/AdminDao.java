package com.exam.gagi.dao;

import java.util.List;

import com.exam.gagi.model.AdminOrderDto;
import com.exam.gagi.model.AdminProductDto;
import com.exam.gagi.model.AdminUserDto;
import com.exam.gagi.pager.AdminOrderPager;
import com.exam.gagi.pager.AdminProductPager;
import com.exam.gagi.pager.AdminUserPager;

public interface AdminDao {

	List<AdminProductDto> getProducts(AdminProductPager pager);

	int getProductsCount(AdminProductPager pager);

	int getUserCount(AdminUserPager pager);

	List<AdminUserDto> getUsers(AdminUserPager pager);

	List<AdminOrderDto> getOrders(AdminOrderPager pager);

	int getOrderCount(AdminOrderPager pager);

}
