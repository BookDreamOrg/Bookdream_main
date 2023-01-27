package com.spring.bookdream.service;

import java.util.List;

import com.spring.bookdream.vo.OrderitemVO;

public interface OrderitemService {

	// 결제 상품 목록 조회 (장바구니 -> 결제)
	List<OrderitemVO> getOrderitemList(OrderitemVO vo);
	
	// 결제 품목 갯수 조회 (장바구니 -> 결제)
	OrderitemVO getOrderitemCount(OrderitemVO vo);
	
	// 결제 상품 조회 (바로구매 -> 결제)
	OrderitemVO getBuyNow(OrderitemVO vo);
	
	// 사용자 포인트 조회
	OrderitemVO userPoint(OrderitemVO vo);
	
	// 결제 후 재고 처리
	int updateBookStock(OrderitemVO user_no);
	
	// 결제 후 결제한 상품 장바구니 제거
	int deleteCartList(OrderitemVO user_no);
	
	// 사용자의 포인트 결산
	int updateUserPoint(OrderitemVO vo);
}
