package com.spring.bookdream.vo;

import lombok.Data;

@Data
public class PurchaseVO {
	
	private int purchase_no;
	private int user_no;
	private int book_no;
	private int order_no;
	private int product_count;
	
	private UserVO userVO;
	private BookVO bookVO;
	private OrderVO orderVO;


}
