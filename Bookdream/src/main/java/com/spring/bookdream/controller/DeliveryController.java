package com.spring.bookdream.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bookdream.service.DeliveryService;
import com.spring.bookdream.vo.DeliveryVO;



@Controller
public class DeliveryController {

	@Autowired
	private DeliveryService deliveryService;
		
	// 배송조회
	@RequestMapping(value="/getDelivery")
	@ResponseBody
	public Map<String, Object> getDelivery(DeliveryVO delivery) {
				
		return deliveryService.getDelivery(delivery);
			
	}	
}


