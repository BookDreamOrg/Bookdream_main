package com.spring.bookdream.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BookVO {
	
	private int book_no;
	private String isbn_no;
	private String title;
	private String author;
	private String publisher;
	private String book_content;
	private int stock;
	private int book_price;
	private String book_img;
	private Date pblic_date;
	private String book_category;
	private int discount;
	
	
}
