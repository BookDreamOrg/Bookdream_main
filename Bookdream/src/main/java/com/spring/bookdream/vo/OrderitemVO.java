package com.spring.bookdream.vo;

import lombok.Data;

@Data
public class OrderitemVO {

	// DB에는 없고 VO만 존재
	private int cart_no;
	private int user_no;
	private int book_no;
	private int pay_no;
	private int product_count;
	private int total_count;
	private int col_count;
	private int total_price;
	private String buy_now;
	
	// JOIN TABLE
	private UserVO userVO;
	private BookVO bookVO;
	private PayVO pavVO;
	
	
	

	

	 

	
	

}
