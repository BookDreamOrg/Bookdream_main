package com.spring.bookdream.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bookdream.service.OrderService;
import com.spring.bookdream.vo.OrderVO;


@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;	
	
	@Autowired
	private HttpSession session;	
	
	// 주소등록
	@RequestMapping(value="/update")
	@ResponseBody
	public void cencelOrder(@RequestBody OrderVO order) {
		
		int user_no = (int) session.getAttribute("user_no");		
		order.setUser_no(user_no);
	
	    System.out.println("--->  주문상태 갱신 처리 <---");
		orderService.cencelOrder(order);
		
		// 결제취소, 반품완료 일때만 처리 (반품문의는 안됨)
		if (order.getOrder_status() == 10) {
			
		    System.out.println("---> 사용,적립 포인트 반환 <---");
		    orderService.updateUserPoint(order);
		    
		    System.out.println("---> 도서 재고 반환 <---");
		    orderService.updateBookStock(order);			
		}		

		
	    
	    
	}
	
}
