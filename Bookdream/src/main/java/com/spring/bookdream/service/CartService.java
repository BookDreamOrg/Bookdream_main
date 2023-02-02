package com.spring.bookdream.service;

import java.util.List;

import com.spring.bookdream.vo.CartVO;



public interface CartService {

	// 카트 목록 조회
	List<CartVO> getCartList(CartVO vo);
	
	// 카트 아이템 등록
	int addCart(CartVO cart);
	
	// 카트 아이템 삭제
	int deleteCart(CartVO vo);
	
	/*
	// 카트 아이템 등록
	int addCart(CartVO cart, int user_no);
	
	// 카트 아이템 등록
	int addCart(CartVO cart, int user_no);
	
	// 카트 아이템 등록
	int addCart(CartVO cart, int user_no);
	
	// 카트 아이템 등록
	int addCart(CartVO cart, int user_no);
	 */

}
