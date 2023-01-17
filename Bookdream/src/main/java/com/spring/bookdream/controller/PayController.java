package com.spring.bookdream.controller;


import java.io.IOException;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bookdream.service.OrderService;
import com.spring.bookdream.service.PayService;
import com.spring.bookdream.vo.OrderVO;
import com.spring.bookdream.vo.PayVO;


@Controller
@RequestMapping("/cart/orderitem")
public class PayController {
	
	
	@Autowired
	private PayService payService;
	
	@Autowired
	private OrderService orderService;	
	
	@RequestMapping(value="/success")
	public String insertPay(HttpServletRequest request, Model model, PayVO vo, OrderVO ovo) throws IOException, InterruptedException {

    	HttpSession session = request.getSession();	

		// 결제정보 값을 url에서 추출
		String paymentKey = request.getParameter("paymentKey");
		String amount = request.getParameter("amount");
		String orderId = request.getParameter("orderId");
		
		// Tosspay 결제정보 인증 -> json으로 받아옴
		HttpRequest request1 = HttpRequest.newBuilder()
			    .uri(URI.create("https://api.tosspayments.com/v1/payments/confirm"))
			    .header("Authorization", "Basic dGVzdF9za19CRTkyTEFhNVBWYlJnZ1hsTTBwVjdZbXBYeUpqOg==")
			    .header("Content-Type", "application/json")
			    .method("POST", HttpRequest.BodyPublishers.ofString("{\"paymentKey\":\"" + paymentKey + "\",\"" + "amount" + "\":" + amount + "," + "\"" + "orderId\":" + "\"" + orderId + "\"" + "}"))
			    .build();
			HttpResponse<String> response = HttpClient.newHttpClient().send(request1, HttpResponse.BodyHandlers.ofString());

		   	System.out.println("---> 토스 API를 이용한 결제 성공 - JSON 데이터 확인 <---");
			System.out.println(response.body());		

		// json 값 파싱	
			
		String jsonString = response.body();
		
	   	System.out.println("---> TossPay로 받은 Json 추출...<---");
	   	
	    JSONObject jObject = new JSONObject(jsonString);
	    
	    int final_price = jObject.getInt("totalAmount");
	    String pay_method = jObject.getString("method");
	    String order_Name = jObject.getString("orderName");

	    int save_point = (int) session.getAttribute("save_point");
	    int discount_price = (int) session.getAttribute("discount_price");
	    
	    String order_comment = (String) session.getAttribute("order_comment");
	    String order_receiver = (String) session.getAttribute("order_receiver");
	    String order_address = (String) session.getAttribute("order_address");
	    String order_tel = (String) session.getAttribute("order_tel");
	    int order_fee = (int) session.getAttribute("order_fee");
	    
	    System.out.println("final_price[최종금액] : " + final_price);
	    System.out.println("pay_method[결제방법] : " + pay_method);
	    System.out.println("order_Name[주문이름] : " + order_Name);
	    
//	    String order_receiver = jObject.getString("customerName");
	    
// 		order에서 사용할 session...
//	    session.setAttribute("total_price", final_price);

	    // PayVO insert
    	vo.setFinal_price(final_price);  
    	vo.setPay_method(pay_method);
//      vo.setOrder_receiver(order_receiver);
	    vo.setSave_point(save_point);
	    vo.setDiscount_price(discount_price);
	    
	    // orderVO	 insert
    	ovo.setTotal_price(final_price); 
    	ovo.setOrder_name(order_Name);
	    ovo.setOrder_comment(order_comment);
	    ovo.setOrder_receiver(order_receiver);
	    ovo.setOrder_address(order_address);	    
	    ovo.setOrder_tel(order_tel);
	    ovo.setOrder_fee(order_fee);
	   
	    System.out.println("---> Controller insertPay 실행 <---");
	    payService.insertPay(vo);
	    
	    
	    System.out.println("---> Controller insertorder 실행 <---");
	    orderService.insertOrder(ovo);
	    
	    //Model
	    model.addAttribute("order_name", order_Name);
	    model.addAttribute("pay_method", pay_method);
	    model.addAttribute("final_price", final_price);
	    model.addAttribute("order_receiver", order_receiver);
	    model.addAttribute("order_address", order_address);
	    model.addAttribute("order_tel", order_tel);
	    
	    
	    // order로 이동해서 DB 저장....작업....
//		return "redirect:/cart/purchase/success"; 	    	
		return "/success"; 	
						
		
	}	
	

    @RequestMapping(value="/save")
    @ResponseBody
    public void test(@RequestParam Map<String, Object> map, PayVO vo, HttpServletRequest request) {
    	
    	System.out.println("---> 배송 정보를 Session 저장 <---");
    	
    	// json 값 추출
    	String save_point_int = (String)map.get("save_point");
    	String discount_price_int = (String)map.get("discount_price");
    	String order_fee_int = (String)map.get("order_fee");

    	int save_point = Integer.parseInt(save_point_int);
    	int discount_price = Integer.parseInt(discount_price_int);
    	int order_fee = Integer.parseInt(order_fee_int);
    	String order_comment = (String)map.get("order_comment");
    	String order_receiver = (String)map.get("order_receiver");
    	String order_address = (String)map.get("order_address");
    	String order_tel = (String)map.get("order_tel");
    

    	// session 저장
    	HttpSession session = request.getSession();	
    	
    	session.setAttribute("save_point", save_point);
    	session.setAttribute("discount_price", discount_price);   	
    	session.setAttribute("order_fee", order_fee);   	
    	session.setAttribute("order_comment", order_comment);   	
    	session.setAttribute("order_receiver", order_receiver);   	
    	session.setAttribute("order_address", order_address);   	
    	session.setAttribute("order_tel", order_tel);   	
    	
    	// session 출력
    	System.out.println("save_point[적립금] : " + save_point);
    	System.out.println("discount_price[할인금액] : " + discount_price);
    	System.out.println("order_fee[배송비] : " + order_fee);
    	System.out.println("order_comment[요청사항] : " + order_comment);
    	System.out.println("order_receiver[받는사람] : " + order_receiver);
    	System.out.println("order_address[주소] : " + order_address);
    	System.out.println("order_tel[전화번호] : " + order_tel);


//      return "/save";


    }
}
