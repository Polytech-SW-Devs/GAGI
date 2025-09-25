package com.exam.gagi.model;

public class Address {
	private int addressId;
	private String zipCode;
	private String address;
	private String addressDetail;
	private String isDefault;
	private int memberId;
	private String deleveryName;
	private String deleveryPickup;
	private String phone;
	
	public String getMember() {
		if(deleveryPickup == null || deleveryPickup.isEmpty()) {
			return deleveryName;
		}else
			return deleveryName + "(" + deleveryPickup +")";
	}
	
	public String getAllAddress() {
		return address + addressDetail + "(" + zipCode + ")";
	}
	
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public String getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getDeleveryName() {
		return deleveryName;
	}

	public void setDeleveryName(String deleveryName) {
		this.deleveryName = deleveryName;
	}

	public String getDeleveryPickup() {
		return deleveryPickup;
	}

	public void setDeleveryPickup(String deleveryPickup) {
		this.deleveryPickup = deleveryPickup;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
