package com.spring.bookdream.service;

import java.util.List;

import com.spring.bookdream.vo.OrderVO;
import com.spring.bookdream.vo.SearchCriteria;

public interface OrderService {
	
	// payDB -> OrderDB 등록
	void insertOrder(OrderVO vo);
	
	// 주문 조회
	List<OrderVO> searchOrder(SearchCriteria cir);
	
	// 결제 취소
	void cencelOrder(OrderVO vo);

	// 도서 재고 반환
	int updateBookStock(OrderVO vo);
	
	// 사용, 적립 포인트 반환
	int updateUserPoint(OrderVO vo);
	
	// 배송상태 업데이트
	void trackingUpdate(OrderVO vo);
	
	// 마이페이지 주문개수 확인
	OrderVO orderCount(OrderVO vo);

}
