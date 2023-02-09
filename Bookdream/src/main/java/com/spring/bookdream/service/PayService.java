package com.spring.bookdream.service;

import com.spring.bookdream.vo.PayVO;

public interface PayService {

	// 주문성공 -> payDB 등록
	void insertPay(PayVO vo);
	
	PayVO searchPay(PayVO vo);

	// 마지막 결제수단 찾기
	PayVO lastPayment(PayVO vo);
	
}
