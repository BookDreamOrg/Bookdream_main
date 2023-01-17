package com.spring.bookdream.service;

import java.util.List;

import com.spring.bookdream.vo.CartVO;



public interface CartService {

	// 장바구니 목록 조회
	List<CartVO> getCartList(CartVO vo);
	
	int deleteCart(CartVO vo);

}
