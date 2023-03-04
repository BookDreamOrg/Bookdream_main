package com.spring.bookdream.vo;

import java.util.Date;
import java.util.List;
import java.util.Map;

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

	private List<Map<String, Object>> list;	
	private Map<String, Object> cnt;
	private PageVO page;	
}
