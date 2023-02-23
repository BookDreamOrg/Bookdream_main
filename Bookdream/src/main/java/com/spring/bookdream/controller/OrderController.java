package com.spring.bookdream.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bookdream.service.DeliveryService;
import com.spring.bookdream.service.OrderService;
import com.spring.bookdream.service.PurchaseService;
import com.spring.bookdream.vo.DeliveryVO;
import com.spring.bookdream.vo.OrderVO;
import com.spring.bookdream.vo.PageVO;
import com.spring.bookdream.vo.PurchaseVO;
import com.spring.bookdream.vo.SearchCriteria;


@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;	
	
	@Autowired
	private PurchaseService purchaseService;	
	
	@Autowired
	private DeliveryService deliveryService;	
		
	@Autowired
	private HttpSession session;	
	
	// 배송상태 갱신
	@RequestMapping(value="/update")
	@ResponseBody
	public void cencelOrder(@RequestBody OrderVO order ) {
		
		int user_no = (int) session.getAttribute("user_no");		
		order.setUser_no(user_no);
				
	    System.out.println("--->  배송상태 갱신 처리 <---");
		orderService.cancelOrder(order);
	    
	}
	
	// 마이페이지 주문 목록
	@RequestMapping(value="/orderList")
	@ResponseBody	
	public OrderVO searchOrder(@RequestParam("pageNum")  int pageNum, 
							   @RequestParam("order_status") int orderStatus, 
							   @RequestParam("srchStrDate")  String srchStrDate, 
							   @RequestParam("srchEndDate") String srchEndDate,
			  				   OrderVO order,
							   SearchCriteria cri, 
			  				   DeliveryVO delivery, Model model) {
	
		int user_no = (int) session.getAttribute("user_no");
		order.setUser_no(user_no);
		
		// 배송중 -> 배송완료 갱신
		deliveryService.cmpltDelivery(delivery);
		
		order.setPageNum(pageNum);
		order.setAmount(3);
		
		order.setOrder_status(orderStatus);

		cri.setPageNum(pageNum);		
		cri.setAmount(3);			
		
		// 주문총개수
		int cnt = orderService.searchOrderCount(order);
		
		// 주문목록
		List<Map<String, Object>> list  = orderService.searchOrder(order);

		// 페이징
		// 표시 개수
		PageVO pageMaker = new PageVO(cri, cnt);
		
		OrderVO result = new OrderVO();
		result.setPage(pageMaker);
		result.setList(list);	
		result.setCnt(cnt);	
		
		return result;			

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
	public List<Map<String, Object>> getPurchaseList(@RequestBody PurchaseVO purchase) {
		
		int user_no = (int) session.getAttribute("user_no");
		purchase.setUser_no(user_no);
				
		List<Map<String, Object>> list  = purchaseService.getPurchaseList(purchase);
		
		return list;
	}
	
}
