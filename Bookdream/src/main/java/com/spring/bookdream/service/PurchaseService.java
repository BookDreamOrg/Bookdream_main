package com.spring.bookdream.service;

import java.util.List;

import com.spring.bookdream.vo.PurchaseVO;

public interface PurchaseService {
	
	// 주문 조회 입력
	int insertPurchase(PurchaseVO user_no);
	
	// 주문 목록 조회
	List<PurchaseVO> getPurchaseList(PurchaseVO vo);
	
}
