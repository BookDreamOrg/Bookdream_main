package com.spring.bookdream.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.PurchaseDAO;
import com.spring.bookdream.vo.PurchaseVO;


@Service("purchaseService")
public class PurchaseServiceImpl implements PurchaseService {
	
	@Autowired
	private PurchaseDAO purchaseDAO;

	@Override
	public int insertPurchase(PurchaseVO user_no) {
		
		return purchaseDAO.insertPurchase(user_no);
			
	}

	@Override
	public int insertPurchase_now(PurchaseVO vo) {
		
		return purchaseDAO.insertPurchase_now(vo);
	}	
	
	@Override
	public List<Map<String, Object>> getPurchaseList(PurchaseVO vo) {
		return purchaseDAO.getPurchaseList(vo);
	}

	@Override
	public Map<String, Object> purchaseBookRatio() {

		return purchaseDAO.purchaseBookRatio();
	}

	// 배송출발시 재고 차감
	@Override
	public void updateBookStock(PurchaseVO vo) {
		
		purchaseDAO.updateBookStock(vo);
		
	}

	// 반품완료시 재고 반환
	@Override
	public void bookStockReturn(PurchaseVO vo) {
		purchaseDAO.bookStockReturn(vo);	
	}



	



}
