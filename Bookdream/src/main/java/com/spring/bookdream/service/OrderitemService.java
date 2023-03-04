package com.spring.bookdream.service;

import java.util.List;
import java.util.Map;

import com.spring.bookdream.vo.OrderitemVO;

public interface OrderitemService {

	// 결제 상품 목록 조회 (장바구니 -> 결제)
	List<Map<String, Object>> getOrderitemList(OrderitemVO vo);
	
	// 결제 상품 갯수 조회 (장바구니 -> 결제)
	Map<String, Object> getOrderitemCount(OrderitemVO vo);
	
	// 결제 상품 조회 (바로구매 -> 결제)
	Map<String, Object> getBuyNow(OrderitemVO vo);
			
	// 결제 후 결제한 상품만 장바구니 제거
	int deleteCartList(OrderitemVO vo);
	
	// 결제 후 사용자 포인트 정산
	int updateUserPoint(OrderitemVO vo);
}
