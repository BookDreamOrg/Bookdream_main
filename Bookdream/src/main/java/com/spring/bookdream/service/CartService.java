package com.spring.bookdream.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.bookdream.vo.CartVO;



public interface CartService {

	// 장바구니 목록 조회
	List<CartVO> getCartList(CartVO cart);
	
	// 장바구니 리스트 갯수 -> 장바구니 뱃지로 사용
	int selectListCount(int user_no);
	
	// 장바구니 추가
	int addCart(CartVO cart);
	int addCart_init(CartVO cart);
	int selectInitCount(CartVO cart);
	List<CartVO> totalPrice(CartVO cart);
	
	// 장바구니 삭제
	int deleteCart(CartVO cart);
	
	// 카트 수량 수정 
	int modifyCount(CartVO cart);
	

	
}
