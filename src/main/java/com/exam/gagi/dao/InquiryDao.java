package com.exam.gagi.dao;

import java.util.List;

import com.exam.gagi.model.Inquiry;

public interface InquiryDao {

	List<Inquiry> selectList(String search, int offset, int size);

	int selectCount(String search);

	Inquiry selectInquiry(int id);

}
