package com.spring.bookdream.service;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.DeliveryDAO;
import com.spring.bookdream.vo.DeliveryVO;

@Service("DeliveryService")
public class DeliveryImpl implements DeliveryService {
	
	@Autowired
	private DeliveryDAO deliveryDAO;
	
	@Override
	public void insertDelivery(DeliveryVO delivery) {
		
		deliveryDAO.insertDelivery(delivery);		
		
	}

	@Override
	public void updateDelivery(DeliveryVO delivery) {
		deliveryDAO.updateDelivery(delivery);
		
	}

	@Override
	public void cmpltDelivery(DeliveryVO delivery) {
		deliveryDAO.cmpltDelivery(delivery);		
		
	}

	// 배송조회
	@Override
	public Map<String, Object> getDelivery(DeliveryVO delivery) {

		return deliveryDAO.getDelivery(delivery);	
	}
	
	


	
	

}
