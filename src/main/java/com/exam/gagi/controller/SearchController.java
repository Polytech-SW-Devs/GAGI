package com.exam.gagi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.exam.gagi.model.Category;
import com.exam.gagi.model.MainItemDTO;
import com.exam.gagi.pager.SearchPager;
import com.exam.gagi.service.ProductService;

@Controller
public class SearchController {

	@Autowired
	private ProductService productService;

	// 카테고리별 검색 (전체)
	@GetMapping("/category/")
	public String allCategoryList(SearchPager pager, Model model) {
		// 전체 상품 조회 (searchItems를 활용)
		int totalCount = productService.countSearchItems("");
		pager.setTotal(totalCount);
		pager.setKeyword("");
		List<MainItemDTO> items = productService.searchItems(pager);
		model.addAttribute("baseUrl", "/category/");
		model.addAttribute("sectionTitle", "전체 상품");

		model.addAttribute("items", items);
		model.addAttribute("pager", pager);
		return "search";
	}

	// 카테고리별 검색 (특정 카테고리)
	@GetMapping("/category/{categoryId}")
	public String categoryList(@PathVariable int categoryId, SearchPager pager, Model model) {
		// 특정 카테고리 상품 조회
		int totalCount = productService.countItemsByCategory(categoryId);
		pager.setTotal(totalCount);
		List<MainItemDTO> items = productService.getItemsByCategory(categoryId, pager);
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("baseUrl", "/category/" + categoryId);

		Category category = productService.getCategoryById(categoryId);
		if (category != null) {
			model.addAttribute("sectionTitle", category.getName());
		}

		model.addAttribute("items", items);
		model.addAttribute("pager", pager);
		return "search";
	}

	// 검색별 검색
	@GetMapping("/search")
	public String searchList(SearchPager pager, Model model) {

		int totalCount = productService.countSearchItems(pager.getKeyword());
		pager.setTotal(totalCount);

		List<MainItemDTO> items = productService.searchItems(pager);
		model.addAttribute("items", items);
		model.addAttribute("keyword", pager.getKeyword());
		model.addAttribute("pager", pager);
		model.addAttribute("baseUrl", "/search");

		if (pager.getKeyword() != null && !pager.getKeyword().trim().isEmpty()) {
			model.addAttribute("sectionTitle", "'" + pager.getKeyword() + "' 검색 결과");
		} else {
			model.addAttribute("sectionTitle", "전체 검색 결과");
		}

		return "search";
	}
}