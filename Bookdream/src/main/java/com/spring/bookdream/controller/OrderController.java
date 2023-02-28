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

import com.spring.bookdream.service.DeliveryService;
import com.spring.bookdream.service.OrderService;
import com.spring.bookdream.service.PurchaseService;
import com.spring.bookdream.service.UserService;
import com.spring.bookdream.vo.DeliveryVO;
import com.spring.bookdream.vo.OrderVO;
import com.spring.bookdream.vo.PageVO;
import com.spring.bookdream.vo.PurchaseVO;
import com.spring.bookdream.vo.SearchCriteria;
import com.spring.bookdream.vo.UserVO;


@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private UserService userService;
	
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
	public void cencelOrder(@RequestBody OrderVO order, UserVO user) {
		
		int user_no = (int) session.getAttribute("user_no");		
		order.setUser_no(user_no);
		user.setUser_no(user_no);
				
	    System.out.println("--->  배송상태 갱신 처리 <---");
		orderService.updateOrderStatus(order);
		
		if (order.getOrder_status() == 3) {
		    System.out.println("--->  구매확정 포인트 적립 <---");			
			userService.pointEarned(user);
		}
	    
	}
	
	// 마이페이지 주문 목록
	@RequestMapping(value="/orderList")
	@ResponseBody	
	public OrderVO searchOrder(SearchCriteria cri, DeliveryVO delivery, PageVO page, Model model) {
		
		int user_no = (int) session.getAttribute("user_no");
		
		// 조회할 사용자
		cri.setUser_no(user_no);
		
		// 한 페이지에 표시될 개수
		cri.setAmount(3);	
		
		// 페이지블럭 개수
		int pageBlcok = 3;
		
		System.out.println("몇개니 : " + page.getDisplayPageItems());
		// 배송중 -> 배송완료 갱신
		deliveryService.cmpltDelivery(delivery);
				
		// 주문총개수
		int cnt = orderService.searchOrderCount(cri);
		
		// 주문목록
		List<Map<String, Object>> list  = orderService.searchOrder(cri);

		// 페이징
		PageVO pageMaker = new PageVO(cri, cnt, pageBlcok);
		
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
