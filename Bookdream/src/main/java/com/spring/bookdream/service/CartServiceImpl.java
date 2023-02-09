package com.spring.bookdream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.CartDAO;
import com.spring.bookdream.vo.CartVO;


@Service("cartService")
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO cartDAO;

	@Override // 장바구니 목록 조회
	public List<CartVO> getCartList(int user_no) {
		 return cartDAO.getCartList(user_no);
	}

	@Override // 장바구니 리스트 갯수 -> 장바구니 뱃지로 사용
	public int selectListCount(int user_no) {
		return cartDAO.selectListCount(user_no);
	}
 
	
	@Override // 장바구니 추가
	public int addCart(CartVO vo) {
		return cartDAO.addCart(vo);
	}

	@Override // 장바구니 삭제
	public int deleteCart(CartVO vo) {
		return cartDAO.deleteCart(vo);
	}
	
	/*
	@Override // 카트 수량 수정
	public int modifyCount(CartVO vo) {
		return cartDAO.modifyCount(vo);
	}
	*/
	 
}
