package com.spring.bookdream.service;

import java.util.List;

import com.spring.bookdream.vo.OrderVO;

public interface OrderService {
	
	// payDB -> OrderDB 등록됩니다.
	void insertOrder(OrderVO vo);
	
	// 주문 조회
	List<OrderVO> searchOrder(OrderVO vo);

}
