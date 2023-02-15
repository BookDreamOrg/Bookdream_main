package com.spring.bookdream.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bookdream.service.OrderService;
import com.spring.bookdream.service.PayService;
import com.spring.bookdream.vo.OrderVO;
import com.spring.bookdream.vo.PageVO;
import com.spring.bookdream.vo.PayVO;
import com.spring.bookdream.vo.SearchCriteria;



@Controller
@RequestMapping("/admin")
public class adminOrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private PayService payService;
	

	// 결제현황 페이지 이동
	@RequestMapping(value="/order")
	public String order(OrderVO order, Model model) {

		return "admin/order_mngmn";
		
		}	
	
	@RequestMapping(value="/orderStatusCount")
	@ResponseBody
	public List<Map<String, Object>> orderStatusCount(OrderVO order) {
		
		order.setAdmin("admin");	
		List<Map<String, Object>> cnt = orderService.orderStatusCount(order);
		return cnt;
		
		}	
	
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
	
	// 총 결제 금액
	@RequestMapping(value="/totalPayment")
	@ResponseBody
	public Map<String, Object> totalPaymentAmount(PayVO pay) {
		
		Map<String, Object> tpa = payService.totalPaymentAmount(pay);

		return tpa;
		
		}	
	
	// 금주 취소.반품 처리 테이블
	@RequestMapping(value="/cancelOrderWek")
	@ResponseBody
	public OrderVO cancelOrderWek(@RequestParam("no")int no, OrderVO order, SearchCriteria cri) {
	
		int cnt = orderService.cancelOrderWekCount(order);

		order.setPageNum(no);
		order.setAmount(3);
		cri.setPageNum(no);
		cri.setAmount(3);		
		
		List<Map<String, Object>> tpa = orderService.cancelOrderWek(order);
		
		PageVO pageMaker = new PageVO(cri, cnt);
		
		OrderVO result = new OrderVO();
		result.setPage(pageMaker);
		result.setList(tpa);
		
		return result;
		
		}		
	
	// 총 결제 금액
	@RequestMapping(value="/orderAprvl")
	@ResponseBody
	public void orderAprvl(@RequestBody OrderVO order) {
		
		System.out.println("---> 결제취소/반품 승인 <---");
		orderService.orderAprvl(order);
		
		System.out.println("---> 사용,적립 포인트 반환 <---");
		orderService.updateUserPoint(order);
		    
		System.out.println("---> 도서 재고 반환 <---");
		orderService.updateBookStock(order);			
		
		}		
		
}
