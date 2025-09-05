package com.exam.gagi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.gagi.model.Inquiry;
import com.exam.gagi.service.BaseBoardService;
import com.exam.gagi.service.InquiryService;

@Controller
@RequestMapping("/inquiry")
public class InquiryController extends BaseBoardController<Inquiry> {

	private final InquiryService inquiryService;
	
	@Autowired
	public InquiryController(InquiryService inquiryService) {
		super(inquiryService, "inquiry");
		this.inquiryService = inquiryService;
	}
	
	@Override
	protected int getIdFromPost(Inquiry post) {
		return post.getId();
	}
	
}
