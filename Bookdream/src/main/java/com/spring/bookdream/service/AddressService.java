package com.spring.bookdream.service;

import java.util.List;

import com.spring.bookdream.vo.AddressVO;

public interface AddressService {

	// 결제화면에서 사용자의 주소 조회
	List<AddressVO> getAddressList(AddressVO vo);

	// 주소 목록 수정 버튼 
	AddressVO getAddress(AddressVO vo);	
	
	// 주소 입력
	void insertAddress(AddressVO vo);
	
	// 기본 배송지 설정
	void defaultAddress(AddressVO vo);
	
	// 주소 목록 삭제
	int deleteAddress(AddressVO address_no);
	
	void updateAddress(AddressVO vo);
	

}
