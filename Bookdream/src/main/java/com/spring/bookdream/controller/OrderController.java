package com.spring.bookdream.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.bookdream.vo.OrderVO;


@Controller
@SessionAttributes("order")
@RequestMapping("/detail/cart/orderitem")
public class OrderController {
	
	// 결제 전 유저정보 세션등록
	@RequestMapping(value="/save")
	@ResponseBody
	public void saveOrder(@RequestBody OrderVO ovo, Model model) {	
		
		
		
		model.addAttribute("order", ovo);

	}
	
}
