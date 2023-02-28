package com.spring.bookdream.service;

import java.util.Map;

import com.spring.bookdream.vo.DeliveryVO;

public interface DeliveryService {

	// 배송DB 생성
	void insertDelivery(DeliveryVO delivery);
	
	// 송장번호, 택배사 등록 (결제완료 -> 배송중)
	void updateDelivery(DeliveryVO delivery);
	
	// 배송중 -> 배송완료
	void cmpltDelivery(DeliveryVO delivery);
	
	// 배송조회
	Map<String, Object> getDelivery(DeliveryVO delivery);
}
