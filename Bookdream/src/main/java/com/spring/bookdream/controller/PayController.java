package com.spring.bookdream.controller;

import java.io.IOException;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.spring.bookdream.service.OrderService;
import com.spring.bookdream.service.OrderitemService;
import com.spring.bookdream.service.PayService;
import com.spring.bookdream.service.PurchaseService;

import com.spring.bookdream.vo.OrderVO;
import com.spring.bookdream.vo.OrderitemVO;
import com.spring.bookdream.vo.PayVO;
import com.spring.bookdream.vo.PurchaseVO;

@Controller
@RequestMapping("/detail/cart/orderitem")
public class PayController {
	
	@Autowired
	private PayService payService;
	
	@Autowired
	private OrderService orderService;		

	@Autowired
	private OrderitemService orderitemService;

	@Autowired
	private PurchaseService PurchaseService;		
	
	// 결제 후 처리
	@RequestMapping(value="/pay")
	public String insertPay(@SessionAttribute("order") OrderVO order, PayVO pay, OrderitemVO orderitem, PurchaseVO purchase, HttpServletRequest request, Model model) throws IOException, InterruptedException {
		
		// 결제정보 값을 url에서 추출
		String paymentKey = request.getParameter("paymentKey");
		String amount = request.getParameter("amount");
		String orderId = request.getParameter("orderId");
		
		// Tosspay 결제정보 인증 -> json으로 받아옴
		HttpRequest result = HttpRequest.newBuilder()
			    .uri(URI.create("https://api.tosspayments.com/v1/payments/confirm"))
			    .header("Authorization", "Basic dGVzdF9za19CRTkyTEFhNVBWYlJnZ1hsTTBwVjdZbXBYeUpqOg==")
			    .header("Content-Type", "application/json")
			    .method("POST", HttpRequest.BodyPublishers.ofString("{\"paymentKey\":\"" + paymentKey + "\",\"" + "amount" + "\":" + amount + "," + "\"" + "orderId\":" + "\"" + orderId + "\"" + "}"))
			    .build();
			HttpResponse<String> response = HttpClient.newHttpClient().send(result, HttpResponse.BodyHandlers.ofString());

		// 받은 json data 사용하지는 않음
		System.out.println("---> 토스페이를 사용해서 결제가 성공하였습니다. <---");
		System.out.println(response.body());		

//		json 파싱 --> 세션으로 처리해서 필요없음
//		String jsonString = response.body();
//	   	System.out.println("---> TossPay로 받은 Json 추출...<---");	
//	    JSONObject jObject = new JSONObject(jsonString);  
//	    int final_price = jObject.getInt("totalAmount");
//	    String pay_method = jObject.getString("method");
//	    String order_Name = jObject.getString("orderName");		
			
		// 세션 호출 - 결제 후 DB에 넣는 목적
		String pay_method = order.getPay_method();
		int discount_price = order.getDiscount_price();
		int final_price = order.getTotal_price();
		int save_point = order.getSave_point();
		
		pay.setPay_method(pay_method);
		pay.setDiscount_price(discount_price);
		pay.setFinal_price(final_price);
		pay.setSave_point(save_point);
		
	    System.out.println("---> 결제 DB 등록 <---");
	    payService.insertPay(pay);		
			    
	    System.out.println("---> 주문 DB 등록 <---");
	    orderService.insertOrder(order);			
		
	    // order_no -> 주문상세보기 DB 등록
	    OrderVO order_no = orderService.searchOrderNo(order);
	    purchase.setOrder_no(order_no.getOrder_no());
	    
	    System.out.println("---> 주문상세보기 DB 등록 <---");
	    PurchaseService.insertPurchase(purchase);
	    
	    System.out.println("---> 구입한 개수만큼 재고차감 <---");
	    orderitemService.updateBookStock(orderitem);
	    
	    // 장바구니에서 필터하는 기능이 없어서 지금은 전부다 제거됨 
	    System.out.println("---> 구입한 상품만 장바구니 제거 <---");
	    orderitemService.deleteCartList(orderitem);
	    
	    return "redirect:/detail/cart/orderitem/success";
	}		
	
		// 새로고침 DB중복 방지
		@RequestMapping(value="/success")
		public String success() {
			
			return "main/success";
			
		}
}
