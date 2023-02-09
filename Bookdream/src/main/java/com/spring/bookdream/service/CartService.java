package com.spring.bookdream.service;

import java.util.List;

import com.spring.bookdream.vo.CartVO;



public interface CartService {

	// 장바구니 목록 조회
	List<CartVO> getCartList(int user_no);
	
	// 장바구니 리스트 갯수 -> 장바구니 뱃지로 사용
	int selectListCount(int user_no);
	
	// 장바구니 추가
	int addCart(CartVO vo);
	
	// 장바구니 삭제
	int deleteCart(CartVO vo);
	
	// 카트 수량 수정 
//	int modifyCount(CartVO vo);
	

	
}
