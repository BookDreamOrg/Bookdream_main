package com.spring.bookdream.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.PayVO;

@Repository
public class PayDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertPay(PayVO vo) {
		
		System.out.println("---> PayDAO inserPay 실행 <---");
		mybatis.insert("PayDAO.insertPay", vo);		
	}
	
	public void updatePay(PayVO vo) {
		
		mybatis.update("PayDAO.updatePay", vo);		
	}
	

}