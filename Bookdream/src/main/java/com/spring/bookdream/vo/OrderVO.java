package com.spring.bookdream.vo;

import java.util.Date;


import lombok.Data;

@Data
public class OrderVO {

	private int order_no;
	private int user_no;
	private int pay_no;
	private String order_name;
	private String order_comment;	
	private Date order_date;
	private String order_receiver;	
	private String order_address;
	private String order_tel;	
	private int order_status;
	
	// 페이징 처리용
	private int status_count;
    private int pageNum;
	private int amount;	
	
	// 마이페이지 조회용
	private int search_date;
	private int search_status;
		
	// JOIN
	private PurchaseVO purchaseVO;
	private BookVO bookVO;
	private PayVO payVO;
	
	// 세션저장용
	private String pay_method;
	private int pay_fee;
	private int final_price;	
	private int total_price;	
	private int discount_price;
	private int save_point;
	private int use_point;
	private int address_no;
		
}
