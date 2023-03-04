package com.spring.bookdream.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.CartDAO;
import com.spring.bookdream.vo.CartVO;


@Service("cartService")
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO cartDAO;

	/*-------------------- 장바구니 목록 조회 --------------------*/
	@Override
	public List<CartVO> getCartList(CartVO cart) {
		 return cartDAO.getCartList(cart);
	}
	@Override // 장바구니 리스트 갯수 -> 장바구니 뱃지로 사용
	public int selectListCount(int user_no) {
		return cartDAO.selectListCount(user_no);
	}
	
	
	
	/*-------------------- 장바구니 추가 --------------------*/
	@Override 
	public int addCart(CartVO cart) {
		return cartDAO.addCart(cart);
	}
	@Override
	public int addCart_init(CartVO cart) {
		return cartDAO.addCart_init(cart);
	}	
	@Override // 장바구니 추가 전 장바구니에 중복 아이템 확인
	public int selectInitCount(CartVO cart) {
		return cartDAO.selectInitCount(cart);
	}
	@Override
	public List<CartVO> totalPrice(CartVO cart) {
		return cartDAO.totalPrice(cart);
	}
	
	
	/*-------------------- 장바구니 삭제 --------------------*/
	@Override 
	public int deleteCart(CartVO cart) {
		return cartDAO.deleteCart(cart);
	}
	
	
	/*-------------------- 장바구니 수정 --------------------*/
	@Override // 카트 수량 수정
	public int modifyCount(CartVO cart) {
		return cartDAO.modifyCount(cart);
	}
	 
}
