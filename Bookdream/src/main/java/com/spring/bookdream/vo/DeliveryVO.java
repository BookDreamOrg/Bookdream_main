package com.spring.bookdream.vo;

import java.util.Date;

import lombok.Data;

@Data
public class DeliveryVO {

	private int delivery_no;
	private int order_no;
	private long invoice_no;
	private String courier;
	private Date start_date;
	private Date cmplt_date;	
	
}
