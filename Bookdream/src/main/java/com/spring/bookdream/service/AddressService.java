package com.spring.bookdream.service;

import java.util.List;

import com.spring.bookdream.vo.AddressVO;

public interface AddressService {

	// 주소 조회
	List<AddressVO> getAddressList(AddressVO vo);
	
	// 선택한 주소의 값 호출 
	AddressVO getAddress(AddressVO vo);	
	
	// 기본 배송지 표시
	AddressVO getDefaultAddress(AddressVO vo);
	
	// 주소 입력
	void insertAddress(AddressVO vo);
	
	// 기본 배송지 설정
	void defaultAddress(AddressVO vo);
	
	// 주소 수정
	void updateAddress(AddressVO vo);
	
	// 주소 목록 삭제
	int deleteAddress(AddressVO address_no);

}
