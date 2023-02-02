package com.spring.bookdream.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	
	private int review_no;
	private String user_id;
	private int book_no;
	private String review_content;
	private Date review_date;
	private int review_recommend;
	private int review_star;
	
	public ReviewVO() {
		
	}

	
}
