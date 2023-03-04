package com.spring.bookdream.vo;

import java.util.List;

import lombok.Data;

@Data
public class PurchaseVO {
	
	private int purchase_no;
	private int user_no;
	private int book_no;
	private int order_no;
	private String order_address;
	private int product_count;
	
	// 상품 배열
	private List<Integer> arrCart;

}
