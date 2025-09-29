package com.exam.gagi.dao;

import com.exam.gagi.model.Member;

public interface MyUpdateDao {

	Member selectMyUpdate(int id);

	void MyUpdate(Member member);

}
