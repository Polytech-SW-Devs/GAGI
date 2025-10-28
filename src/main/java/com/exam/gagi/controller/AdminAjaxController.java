package com.exam.gagi.controller;

import java.util.Collections;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.exam.gagi.pager.AdminOrderPager;
import com.exam.gagi.pager.AdminProductPager;
import com.exam.gagi.pager.AdminUserPager;
import com.exam.gagi.service.AdminService;

@RestController
@RequestMapping("/api/admin")
public class AdminAjaxController {

	@Autowired(required = false) // 서비스를 찾을 수 없을 때 에러 방지를 위해 required = false 추가
	private AdminService adminService;

	@GetMapping("/products")
	public ResponseEntity<?> getProducts(AdminProductPager pager) {
		if (adminService == null) {
			return ResponseEntity.ok(Collections.emptyMap());
		}
		Map<String, Object> map = adminService.getProducts(pager);
		return ResponseEntity.ok(map);
	}

	@GetMapping("/users")
	public ResponseEntity<?> getUsers(AdminUserPager pager) {
		if (adminService == null) {
			return ResponseEntity.ok(Collections.emptyMap());
		}
		Map<String, Object> map = adminService.getUsers(pager);
		return ResponseEntity.ok(map);
	}

	@GetMapping("/orders")
	public ResponseEntity<?> getOrders(AdminOrderPager pager) {
		if (adminService == null) {
			return ResponseEntity.ok(Collections.emptyMap());
		}
		Map<String, Object> map = adminService.getOrders(pager);
		return ResponseEntity.ok(map);
	}
}
