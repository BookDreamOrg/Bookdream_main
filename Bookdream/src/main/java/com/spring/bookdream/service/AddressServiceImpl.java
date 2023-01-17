package com.spring.bookdream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.AddressDAO;
import com.spring.bookdream.vo.AddressVO;


@Service("AddressService")
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private AddressDAO addressDAO;

	@Override
	public List<AddressVO> getAddressList(AddressVO vo) {
	
		return addressDAO.getAddressList(vo);
	}

	@Override
	public void insertAddress(AddressVO vo) {
		
		System.out.println("---> address insert <---");
		addressDAO.insertAddress(vo);
	}

	@Override
	public void defaultAddress(AddressVO vo) {
		
		System.out.println("---> dafault_address setting <---");
		addressDAO.defaultAddress(vo);		
	}

	@Override
	public int deleteAddress(AddressVO address_no) {
		System.out.println("---> delete_address <---");
		
		return addressDAO.deleteAddress(address_no);		
		
	}

	@Override
	public AddressVO getAddress(AddressVO vo) {
		
		System.out.println("---> getAddress 33<---");
		
		return addressDAO.getAddress(vo);
		
	}

	@Override
	public void updateAddress(AddressVO vo) {
		
		System.out.println("---> updateAddress <---");
		addressDAO.updateAddress(vo);				
	}
	

}
