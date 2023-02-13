package com.spring.bookdream.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bookdream.service.OrderService;
import com.spring.bookdream.vo.OrderVO;



@Controller
@RequestMapping("/admin")
public class admin_OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/order")
	@ResponseBody
	public List<Map<String, Object>> orderDateList(OrderVO order) {
		
		List<Map<String, Object>> dt = orderService.orderDateCount(order);
		List<Map<String, Object>> cdt = orderService.orderCancelDateCount(order);
		
		Map<String, Object> dateCount = new HashMap<>(); 
		
		for(int i=0; i<dt.size(); i++) {
			
			dateCount.put("CNT", dt);
			dateCount.put("CNT2", cdt);
			System.out.println(dateCount);
		}
			
//		for(Map<String, Object> dateCount : dt){
//
//		   System.out.print(dateCount.get("ORDER_DATE") + " ");
//		   System.out.print(dateCount.get("CNT") + " ");
//		   System.out.println(cdt.get("CNT2"+ " "));
//		   
//		   dateCount.put("CNT2", cdt);
//		   System.out.println(dateCount);
//		}
		

		return dt;
		
		}
	
}
