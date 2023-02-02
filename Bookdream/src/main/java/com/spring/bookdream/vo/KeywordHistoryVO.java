package com.spring.bookdream.vo;

import java.util.Date;

import lombok.Data;


@Data
public class KeywordHistoryVO {
	private String user_id; 
	private String keyword;
	private Date search_date;
	private String login_yn;
}
