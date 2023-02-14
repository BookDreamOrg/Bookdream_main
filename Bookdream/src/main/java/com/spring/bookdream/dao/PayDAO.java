package com.spring.bookdream.dao;

import java.util.List;
import java.util.Map;

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

	public PayVO searchPay(PayVO vo) {
		
		System.out.println("---> PayDAO searchPay 실행 <---");

		return mybatis.selectOne("PayDAO.searchPay", vo);	
	}
	
	public PayVO lastPayment(PayVO vo) {
		
		System.out.println("---> PayDAO lastPayment 실행 <---");

		return mybatis.selectOne("PayDAO.lastPayment", vo);	
	}

	public List<Map<String, Object>> payWekTotalPrice(PayVO vo) {
		
		return mybatis.selectList("PayDAO.payWekTotalPrice", vo);	
	}

	// 월간 결제 금액
	public List<Map<String, Object>> payMlyTotalPrice(PayVO vo) {
		
		return mybatis.selectList("PayDAO.payMlyTotalPrice", vo);	
	}	

}