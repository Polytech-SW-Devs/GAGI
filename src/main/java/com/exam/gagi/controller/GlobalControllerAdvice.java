package com.exam.gagi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.exam.gagi.model.Category;
import com.exam.gagi.service.ProductService;

@ControllerAdvice
public class GlobalControllerAdvice {
	// header.jsp 전역에 데이터 들어가게 하는 controller
	@Autowired
	private ProductService productService;

	@ModelAttribute("categories")
	public List<Category> getGlobalCategories() {
		return productService.getCategory();
	}
}
