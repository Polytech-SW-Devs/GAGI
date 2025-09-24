package com.exam.gagi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.gagi.model.Address;
import com.exam.gagi.model.Member;
import com.exam.gagi.service.DeleveryService;

@Controller
@RequestMapping("/mypage/delevery")
public class DeleveryController {
	
	private final Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private DeleveryService service;
	
	private final String path = "/mypage/delevery/";
	
	// 주소 목록창 들어가기
	@GetMapping("/addressList")
	public String addressesList(Model model, @SessionAttribute(name = "loginUser", required = false) Member loginUser) {

	    // 로그인 확인
	    if (loginUser == null) {
	        return "redirect:/login"; // 로그인 페이지로 이동
	    }

	    // 사용자 ID 가져오기
	    int userId = loginUser.getId();

	    // 배송지 조회
	    List<Address> deleveryList = service.addressList(userId);

	    // 모델에 세션 정보 및 배송지 리스트 담기
	    model.addAttribute("loginUser", loginUser);
	    model.addAttribute("deleveryList", deleveryList);

	    return path + "addressList"; // JSP 뷰 이름
	}

	// 주소 입력창 들어가기
	@GetMapping("/addressAdd")
	public String getAddressAdd(@SessionAttribute(name = "loginUser", required = false) Member loginUser) {
		
		// 로그인 확인
	    if (loginUser == null) {
	        return "redirect:/login"; // 로그인 페이지로 이동
	    }
	    
		return	path + "addressAdd";
	}
	
	// 주소 등록하기
	@PostMapping("/addressAdd")
	public String postAddressAdd(Address address, @SessionAttribute(name = "loginUser", required = false) Member loginUser, Model model) {
		// 로그인 확인
	    if (loginUser == null) {
	        return "redirect:/login"; // 로그인 페이지로 이동
	    }
	    
	    address.setMemberId(loginUser.getId());
	    address.setIsDefault(address.getIsDefault() != null ? address.getIsDefault() : "N");
	    
	    service.addAddress(address);
	    
	    return "redirect:" + path + "addressList";
	}
	
	/**
	 * 
	 * @param id	회원번호
	 * @param model	
	 * @return id를 가져와서 mypage이동
	 */
	@GetMapping("/addressUpdate/{addressId}")
	public String getUpdate(@PathVariable int addressId, 
							Model model, 
							@SessionAttribute(name = "loginUser", required = false) Member loginUser,
							RedirectAttributes rttr) {
		
		// 로그인 확인
	    if (loginUser == null) {
	        return "redirect:/login"; // 로그인 페이지로 이동
	    }
	    // 주소 데이터 조회
	    Address address = service.getUpdate(loginUser.getId(), addressId);

	    // 주소 존재 여부 및 소유자 검증
	    if (address == null) {
	        rttr.addFlashAttribute("msg", "잘못된 접근입니다.");
	        return "redirect:/mypage/addressList";
	    }
	    
	    //jps에 전달
	    model.addAttribute("address", address);
	    // 수정 폼 jsp로 이동
	    return path + "addressUpdate";
	}
	
	/**
	 * 
	 * @param id	회원번호
	 * @param member
	 * @return 개인 정보 업데이트 하기
	 */
	@PostMapping("/addressUpdate/{addressId}")
	public String postUpdate(@PathVariable int addressId, 
							Address address,
							@SessionAttribute(name = "loginUser", required = false) Member loginUser, 
							RedirectAttributes rttr ) {

		// 로그인 확인
		if (loginUser == null) {
			rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/login"; // 로그인 페이지로 이동
	    }
		// 수정 데이터 보정
	    address.setAddressId(addressId);	//주소 PK
	    address.setMemberId(loginUser.getId());		//회원 PK
	    
	    // 3. 서비스 호출 → 로그인 회원 소유인지 내부에서 검증
	    boolean updated = service.updateAddress(address);
	    
		if(!updated) {
			rttr.addFlashAttribute("msg", "주소 수정 실패 또는 잘못된 접근입니다.");
			return "redirect:/mypage";
		}
        
        rttr.addFlashAttribute("msg", "주소가 수정되었습니다.");
	    return "redirect:" + path + "addressList";
	}
	
	@PostMapping("/addressDelete/{addressId}")
	public String deleteAddress(@PathVariable int addressId,
	                            @SessionAttribute(name = "loginUser", required = false) Member loginUser,
	                            RedirectAttributes rttr) {
	    if (loginUser == null) {
	        rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
	        return "redirect:/login";
	    }

	    boolean deleted = service.deletedAddress(loginUser.getId(), addressId);

	    if (!deleted) {
	        rttr.addFlashAttribute("msg", "주소 삭제 실패 또는 잘못된 접근입니다.");
	        return "redirect:/mypage";
	    }

	    rttr.addFlashAttribute("msg", "주소가 삭제되었습니다.");
	    return "redirect:/addressList";
	}
	
}
