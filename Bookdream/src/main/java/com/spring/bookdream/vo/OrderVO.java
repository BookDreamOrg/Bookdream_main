package com.spring.bookdream.vo;

import java.util.Date;
import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class OrderVO {

	// DB
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
	
	// 관리자 확인
	private String admin;	
	
	// 페이징
    private int pageNum;
	private int amount;	
	private String srchCrtr;
	private String srchKey;	
	private String srchStrDate;
	private String srchEndDate;
	
	// 페이징버튼
	private List<Map<String, Object>> list;
	private PageVO page;
	private int cnt;

		
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
