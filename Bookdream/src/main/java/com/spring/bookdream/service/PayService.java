package com.spring.bookdream.service;

import com.spring.bookdream.vo.PayVO;

public interface PayService {

	// 주문성공 -> payDB 등록
	void insertPay(PayVO vo);
	
	void updatePay(PayVO vo);

}
