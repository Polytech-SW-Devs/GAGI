package com.exam.gagi.service;

import java.util.List;

import com.exam.gagi.model.Inquiry;


public interface InquiryService {

	List<Inquiry> getList(String search, int page, int size);

	int getCount(String search);

	Inquiry getInquiry(int id);



}
