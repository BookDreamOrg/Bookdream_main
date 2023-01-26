package com.spring.bookdream.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {

	private int order_no;
	private int user_no;
	private int pay_no;
	private int total_price;
	private String pay_method;
	private String order_name;
	private String order_comment;	
	private Date order_enroll;
	private String order_receiver;	
	private String order_address;
	private String order_tel;	
	private int order_fee;
	
	// DB에는 없음 데이터전송용
	private int discount_price;
	private int save_point;
	
}
