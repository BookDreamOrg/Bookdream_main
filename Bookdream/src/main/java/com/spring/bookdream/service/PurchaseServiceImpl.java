package com.spring.bookdream.service;


import java.util.List;

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
	public List<PurchaseVO> getPurchaseList(PurchaseVO vo) {
		return purchaseDAO.getPurchaseList(vo);
	}

	



}
