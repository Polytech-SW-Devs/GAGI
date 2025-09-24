package com.exam.gagi.dao;

import java.util.List;
import java.util.Map;

import com.exam.gagi.model.Address;

public interface DeleveryDao {
	// 주소 목록 리스트
	List<Address> addressList(int userId);
	
	// 기본 배송지 체크박스 확인
	void clearDefault(int memberId);
	
	// 주소 입력
	void insertAddress(Address address);

	// DB에서 memberId와 addressId에 맞는 정보 가져오기
	Address selectAddressIdByAndMemberId(Map<String, Object> params);
	
	// 주소 업데이트 하기
	void updateAddress(Address address);

	// 주소 삭제
	void deletedAddress(Map<String, Object> params);

	

	
	
}
