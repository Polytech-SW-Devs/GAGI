package com.exam.gagi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.gagi.dao.DeleveryDao;
import com.exam.gagi.model.Address;
import com.exam.gagi.service.DeleveryService;

@Service
public class DeleveryServiceImpl implements DeleveryService {

	private final Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private DeleveryDao dao;

	@Override
	public List<Address> addressList(int userId) {
		return dao.addressList(userId);
	}
	
	@Override
	@Transactional
	public void addAddress(Address address) {
		if(address.getIsDefault().equals("Y")) {
			dao.clearDefault(address.getMemberId());
		}
		dao.insertAddress(address);
	}


	@Override
	public Address getUpdate(int memberId, int addressId) {
		Map<String, Object> params = new HashMap<>();
		params.put("memberId", memberId);
		params.put("addressId", addressId);
		return dao.selectAddressIdByAndMemberId(params);
	}

	@Override
	@Transactional
	public boolean updateAddress(Address address) {
		Map<String, Object> params = new HashMap<>();
		params.put("memberId", address.getMemberId());
		params.put("addressId", address.getAddressId());
		
		// 1. DB에서 해당 주소 조회 (memberId 포함)
	    Address existing = dao.selectAddressIdByAndMemberId(params);

	    // 2. 존재하지 않거나 회원 ID 불일치 시 false 반환
	    if (existing == null) {
	        return false;
	    }

	    // 3. 대표 배송지 처리 포함해서 업데이트
	    if ("Y".equals(address.getIsDefault())) {
	        dao.clearDefault(address.getMemberId()); // 기존 대표 배송지 해제
	    }

	    dao.updateAddress(address);
	    return true;
	}

	@Override
	@Transactional
	public boolean deletedAddress(int memberId, int addressId) {
		Map<String, Object> params = new HashMap<>();
		params.put("memberId", memberId);
		params.put("addressId", addressId);

		// 1. DB에서 해당 주소 조회 (memberId 포함)
	    Address existing = dao.selectAddressIdByAndMemberId(params);

	    // 2. 존재하지 않거나 회원 ID 불일치 시 false 반환
	    if (existing == null) {
	        return false;
	    }
		
	    dao.deletedAddress(params);
		return true;
	}

}
