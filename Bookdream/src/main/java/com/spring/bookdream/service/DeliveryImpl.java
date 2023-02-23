package com.spring.bookdream.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.DeliveryDAO;
import com.spring.bookdream.dao.OrderDAO;
import com.spring.bookdream.vo.DeliveryVO;

@Service("DeliveryService")
public class DeliveryImpl implements DeliveryService {
	
	@Autowired
	private DeliveryDAO deliveryDAO;
	
	@Override
	public void insertDelivery(DeliveryVO vo) {
		
		deliveryDAO.insertDelivery(vo);		
		
	}

	@Override
	public void updateDelivery(DeliveryVO vo) {
		deliveryDAO.updateDelivery(vo);
		
	}

	@Override
	public void cmpltDelivery(DeliveryVO vo) {
		deliveryDAO.cmpltDelivery(vo);		
		
	}
	
	


	
	

}
