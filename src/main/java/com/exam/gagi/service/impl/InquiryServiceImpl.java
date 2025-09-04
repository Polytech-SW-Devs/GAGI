package com.exam.gagi.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.InquiryDao;
import com.exam.gagi.model.Inquiry;
import com.exam.gagi.service.InquiryService;

@Service
public class InquiryServiceImpl implements InquiryService {
	
	@Autowired
	private InquiryDao inquiryDao;

	@Override
	public List<Inquiry> getList(String search, int page, int size) {
		int offset = (page - 1) * size;
		return inquiryDao.selectList(search, offset, size);
	}

	@Override
	public int getCount(String search) {
		return inquiryDao.selectCount(search);
	}

	@Override
	public Inquiry getInquiry(int id) {
		return inquiryDao.selectInquiry(id);
	}


}
