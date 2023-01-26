package com.spring.bookdream.vo;

import lombok.Data;

@Data
public class OrderitemVO {

	// DB에는 없고 VO만 존재
	private int cart_no;
	private int user_no;
	private int book_no;
	private int product_count;
	private int total_count;
	private int col_count;
	private String buy_now;
	
	// JOIN TABLE
	private UserVO userVO;
	private BookVO bookVO;
	
	
	

	

	 

	
	

}
