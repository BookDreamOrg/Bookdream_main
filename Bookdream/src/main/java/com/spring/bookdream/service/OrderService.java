package com.spring.bookdream.service;

import java.util.List;
import java.util.Map;
import com.spring.bookdream.vo.OrderVO;

public interface OrderService {
	
	//************ 사용자 부문************/
	
	// 주문 DB 등록
	void insertOrder(OrderVO vo);
	
	// 마이페이지 주문 조회
	List<Map<String, Object>> searchOrder(OrderVO vo);
	
	// 마이페이지 주문 조회 개수
	int searchOrderCount(OrderVO vo);
	
	// 결제 취소, 반품 신청
	void cancelOrder(OrderVO vo);

	// 사용, 적립 포인트 반환
	int updateUserPoint(OrderVO vo);
	
	// 마이페이지 배송상태 카운터
	List<Map<String, Object>> orderStatusCount(OrderVO vo);	

	// 마이페이지 최근주문 1개 출력
	Map<String, Object> recentOrder(OrderVO vo);

	

	/************ 관리자 부문************/
	
	/*주문 현황*/
	
	// 금주 주문 개수 리스트
	List<Map<String, Object>> orderDateCount(OrderVO vo);

	// 금주 주문 취소/반품 개수 리스트
	List<Map<String, Object>> orderCancelDateCount(OrderVO vo);
	
	// 월간 주문 개수 리스트
	List<Map<String, Object>> orderMlyDateCount(OrderVO vo);

	// 월간 주문 취소/반품 개수 리스트
	List<Map<String, Object>> orderMlyCancelDateCount(OrderVO vo);	
		
	
	/*주문 관리*/
	
	// 결제취소/반품요청 승인
	void orderAprvl(OrderVO vo);

	// 주문 총 관리 리스트
	List<Map<String, Object>> orderMngmn(OrderVO vo);	
	
	// 주문 총 관리 : 개수
	int orderMngmnCount(OrderVO vo);
	
	// 주문 총 관리 세부내역 
	List<Map<String, Object>> orderMngmnDtls(OrderVO vo);		
	
	// 일주일 도서주문 수량 카운트
	List<Map<String, Object>> orderBy7DaysBook();
}
