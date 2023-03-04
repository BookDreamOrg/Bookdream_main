package com.spring.bookdream.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PayVO {

	private int pay_no;
	private String pay_method;
	private Date pay_date;
	private int pay_fee;
	private int discount_price;	
	private int total_price;
	private int final_price;
	private int save_point;	
	private int use_point;
	
	private int user_no;		
}
