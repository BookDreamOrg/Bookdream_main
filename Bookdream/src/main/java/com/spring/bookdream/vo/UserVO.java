package com.spring.bookdream.vo;

import lombok.Data;

@Data
public class UserVO {
	private String user_no;
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_address;
	private String user_tel;
	private int user_level;
	private String platform_type;
	private String user_email;  // 도메인 앞부분
	private String user_email2; // @naver.com 도메인
}
