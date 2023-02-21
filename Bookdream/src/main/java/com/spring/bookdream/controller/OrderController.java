package com.spring.bookdream.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.spring.bookdream.service.OrderService;
import com.spring.bookdream.service.PurchaseService;
import com.spring.bookdream.vo.OrderVO;
import com.spring.bookdream.vo.PurchaseVO;


@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;	
	
	@Autowired
	private PurchaseService purchaseService;	
	
	@Autowired
	private HttpSession session;	
	
	// 배송상태 갱신
	@RequestMapping(value="/update")
	@ResponseBody
	public OrderVO cencelOrder(@RequestBody OrderVO order ) {
		
		int user_no = (int) session.getAttribute("user_no");		
		order.setUser_no(user_no);
		
		// 세션호출
		int search_date = (int) session.getAttribute("search_date");
		int search_status = (int) session.getAttribute("search_status");
		order.setSearch_date(search_date);
		order.setSearch_status(search_status);
		
		// 세션종료
	    session.removeAttribute("search_date");
	    session.removeAttribute("search_status");
		
	    System.out.println("--->  배송상태 갱신 처리 <---");
		orderService.cancelOrder(order);
		
		return order;		
	    
	}
	
	// 반품, 결제취소 등 배송상태 변경
	@RequestMapping(value="/orderList")
	@ResponseBody	
	public List<OrderVO> searchOrder(@RequestBody OrderVO order, Model model) {
	
		int user_no = (int) session.getAttribute("user_no");
		order.setUser_no(user_no);
	
		// 배송상태 업데이트
		// 결제 1일뒤 = 배송중, 2일뒤 = 배송완료 (보류.)
		// orderService.trackingUpdate(order);
		
		// 세션등록
		// 결제취소, 반품등 변화가 생겨도 조회상태 유지함
		session.setAttribute("search_date", order.getSearch_date());
		session.setAttribute("search_status", order.getSearch_status());

		// 조회결과	
		List<OrderVO> list  = orderService.searchOrder(order);
		
		return list;
	}

	// 주문내역 카운트
	@RequestMapping(value="/orderHistory") 
	@ResponseBody
	public List<Map<String, Object>> orderHistory(OrderVO order) {
		
		int user_no = (int) session.getAttribute("user_no");
		order.setUser_no(user_no);
		
		order.setAdmin("user");
		
		List<Map<String, Object>> list  = orderService.orderStatusCount(order);

		return list;
	}	
	
	// 주문상세 모달 (상세)
	@RequestMapping(value="/orderDetail")
	@ResponseBody	
	public List<PurchaseVO> getPurchaseList(@RequestBody PurchaseVO purchase) {
		
		int user_no = (int) session.getAttribute("user_no");
		purchase.setUser_no(user_no);
				
		List<PurchaseVO> list  = purchaseService.getPurchaseList(purchase);
		
		return list;
	}
	
}
