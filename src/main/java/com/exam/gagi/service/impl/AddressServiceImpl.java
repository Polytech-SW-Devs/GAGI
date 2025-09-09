package com.exam.gagi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.gagi.dao.AddressDao;
import com.exam.gagi.model.Address;
import com.exam.gagi.service.AddressService;

@Service
public class AddressServiceImpl implements AddressService {

	@Autowired
	private AddressDao addressDao;
	
	@Override
	public List<Address> getAllAddresses() {
		return addressDao.getAllAddresses();
	}

	@Override
	public Address getAddressByPk(int addressPk) {
		return addressDao.getAddressByPk(addressPk);
	}

}
