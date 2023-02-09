package com.spring.bookdream.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.CartVO;

@Repository
public class CartDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 장바구니 목록 조회
	public List<CartVO> getCartList(CartVO cart) {
		System.out.println("\n\t>>>>> CartDAO <<<<<< ");
		System.out.println("\t---> [장바구니] getCartList() 목록 조회");
		return mybatis.selectList("CartDAO.getCartList", cart);
	}
	
	// 장바구니 리스트 갯수 -> 장바구니 뱃지로 사용
	public int selectListCount(int user_no) {
		System.out.println("\n\t>>>>> CartDAO <<<<<< ");
		System.out.println("\t---> [장바구니] selectListCount() 리스트 갯수 측정");
		return mybatis.selectOne("CartDAO.selectListCount", user_no);
	}
	
	// 장바구니 추가
	public int addCart(CartVO cart) {
		System.out.println("\n\t>>>>> CartDAO <<<<<< ");
		System.out.println("\t---> [장바구니] addCart() 새로운 아이템 추가 ");
		return mybatis.insert("CartDAO.addCart", cart);
	}
	public int addCart_init(CartVO cart) {
		System.out.println("\n\t>>>>> CartDAO <<<<<< ");
		System.out.println("\t---> [장바구니] addCart_init() 새로운 아이템 추가 ");
		return mybatis.update("CartDAO.addCart_init", cart);
	}
	public int selectInitCount(CartVO cart) {
		System.out.println("\n\t>>>>> CartDAO <<<<<< ");
		System.out.println("\t---> [장바구니] selectInitCount() 아이템 중복 확인");
		return mybatis.selectOne("CartDAO.selectInitCount", cart);
	}
	
	// 장바구니 삭제
	public int deleteCart(CartVO cart) {
		System.out.println("\n\t>>>>> CartDAO <<<<<< ");
		System.out.println("\t---> [장바구니] deleteCart() 선택한 장바구니 삭제 ");
		return mybatis.delete("CartDAO.deleteCart", cart);
	}
	 
	
	// 장바구니 수량 수정
	/*
	public int modifyCount(CartVO vo) {
		System.out.println("\n >>>>> CartDAO <<<<<< ");
		System.out.println("---> [장바구니] 아이템 수량 수정 <---");
		return mybatis.update("CartDAO.modifyCount", vo);
	}
	 */
	
	
}