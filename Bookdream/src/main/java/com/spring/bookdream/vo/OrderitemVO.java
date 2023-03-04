package com.spring.bookdream.vo;

import java.util.List;

import lombok.Data;

@Data
public class OrderitemVO {

	// DB에는 없고 VO만 존재
	private int cart_no;
	private int user_no;
	private int book_no;
	private int pay_no;
	private int product_count;
	
	// 장바구니 / 바로구매 판별
	private String buy_now;
	
	// 장바구니 배열
	private List<Integer> arrCart;


	

	 

	
	

}
