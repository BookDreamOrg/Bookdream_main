package com.spring.bookdream.vo;

import lombok.Data;

@Data
public class PurchaseVO {
	
	private int purchase_no;
	private int user_no;
	private int book_no;
	private int order_no;
	private String order_receiver;
	private int product_count;
	
	private BookVO bookVO;
	private OrderVO orderVO;
	private PayVO payVO;

}
