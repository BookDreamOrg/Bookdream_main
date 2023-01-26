package com.spring.bookdream.vo;

import lombok.Data;

@Data
public class CartVO {
	
	private int cart_no;
	private int user_no;
	private int book_no;
	private int product_count;
	
	private UserVO userVO;
	private BookVO bookVO;


}
