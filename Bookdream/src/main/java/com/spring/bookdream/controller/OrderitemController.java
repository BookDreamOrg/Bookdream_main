package com.spring.bookdream.controller;

import java.io.PrintWriter;

import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.bookdream.service.OrderitemService;
import com.spring.bookdream.service.PayService;
import com.spring.bookdream.service.UserService;
import com.spring.bookdream.vo.OrderitemVO;
import com.spring.bookdream.vo.PayVO;
import com.spring.bookdream.vo.PurchaseVO;
import com.spring.bookdream.vo.UserVO;

@Controller
@RequestMapping("/detail/cart")
public class OrderitemController {
	
	
	@Autowired
	private OrderitemService orderitemService;
	
	@Autowired
	private PayService payService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private HttpSession session;	
	
	// 장바구니 - > 결제
	@RequestMapping(value="/orderitem")
	public String orderitemList(@RequestParam(value="chBox[]") List<Integer> arrCart, 
								OrderitemVO orderitem, PayVO pay, UserVO user,
								Model model, HttpServletResponse response, PurchaseVO purchase) {
		
		// 로그인해야 진입됨
		if (session.getAttribute("user_no") == null) {
			String msg = "로그인 후 이용해주세요";
			String url ="/views/user/login.jsp";	
		    try {
		        response.setContentType("text/html; charset=utf-8");
		        PrintWriter w = response.getWriter();
		        w.write("<script>alert('"+msg+"');location.href='"+url+"';</script>");
		        w.flush();
		        w.close();
		    } catch(Exception e) {
		        e.printStackTrace();
		    }
					    
		}

		int user_no = (int) session.getAttribute("user_no");		
		orderitem.setUser_no(user_no);
		orderitem.setArrCart(arrCart);		
		pay.setUser_no(user_no);
		user.setUser_no(user_no);
		
		// 카트번호 배열저장
		session.setAttribute("arrCart", arrCart);
		
		session.setAttribute("buy_now", "N");
		
		// (장바구니)주문된 상품 목록 조회
		model.addAttribute("orderitemList", orderitemService.getOrderitemList(orderitem));	

		// 주문된 상품의 개수, 종류, 상품금액 조회
		model.addAttribute("orderitemCount", orderitemService.getOrderitemCount(orderitem));	

		// 사용자 포인트
		model.addAttribute("userPoint", userService.userPoint(user));
		
		// 최근결제수단
		model.addAttribute("lastPayment", payService.lastPayment(pay));

		
		return "itemorder/orderitem";
		
	}
	
	// 바로구매
	@RequestMapping(value="/orderitemBuyNow")
	public String orderitemListBuyNow(OrderitemVO orderitem, PayVO pay, UserVO user, Model model, HttpServletResponse response) { 

		// 로그인해야 진입됨
		if (session.getAttribute("user_no") == null) {
			String msg = "로그인 후 이용해주세요";
			String url ="/views/user/login.jsp";	
		    try {
		        response.setContentType("text/html; charset=utf-8");
		        PrintWriter w = response.getWriter();
		        w.write("<script>alert('"+msg+"');location.href='"+url+"';</script>");
		        w.flush();
		        w.close();
		    } catch(Exception e) {
		        e.printStackTrace();
		    }
					    
		}
		
		// 세션등록
		session.setAttribute("product_count", orderitem.getProduct_count());
		session.setAttribute("book_no", orderitem.getBook_no());
		session.setAttribute("buy_now", orderitem.getBuy_now());		
		
		int user_no = (int) session.getAttribute("user_no");		
		orderitem.setUser_no(user_no);
		pay.setUser_no(user_no);
		user.setUser_no(user_no);		

		Map<String, Object> item = orderitemService.getBuyNow(orderitem);
		
		int price = Integer.parseInt(String.valueOf(item.get("BOOK_PRICE")));	
		
		item.put("PRODCUT_COUNT", orderitem.getProduct_count());
		item.put("TOTAL_COUNT", orderitem.getProduct_count());
		item.put("TOTAL_PRICE", orderitem.getProduct_count() * price);			
		item.put("BUY_NOW", orderitem.getBuy_now());
	
		// (바로구매)주문된 상품 목록 조회		
		model.addAttribute("orderitem", item);
		
		// 주문된 상품의 개수, 종류, 상품금액 조회
		model.addAttribute("orderitemCount", item);		

		// 사용자 포인트
		model.addAttribute("userPoint", userService.userPoint(user));	
		
		// 최근결제수단
		model.addAttribute("lastPayment", payService.lastPayment(pay));		
		
		return "itemorder/orderitem";
	}	
}


