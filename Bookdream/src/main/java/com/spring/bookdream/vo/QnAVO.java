package com.spring.bookdream.vo;


import java.sql.Date;

import lombok.Data;

@Data
public class QnAVO {
	private int qna_no;
	private int user_no;
	private String qna_title;
	private String qna_content;
	private String qna_type;
	private Date reg_date;
	private String ans_check;
	
}
