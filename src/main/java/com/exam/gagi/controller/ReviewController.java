package com.exam.gagi.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.gagi.model.Member;
import com.exam.gagi.model.Order;
import com.exam.gagi.model.Review;
import com.exam.gagi.service.MemberService;
import com.exam.gagi.service.OrderService;
import com.exam.gagi.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController extends BaseBoardController<Review> {
	
	private final ReviewService reviewService;

	@Autowired
    private MemberService memberService;

    @Autowired
    private OrderService orderService;
    
	@Autowired
	public ReviewController(ReviewService reviewService,
							MemberService memberService,
							OrderService orderService) {
		super(reviewService, "review");
		this.reviewService = reviewService;
		this.memberService = memberService;
		this.orderService = orderService;
	}

	@Override
	protected long getIdFromPost(Review post) {
		return post.getId();
	}
	
	// 리뷰 작성 폼
	@GetMapping("/writeForm")
    public String writeForm(@RequestParam("orderId") int orderId,
    		 				HttpSession session, Model model) {
		// 주문정보 조회
		Order order = orderService.getOrderById(orderId);
		model.addAttribute("orderItemId", order.getId());  // order.ID
		if (order.getItemId() == null) {
		    // 오류 처리
		    throw new IllegalStateException("주문에 연결된 상품이 존재하지 않습니다.");
		}
		model.addAttribute("targetId", order.getItemId());  // 상품 ID
		model.addAttribute("title", order.getItemTitle());  // 상품명
		
		// 로그인 유저 정보
		Member member = (Member) session.getAttribute("loginUser");
		model.addAttribute("reviewerId", member.getId()); // 리뷰 작성자
		model.addAttribute("nickname", member.getNickname());
		
		model.addAttribute("now", new Date());
	    
	    return "review/write";
    }
	
	// 리뷰 등록 처리
	@PostMapping("/write")
	public String write(Review review, HttpSession session) {
		// 로그인 유저 ID 생성
		Member member = (Member) session.getAttribute("loginUser");
		review.setReviewerId(member.getId());
		
		// 리뷰 등록
		reviewService.insertReview(review);
		
		return "redirect:/mypage/myorders";
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
