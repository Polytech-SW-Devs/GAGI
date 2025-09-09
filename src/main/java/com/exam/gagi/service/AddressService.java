package com.exam.gagi.service;

import java.util.List;

import com.exam.gagi.model.Address;

public interface AddressService {

	List<Address> getAllAddresses();
	
	Address getAddressByPk(int addressPk);

}
