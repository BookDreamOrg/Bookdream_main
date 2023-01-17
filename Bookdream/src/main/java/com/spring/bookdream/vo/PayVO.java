package com.spring.bookdream.vo;

import java.util.Date;

public class PayVO {

	private int pay_no;
	private String pay_method;
	private Date pay_date;
	private int final_price;

	// ajax로 넘기는 데이터
	private int save_point;	
	private int discount_price;	
	private int order_fee;	
	private String order_comment;
	private String order_receiver;
	private String order_address;
	private String order_tel;

	
	public String getOrder_comment() {
		return order_comment;
	}

	public void setOrder_comment(String order_comment) {
		this.order_comment = order_comment;
	}

	public String getOrder_receiver() {
		return order_receiver;
	}

	public void setOrder_receiver(String order_receiver) {
		this.order_receiver = order_receiver;
	}

	public String getOrder_address() {
		return order_address;
	}

	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}

	public String getOrder_tel() {
		return order_tel;
	}

	public void setOrder_tel(String order_tel) {
		this.order_tel = order_tel;
	}


	//////////////////////////////
	
	public int getOrder_fee() {
		return order_fee;
	}

	public void setOrder_fee(int order_fee) {
		this.order_fee = order_fee;
	}

	public int getPay_no() {
		return pay_no;
	}
	
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public int getDiscount_price() {
		return discount_price;
	}
	public void setDiscount_price(int discount_price) {
		this.discount_price = discount_price;
	}
	public int getFinal_price() {
		return final_price;
	}
	public void setFinal_price(int final_price) {
		this.final_price = final_price;
	}
	public int getSave_point() {
		return save_point;
	}
	public void setSave_point(int save_point) {
		this.save_point = save_point;
	}

	
}
