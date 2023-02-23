package com.spring.bookdream.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.PurchaseVO;

@Repository
public class PurchaseDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public int insertPurchase(PurchaseVO user_no) {

		System.out.println("---> 구매목록 저장(장바구니) <---");
		
		return mybatis.insert("PurchaseDAO.insertPurchase", user_no);
	}
	
	
	public int insertPurchase_now(PurchaseVO vo) {

		System.out.println("---> 구매목록 저장(바로구매) <---");
		
		return mybatis.insert("PurchaseDAO.insertPurchase_now", vo);
	}
	
	public List<Map<String, Object>> getPurchaseList(PurchaseVO vo) {

		System.out.println("---> 구매목록 조회 <---");
		
		return mybatis.selectList("PurchaseDAO.getPurchaseList", vo);
	}


	public Map<String, Object> purchaseBookRatio() {

		return mybatis.selectOne("PurchaseDAO.purchaseBookRatio");
	}


	// 배송출발시 재고 차감
	public void updateBookStock(PurchaseVO vo) {

		mybatis.update("PurchaseDAO.updateBookStock",vo);
	}


	// 반품완료시 재고 추가
	public void bookStockReturn(PurchaseVO vo) {

		mybatis.update("PurchaseDAO.bookStockReturn",vo);
		
	}
}