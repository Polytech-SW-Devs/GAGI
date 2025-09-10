package com.exam.gagi.service;

import java.util.List;

import com.exam.gagi.model.Inquiry;


public interface InquiryService extends BaseBoardService<Inquiry> {

	Inquiry getById(int id);

	int getUnansweredCount();

	List<Inquiry> getByUserId(int userId);




}
