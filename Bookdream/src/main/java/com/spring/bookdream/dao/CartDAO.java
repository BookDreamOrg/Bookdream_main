package com.spring.bookdream.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.CartVO;

@Repository
public class CartDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 장바구니 목록 조회
	public List<CartVO> getCartList(CartVO vo) {
		
		System.out.println("---> 장바구니 목록 조회 <---");
		
		return mybatis.selectList("CartDAO.getCartList", vo);
	}

	public int deleteCart(CartVO vo) {

		System.out.println("---> 선택한 장바구니 삭제 <---");
		
		return mybatis.delete("CartDAO.deleteCart", vo);
	}
	
}