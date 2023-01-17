package com.spring.bookdream.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.OrderVO;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertOrder(OrderVO vo) {
		
		System.out.println("---> OrderDAO insertOrder 실행 <---");
		mybatis.insert("OrderDAO.insertOrder", vo);		
	}
	
}