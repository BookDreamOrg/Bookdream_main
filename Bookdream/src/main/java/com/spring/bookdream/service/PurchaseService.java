package com.spring.bookdream.service;

import java.util.List;
import java.util.Map;

import com.spring.bookdream.vo.PurchaseVO;

public interface PurchaseService {
	
	// 주문 조회 입력 (장바구니)
	int insertPurchase(PurchaseVO user_no);

	// 주문 조회 입력  (바로구매)
	int insertPurchase_now(PurchaseVO vo);
	
	// 주문 목록 조회
	List<PurchaseVO> getPurchaseList(PurchaseVO vo);
	
	// 주문당 구매 도서수 비율
	Map<String, Object> purchaseBookRatio();	
	
}
