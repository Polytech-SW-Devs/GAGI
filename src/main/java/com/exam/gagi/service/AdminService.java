package com.exam.gagi.service;

import java.util.Map;

import com.exam.gagi.pager.AdminOrderPager;
import com.exam.gagi.pager.AdminProductPager;
import com.exam.gagi.pager.AdminUserPager;

public interface AdminService {

	Map<String, Object> getUsers(AdminUserPager pager);

	Map<String, Object> getProducts(AdminProductPager pager);

	Map<String, Object> getOrders(AdminOrderPager pager);

}
