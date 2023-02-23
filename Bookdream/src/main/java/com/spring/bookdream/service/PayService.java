package com.spring.bookdream.service;

import java.util.List;
import java.util.Map;

import com.spring.bookdream.vo.PayVO;

public interface PayService {

	// 주문성공 -> payDB 등록
	void insertPay(PayVO vo);
	
	// 등록된 DB의 PAY_NO 추출
	PayVO searchPay(PayVO vo);

	// 마지막 결제수단 찾기
	Map<String, Object> lastPayment(PayVO vo);
	
	// 주간 결제금액 
	List<Map<String, Object>> payWekTotalPrice(PayVO vo);	
	
	// 월간 결제금액 
	List<Map<String, Object>> payMlyTotalPrice(PayVO vo);	
	
	// 총 결제 금액
	Map<String, Object> totalPaymentAmount(PayVO vo);	
	
	// 결제수단 비율
	Map<String, Object> payMethodRate();
}
