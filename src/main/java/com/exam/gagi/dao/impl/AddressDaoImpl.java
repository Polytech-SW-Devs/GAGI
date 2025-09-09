package com.exam.gagi.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.gagi.dao.AddressDao;
import com.exam.gagi.model.Address;

@Repository
public class AddressDaoImpl implements AddressDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Address> getAllAddresses() {
		return sqlSession.selectList("address.selectAll");
	}

	@Override
	public Address getAddressByPk(int addressPk) {
		return sqlSession.selectOne("address.selectByPk", addressPk);
	}

	@Override
	public void insertAddress(Address address) {
		sqlSession.insert("address.insertAddress", address);
	}

}
