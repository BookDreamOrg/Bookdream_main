package com.spring.bookdream.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/cart/purchase/")
public class OrderController {
	
	
//	@Autowired
//	private OrdersService ordersService;
//	
//	@RequestMapping(value="/test")
//	public String insertPay(HttpServletRequest request, Model model, OrdersVO vo) throws IOException, InterruptedException {
//
//    	HttpSession session = request.getSession();	
//    	
//    	vo.setTotal_price((int) session.getAttribute("total_price"));
//	    vo.setOrder_comment((String) session.getAttribute("order_comment"));
//	    vo.setOrder_receiver((String) session.getAttribute("order_receiver"));
//	    vo.setOrder_address((String) session.getAttribute("order_address"));	    
//	    vo.setOrder_tel((String) session.getAttribute("order_tel"));
//	    vo.setOrder_fee((int) session.getAttribute("order_fee"));
//
//	    System.out.println("---> Controller insertOrders 실행 <---");
//	   
//	    ordersService.insertOrders(vo);
//    	
//
//    	
//		return "/success"; 	
//						
//		
//	}	
	

}
