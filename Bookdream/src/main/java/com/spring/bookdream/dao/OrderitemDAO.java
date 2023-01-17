package com.spring.bookdream.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.OrderitemVO;


@Repository
public class OrderitemDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	// 결제 상품 목록조회
	public List<OrderitemVO> getOrderitemList(OrderitemVO vo) {
		
		System.out.println("---> getOrderitemList 처리 <---");
	
		return mybatis.selectList("OrderitemDAO.getOrderitemList", vo);
	}
	
	// 결제 상품 갯수 조회
	public List<OrderitemVO> getOrderitemCount(OrderitemVO vo) {
		
		System.out.println("---> getOrderitemCount 처리 <---");
	
		return mybatis.selectList("OrderitemDAO.getOrderitemCount", vo);
	}



}