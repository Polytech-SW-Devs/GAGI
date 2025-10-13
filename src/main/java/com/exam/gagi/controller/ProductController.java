package com.exam.gagi.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.gagi.model.Category;
import com.exam.gagi.model.ItemImage;
import com.exam.gagi.model.Items;
import com.exam.gagi.model.Member;
import com.exam.gagi.pager.MyPagePager;
import com.exam.gagi.service.ProductService;

@Controller
public class ProductController {
	final String path = "product";
	final String uploadImagePath = "d:/upoad";
	
	@Autowired
	ProductService service;

	// 게시글 리스트
	@GetMapping("product/list")
	String list(HttpSession session, Model model, MyPagePager pager) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) {
			System.out.println("로그인 정보가 없습니다. 로그인하세요");
			return "redirect:/login";
		}
		int userId = loginUser.getId();
		pager.setUserId(userId);
		List<Items> list = service.list(pager);
		model.addAttribute("list", list);
		return path + "/list";
	}

	// 게시글 등록
	@GetMapping("product/add")
	String add(HttpSession session, Items item, Model model, MultipartFile[] uploadFile) {
		if (uploadFile != null) {
			List<ItemImage> itemImage = new ArrayList<ItemImage>();
			for (MultipartFile file: uploadFile) {
				String filename = file.getOriginalFilename();
				String uuid = UUID.randomUUID().toString();
				
			}
			
		}
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) {
			System.out.println("로그인 정보가 없습니다. 로그인하세요");
			return "redirect:/login";
		}
		List<Category> categories = service.getCategory();
		model.addAttribute("categories", categories);
		
		model.addAttribute("itme", new Items());
		return path + "/add";
	}
	@PostMapping("product/add")
	String add(HttpSession session, Items item) {

		System.out.println("title: " + item.getTitle());
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) {
			System.out.println("로그인 정보가 없습니다. 로그인하세요");
			return "redirect:/login";
		}
		item.setUserId(loginUser.getId());
		
		service.add(item);
		return "redirect:./list";
	}

	// 게시글 삭제
	@GetMapping("product/delete/{id}")
	String delete(@PathVariable("id") int id, 
					@SessionAttribute(name = "loginUser", required = false) Member loginUser,
					RedirectAttributes rttr) {
		// 로그인 확인
	    if (loginUser == null) {
	    	rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
	        return "redirect:/login"; // 로그인 페이지로 이동
	    }
		service.delete(id);
		return "redirect:./list";
	}

	// 게시글 수정
	@GetMapping("product/update/{id}")
	String update(@PathVariable("id") int id, Model model,
					@SessionAttribute(name = "loginUser", required = false) Member loginUser,
					RedirectAttributes rttr) {
		// 로그인 확인
	    if (loginUser == null) {
	    	rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
	        return "redirect:/login"; // 로그인 페이지로 이동
	    }
		
		Items item = service.item(id);
		model.addAttribute("item", item);
		return path + "/update";
	}
	
	// 게시글 수정(post)
	@PostMapping("product/update/{id}")
	String update(@PathVariable("id") int id, Items item,
					@SessionAttribute(name = "loginUser", required = false) Member loginUser,
					RedirectAttributes rttr) {
		// 로그인 확인
	    if (loginUser == null) {
	    	rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
	        return "redirect:/login"; // 로그인 페이지로 이동
	    }
		item.setId(id);
		service.update(item);
		return "redirect:/product/list";
	}

	// 상세페이지
	@GetMapping("/product/detail/{id}")
	String detail(@PathVariable int id, Model model,
					HttpSession session,
					@SessionAttribute(name = "loginUser", required = false) Member loginUser,
					RedirectAttributes rttr) {
		// 로그인 확인
	    if (loginUser == null) {
	    	rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
	        return "redirect:/login"; // 로그인 페이지로 이동
	    }
	    
	    // 세션을 이용해 조회수 중복 방지
	    String viewedKey = "viewed_" + id;
	    Boolean viewed = (Boolean) session.getAttribute(viewedKey);

	    if (viewed == null || !viewed) {
	        // 처음 본 상품이면 조회수 증가
	        service.increaseViews(id);
	        session.setAttribute(viewedKey, true); // 조회 기록 저장
	    }

	    Items item = service.item(id);
	    
		model.addAttribute("item", item);
		model.addAttribute("member", loginUser);
		return "/product/detail";
	}

}
