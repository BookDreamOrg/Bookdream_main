package com.spring.bookdream.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;

import com.spring.bookdream.dao.CartDAO;
import com.spring.bookdream.service.CartService;
import com.spring.bookdream.vo.CartVO;
import com.spring.bookdream.vo.UserVO;

@Controller
public class CartController {
	
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private HttpSession session;	
	
	@RequestMapping(value="/cart")
	public String cartList(UserVO vo1, CartVO vo, Model model) {
		
			vo1.setUser_no(1);
			vo.setUser_no(vo1.getUser_no());
		
			System.out.println(vo1.getUser_no());

		
		// 장바구니 목록 조회
		System.out.println("---> cartController 장바구니 목록 <---");

		model.addAttribute("cartList", cartService.getCartList(vo));
		return "itemorder/cart";

	}

	@RequestMapping(value="/delete")
	public String cartDelete(CartVO vo, CartDAO cartDAO, Model model) {
		
		// 선택한 장바구니 삭제
		cartService.deleteCart(vo);
		return "redirect:/cart";
	}	
}
