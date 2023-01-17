package com.spring.bookdream.vo;

public class AddressVO {

	private int rownum;
	private int address_no;
	private int user_no;
	private String address_alias;
	private String address_name;
	private String address_tel;
	private String zone_code;
	private String road_add;
	private String detail_add;
	private String default_add;
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getAddress_no() {
		return address_no;
	}
	public void setAddress_no(int address_no) {
		this.address_no = address_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getAddress_alias() {
		return address_alias;
	}
	public void setAddress_alias(String address_alias) {
		this.address_alias = address_alias;
	}
	public String getAddress_tel() {
		return address_tel;
	}
	public void setAddress_tel(String address_tel) {
		this.address_tel = address_tel;
	}
	public String getAddress_name() {
		return address_name;
	}
	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}
	public String getZone_code() {
		return zone_code;
	}
	public void setZone_code(String zone_code) {
		this.zone_code = zone_code;
	}
	
	public String getRoad_add() {
		return road_add;
	}
	public void setRoad_add(String road_add) {
		this.road_add = road_add;
	}
	public String getDetail_add() {
		return detail_add;
	}
	public void setDetail_add(String detail_add) {
		this.detail_add = detail_add;
	}
	public String getDefault_add() {
		return default_add;
	}
	public void setDefault_add(String default_add) {
		this.default_add = default_add;
	}
	
	
}
