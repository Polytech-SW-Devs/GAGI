package com.exam.gagi.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.DeleveryDao;
import com.exam.gagi.model.Address;

@Repository
public class DeleveryDaoImpl implements DeleveryDao {

	@Autowired
	private SqlSession sql;
	
	private final String path = "delevery.";

	@Override
	public List<Address> addressList(int userId) {
		return sql.selectList(path + "deleveryList", userId);
	}

	@Override
	public void clearDefault(int memberId) {
		sql.update(path + "clearDefault", memberId);
	}

	@Override
	public void insertAddress(Address address) {
		sql.insert(path + "insertAddress", address);
	}
	
	@Override
	public Address selectAddressIdByAndMemberId(Map<String, Object> params) {
		return sql.selectOne(path + "selectMap", params);
	}

	@Override
	public void updateAddress(Address address) {
		sql.update(path + "updateAddr", address);
	}

	@Override
	public void deletedAddress(Map<String, Object> params) {
		sql.update(path + "deletedAddr", params);
	}

	

}
