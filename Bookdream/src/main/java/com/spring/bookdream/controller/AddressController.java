package com.spring.bookdream.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;


import com.spring.bookdream.service.AddressService;
import com.spring.bookdream.vo.AddressVO;

@Controller
@RequestMapping(value="/address")
public class AddressController {
	
	@Autowired
	private AddressService addressService;
	
	@RequestMapping(value="/insert")
	@ResponseBody
	public void insertAddress(@RequestBody AddressVO vo) {
		
		addressService.insertAddress(vo);

	}
	
	@RequestMapping(value="/allList")
	@ResponseBody	
	public List<AddressVO> getAddressList(AddressVO vo) {
		
		List<AddressVO> list  = addressService.getAddressList(vo);
		
		return list;
	}

	@RequestMapping(value="/default")
	@ResponseBody
	public void defaultAddress(@RequestBody AddressVO vo) {
		
		addressService.defaultAddress(vo);
	}	
	
	@RequestMapping(value="/delete")
	@ResponseBody
	public void deleteAddress(@RequestBody AddressVO address_no) {
		
		addressService.deleteAddress(address_no);
	}		
	
	@RequestMapping(value="/get")
	@ResponseBody	
	public AddressVO getAddress(@RequestBody AddressVO vo) {

		return addressService.getAddress(vo);
		
	}
	

	@RequestMapping(value="/update")
	@ResponseBody
	public void updateAddress(@RequestBody AddressVO vo) {
		
		addressService.updateAddress(vo);

	}	
}
