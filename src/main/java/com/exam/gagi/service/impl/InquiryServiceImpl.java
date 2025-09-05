package com.exam.gagi.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.InquiryDao;
import com.exam.gagi.model.Inquiry;
import com.exam.gagi.service.InquiryService;

@Service
public class InquiryServiceImpl extends BaseBoardServiceImpl<Inquiry> implements InquiryService {
	
	private final InquiryDao inquiryDao;

	@Autowired
	public InquiryServiceImpl(InquiryDao inquiryDao) {
		super(inquiryDao);
		this.inquiryDao = inquiryDao;
	}

}
