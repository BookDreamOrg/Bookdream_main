package com.spring.bookdream.service;

import com.spring.bookdream.vo.OrderVO;

public interface OrderService {

	// payDB -> OrderDB 등록됩니다.
	void insertOrder(OrderVO vo);

}
