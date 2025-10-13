package com.exam.gagi.controller;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.gagi.model.Member;
import com.exam.gagi.model.Review;
import com.exam.gagi.service.MemberService;
import com.exam.gagi.service.ReviewService;
import com.exam.gagi.service.itemService;

@Controller
@RequestMapping("/review")
public class ReviewController extends BaseBoardController<Review> {
	
	private final ReviewService reviewService;

	@Autowired
    private MemberService memberService;

    @Autowired
    private itemService itemService;
    
	@Autowired
	public ReviewController(ReviewService reviewService,
							MemberService memberService,
							itemService itemService) {
		super(reviewService, "review");
		this.reviewService = reviewService;
		this.memberService = memberService;
		this.itemService = itemService;
	}

	@Override
	protected int getIdFromPost(Review post) {
		return post.getId();
	}
	
	// 리뷰 작성 폼
	@GetMapping("/writeForm")
    public String writeForm(@RequestParam("productId") int productId,
    		 				HttpSession session, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) {
	        // 비로그인 시 리다이렉트 처리 (로그인 페이지로)
	        return "redirect:/login";
	    }
		int memberId = loginUser.getId();

		// 상품명 조회
	    String title = itemService.getTitleById(productId);
	    System.out.println("상품명 확인: " + title);

	    // 작성자 닉네임 조회
	    String nickname = loginUser.getNickname();
//	    String nickname = memberService.getNicknameById(memberId);
	    System.out.println("닉네임 확인: " + nickname);

	    model.addAttribute("title", title);       // EL ${title}과 매칭
	    model.addAttribute("nickname", nickname); // EL ${nickname}과 매칭
	    model.addAttribute("targetId", productId); // 리뷰 대상(상품) 
	    model.addAttribute("reviewerId", memberId); // 리뷰 작성자
//	    model.addAttribute("now", LocalDateTime.now()); // 작성일

	    Date now = Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant());
	    model.addAttribute("now", now);
	    
	    return "review/write";
    }

    // 평균 평점 (AJAX)
    @GetMapping("/average/{targetId}")
    @ResponseBody
    public double getAverageRating(@PathVariable int targetId) {
        return reviewService.getAverageRating(targetId);
    }

    // 리뷰 목록 (AJAX)
    @GetMapping("/list/{targetId}")
    @ResponseBody
    public Object getReviews(@PathVariable int targetId) {
        return reviewService.getReviewsByTarget(targetId);
    }
	
}
