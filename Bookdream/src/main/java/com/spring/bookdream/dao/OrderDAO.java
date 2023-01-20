package com.spring.bookdream.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.OrderVO;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	// 주문정보 등록
	public void insertOrder(OrderVO vo) {
		
		System.out.println("---> OrderDAO insertOrder 실행 <---");
		mybatis.insert("OrderDAO.insertOrder", vo);		
	}

	// 주문번호 호출
	public OrderVO searchOrderNo(OrderVO vo) {
		
		System.out.println("---> OrderDAO searchOrderNo 실행 <---");
		
		return mybatis.selectOne("OrderDAO.searchOrderNo", vo);	
	}
}
