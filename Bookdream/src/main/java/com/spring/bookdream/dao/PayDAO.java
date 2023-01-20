package com.spring.bookdream.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.PayVO;

@Repository
public class PayDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	// 결제정보 등록
	public void insertPay(PayVO vo) {
		
		System.out.println("---> PayDAO inserPay 실행 <---");
		mybatis.insert("PayDAO.insertPay", vo);		
	}
	

}