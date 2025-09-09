package com.exam.gagi.dao;

import java.util.List;

import com.exam.gagi.model.Address;

public interface AddressDao {

	List<Address> getAllAddresses();

	Address getAddressByPk(int addressPk);

	void insertAddress(Address address);

}
