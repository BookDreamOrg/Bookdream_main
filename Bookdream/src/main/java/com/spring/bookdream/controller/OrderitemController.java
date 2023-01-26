package com.spring.bookdream.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.bookdream.dao.OrderitemDAO;
import com.spring.bookdream.service.OrderitemService;
import com.spring.bookdream.vo.AddressVO;
import com.spring.bookdream.vo.OrderitemVO;

@Controller
@RequestMapping("/detail/cart")
public class OrderitemController {
	
	
	@Autowired
	private OrderitemService orderitemService;
	
	@RequestMapping(value="/orderitem")
	public String orderitemList(OrderitemVO vo, OrderitemDAO orderitemDAO, AddressVO avo, Model model) {
			
		// 주문된 상품 목록 조회
		model.addAttribute("orderitemList", orderitemService.getOrderitemList(vo));	
		
		// 주문된 상품의 개수, 종류
		model.addAttribute("orderitemCount", orderitemService.getOrderitemCount(vo));	
		
		return "itemorder/orderitem";
		
	}
	
	
}


