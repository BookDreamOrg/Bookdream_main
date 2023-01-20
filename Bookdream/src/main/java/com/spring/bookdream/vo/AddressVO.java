package com.spring.bookdream.vo;

import lombok.Data;

@Data
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
	
	private UserVO userVO;

}
