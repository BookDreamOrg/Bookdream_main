package com.spring.bookdream.dao;

import java.util.List;

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

	public List<OrderVO> searchOrder(OrderVO vo) {
		
		System.out.println("---> OrderDAO searchOrder 실행 <---");
		return mybatis.selectList("OrderDAO.searchOrder", vo);	
		
	}

}
