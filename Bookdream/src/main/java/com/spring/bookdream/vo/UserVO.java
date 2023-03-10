package com.spring.bookdream.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class UserVO {
	private int user_no;
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_tel;
	private int user_level;
	private String blacklist_yn;
	private String flatform_type;
	private String user_email;  // 도메인 앞부분
	private int user_point;
	private Date user_regdate; // 회원가입 날짜
	
	// 데이터베이스 아닌 부분
	private String user_email2; // @naver.com 부분
	private String searchUserType; // 검색 타입
	private String searchUserKeyword; // 검색어
	
	private int displayPost; 
	private int postNum;
}