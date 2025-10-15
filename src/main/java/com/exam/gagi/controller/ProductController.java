package com.exam.gagi.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestParam;
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

	final String uploadPath = "d:/upload/";

	@Autowired
	ProductService service;

	/**
	 * 페이지네이션 추가
	 * 
	 * @param session
	 * @param model
	 * @param pager
	 * @return 리스트로 이동 by 한수원
	 */
	// 게시글 리스트
	@GetMapping("product/list")
	String list(HttpSession session, Model model, MyPagePager pager) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) {
			System.out.println("로그인 정보가 없습니다. 로그인하세요");
			return "redirect:/login";
		}
		List<Items> list = service.list(loginUser.getId(), pager);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		return path + "/list";
	}

	// 게시글 등록
	@GetMapping("product/add")
	String add(HttpSession session, Items item, Model model) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) {
			System.out.println("로그인 정보가 없습니다. 로그인하세요");
			return "redirect:/login";
		} // 로그인 확인 코드

		List<Category> categories = service.getCategory();
		model.addAttribute("categories", categories);

		model.addAttribute("itme", new Items());
		return path + "/add";
	}

	@PostMapping("product/add")
	String add(HttpSession session, Items item, MultipartFile[] uploadFile,
			@RequestParam(value = "mainImageIndex", required = false, defaultValue = "0") int mainImageIndex) {
		System.out.println("title: " + item.getTitle()); // 확인용 로그
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) {
			System.out.println("로그인 정보가 없습니다. 로그인하세요");
			return "redirect:/login";
		}
		item.setUserId(loginUser.getId());// 로그인 확인

		if (uploadFile != null && uploadFile.length > 0) {
			List<ItemImage> itemImage = new ArrayList<ItemImage>();
			int nowIndex = 0; // 현재 파일 순서를 기억할 변수
			for (MultipartFile file : uploadFile) {
				if (file.isEmpty())
					continue;
				String filename = file.getOriginalFilename();
				String uuid = UUID.randomUUID().toString();

				try {
					file.transferTo(new File(uploadPath + uuid + "_" + filename));

					ItemImage image = new ItemImage();
					image.setFileName(uuid + "_" + filename);
					image.setUuid(uuid);
					image.setImageUrl("d:/upload/" + uuid + filename);

					if (nowIndex == mainImageIndex) {
						image.setSortOrder(1);
					} else {
						image.setSortOrder(2);
					}

					itemImage.add(image);
					nowIndex++;
				} catch (IllegalStateException | java.io.IOException e) {
					System.out.println(e.getLocalizedMessage());
				}

			}
			item.setItemImages(itemImage);

		}
		service.add(item);

		return "redirect:./list";
	}

	// 게시글 삭제
	@PostMapping("product/delete/{id}")
	String delete(@PathVariable("id") int id, @SessionAttribute(name = "loginUser", required = false) Member loginUser,
			RedirectAttributes rttr) {
		// 로그인 확인
		if (loginUser == null) {
			rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/login"; // 로그인 페이지로 이동
		}

		// 로그인 사용자 id
		int userId = loginUser.getId();

		try {
			int result = service.delete(id, userId); // Service 호출
			if (result == 0) {
				rttr.addFlashAttribute("msg", "삭제 권한이 없거나 이미 삭제된 상품입니다.");
			} else {
				rttr.addFlashAttribute("msg", "상품이 삭제되었습니다.");
			}
		} catch (Exception e) {
			rttr.addFlashAttribute("msg", "삭제 중 오류가 발생했습니다.");
			e.printStackTrace();
		}

		return "redirect:/product/list";
	}

	// 게시글 수정
	@GetMapping("product/update/{id}")
	String update(@PathVariable("id") int id, Model model,
			@SessionAttribute(name = "loginUser", required = false) Member loginUser, RedirectAttributes rttr) {
		// 로그인 확인
		if (loginUser == null) {
			rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/login"; // 로그인 페이지로 이동
		}

		Items item = service.item(id);
		List<ItemImage> itemImages = item.getItemImages();
		for (ItemImage single : itemImages) {
			System.out.println("이미지번호 : " + single.getId() + "/" + "대표이미지:" + single.getSortOrder());
		}

		model.addAttribute("item", item);
		return path + "/update";
	}

	// 게시글 수정(post)
	@PostMapping("product/update/{id}")
	String update(@PathVariable("id") int id, Items item, MultipartFile[] uploadFile,
			@RequestParam(value = "mainImageIndex", required = false) String mainImageIndex,
			@SessionAttribute(name = "loginUser", required = false) Member loginUser, RedirectAttributes rttr) {
		// 로그인 확인
		if (loginUser == null) {
			rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/login"; // 로그인 페이지로 이동
		}
		item.setId(id);

		service.update(item, uploadFile, mainImageIndex);

		return "redirect:/product/list";
	}

	// 상세페이지
	@GetMapping("/product/detail/{id}")
	String detail(@PathVariable int id, Model model, HttpSession session,
			@SessionAttribute(name = "loginUser", required = false) Member loginUser, RedirectAttributes rttr) {
//		// 로그인 확인
//	    if (loginUser == null) {
//	    	rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
//	        return "redirect:/login"; // 로그인 페이지로 이동
//	    }

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
		return path + "/detail";
	}

}
