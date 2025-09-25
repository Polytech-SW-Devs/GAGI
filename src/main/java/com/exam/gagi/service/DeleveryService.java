package com.exam.gagi.service;

import java.util.List;

import com.exam.gagi.model.Address;

public interface DeleveryService {
	//주소 목록 창
	List<Address> addressList(int userId);
	//주소 등록하기
	void addAddress(Address address);
	
	Address getUpdate(int memberId, int addressId);
	
	boolean updateAddress(Address addressForm);
	
	boolean deletedAddress(int memberId, int addressId);

}
