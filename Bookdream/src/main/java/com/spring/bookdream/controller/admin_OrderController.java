package com.spring.bookdream.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bookdream.service.OrderService;
import com.spring.bookdream.service.PayService;
import com.spring.bookdream.vo.OrderVO;
import com.spring.bookdream.vo.PayVO;



@Controller
@RequestMapping("/admin")
public class admin_OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private PayService payService;
	
	// 주간 주문 카운트
	@RequestMapping(value="/wekOrder")
	@ResponseBody
	public List<Map<String, Object>> orderWekDateCount(OrderVO order) {
		
		List<Map<String, Object>> dt = orderService.orderDateCount(order);
		List<Map<String, Object>> cdt = orderService.orderCancelDateCount(order);
		
		dt.addAll(cdt);

		return dt;
		
		}
	
	// 월간 주문 카운트
	@RequestMapping(value="/mlyOrder")
	@ResponseBody
	public List<Map<String, Object>> orderMlyDateCount(OrderVO order) {
		
		List<Map<String, Object>> dt = orderService.orderMlyDateCount(order);
		List<Map<String, Object>> cdt = orderService.orderMlyCancelDateCount(order);

		dt.addAll(cdt);
		
		return dt;
		
		}

	// 주간 결제 금액
	@RequestMapping(value="/wekPay")
	@ResponseBody
	public List<Map<String, Object>> payWekTotalPrice(PayVO pay) {
		
		List<Map<String, Object>> tp = payService.payWekTotalPrice(pay);

		return tp;
		
		}
	
	// 주간 결제 금액
	@RequestMapping(value="/MlyPay")
	@ResponseBody
	public List<Map<String, Object>> payMlyTotalPrice(PayVO pay) {
		
		List<Map<String, Object>> tp = payService.payMlyTotalPrice(pay);

		return tp;
		
		}	
}
