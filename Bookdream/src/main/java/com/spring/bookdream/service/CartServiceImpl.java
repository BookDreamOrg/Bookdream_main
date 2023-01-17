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

	@Override
	public List<CartVO> getCartList(CartVO vo) {
		
		return cartDAO.getCartList(vo);
	}

	@Override
	public int deleteCart(CartVO vo) {
		// TODO Auto-generated method stub
		return cartDAO.deleteCart(vo);
	}


}
