package com.spring.bookdream.service;

import com.spring.bookdream.vo.OrderVO;

public interface OrderService {
	
	// payDB -> OrderDB 등록됩니다.
	void insertOrder(OrderVO vo);

	// 마지막 OrderNo 찾기
	OrderVO searchOrderNo(OrderVO vo);
}
