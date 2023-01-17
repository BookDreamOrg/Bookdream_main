package com.spring.bookdream.vo;

import java.util.Date;

public class OrderVO {

	private int order_no;
	private int user_no;
	private int pay_no;
	private int total_price;
	private String order_name;
	private String order_comment;	
	private Date order_enroll;
	private String order_receiver;	
	private String order_address;
	private String order_tel;	
	private int order_fee;
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getOrder_comment() {
		return order_comment;
	}
	public void setOrder_comment(String order_comment) {
		this.order_comment = order_comment;
	}
	public Date getOrder_enroll() {
		return order_enroll;
	}
	public void setOrder_enroll(Date order_enroll) {
		this.order_enroll = order_enroll;
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
	public int getOrder_fee() {
		return order_fee;
	}
	public void setOrder_fee(int order_fee) {
		this.order_fee = order_fee;
	}	

	


	
}
