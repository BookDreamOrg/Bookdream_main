package com.spring.bookdream.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.OrderitemVO;


@Repository
public class OrderitemDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	// 장바구니 -> 결제 상품 목록 조회
	public List<Map<String, Object>> getOrderitemList(OrderitemVO vo) {
		
		System.out.println("---> getOrderitemList 처리 <---");
	
		return mybatis.selectList("OrderitemDAO.getOrderitemList", vo);
	}
	
	// 장바구니 -> 결제 상품 개수 조회
	public Map<String, Object> getOrderitemCount(OrderitemVO vo) {
		
		System.out.println("---> getOrderitemCount 처리 <---");
	
		return mybatis.selectOne("OrderitemDAO.getOrderitemCount", vo);
	}

	
	// 바로구매 -> 결제 상품 조회
	public Map<String, Object> getBuyNow(OrderitemVO vo) {
		
		System.out.println("---> getBuyNow 처리 <---");
	
		return mybatis.selectOne("OrderitemDAO.getBuyNow", vo);
	}

	
	public int deleteCartList(OrderitemVO user_no) {

		System.out.println("---> deleteCardList 처리 <---");
		
		return mybatis.delete("OrderitemDAO.deleteCartList", user_no);
		
	}

	public int updateUserPoint(OrderitemVO vo) {
		
		System.out.println("---> updateUserPoint 처리 <---");
		
		return mybatis.update("OrderitemDAO.updateUserPoint", vo);
	}

}