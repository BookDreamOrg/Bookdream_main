package com.spring.bookdream.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bookdream.service.AddressService;
import com.spring.bookdream.vo.AddressVO;

@Controller
@RequestMapping(value="/address")
public class AddressController {
	
	@Autowired
	private AddressService addressService;

	@Autowired
	private HttpSession session;	
	
	// 주소등록
	@RequestMapping(value="/insert")
	@ResponseBody
	public void insertAddress(@RequestBody AddressVO vo) {
		
		int user_no = (int) session.getAttribute("user_no");
		vo.setUser_no(user_no);

		if ("Y".equals(vo.getDefault_add())) {
			addressService.defaultAddress(vo);
		}
		
		addressService.insertAddress(vo);

	}
	
	// 주소목록 조회
	@RequestMapping(value="/allList")
	@ResponseBody	
	public List<AddressVO> getAddressList(AddressVO vo) {
		
		int user_no = (int) session.getAttribute("user_no");
		vo.setUser_no(user_no);
		
		List<AddressVO> list  = addressService.getAddressList(vo);
		
		return list;
	}

	// 선택한 주소 조회
	@RequestMapping(value="/get")
	@ResponseBody	
	public AddressVO getAddress(@RequestBody AddressVO vo) {

		int user_no = (int) session.getAttribute("user_no");
		vo.setUser_no(user_no);
		
		return addressService.getAddress(vo);
	}
	
	// 기본 주소 불러옴
	@RequestMapping(value="/getDefault")
	@ResponseBody	
	public AddressVO getDefaultAddress(@RequestBody AddressVO vo) {

		int user_no = (int) session.getAttribute("user_no");
		vo.setUser_no(user_no);
		
		return addressService.getDefaultAddress(vo);
	}
	
	// 기본 주소 설정
	@RequestMapping(value="/default")
	@ResponseBody
	public void defaultAddress(@RequestBody AddressVO vo) {
		
		int user_no = (int) session.getAttribute("user_no");
		vo.setUser_no(user_no);
		
		addressService.defaultAddress(vo);
	}	
	
	// 주소 삭제
	@RequestMapping(value="/delete")
	@ResponseBody
	public void deleteAddress(@RequestBody AddressVO vo) {
		
		int user_no = (int) session.getAttribute("user_no");
		vo.setUser_no(user_no);
		
		addressService.deleteAddress(vo);
	}		
	
	// 주소 수정
	@RequestMapping(value="/update")
	@ResponseBody
	public void updateAddress(@RequestBody AddressVO vo) {
		
		int user_no = (int) session.getAttribute("user_no");
		vo.setUser_no(user_no);
		
		if ("Y".equals(vo.getDefault_add())) {
			addressService.defaultAddress(vo);
		}

		addressService.updateAddress(vo);

	}	
}
