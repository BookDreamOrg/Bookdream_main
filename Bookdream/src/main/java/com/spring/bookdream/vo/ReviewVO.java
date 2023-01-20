package com.spring.bookdream.vo;

import java.util.Date;

public class ReviewVO {
	
	private int review_no;
	private int user_no;
	private int book_no;
	private String review_content;
	private Date review_date;
	private int review_recommend;
	private int review_star;
	
	public ReviewVO() {
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getBook_no() {
		return book_no;
	}

	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	public int getReview_recommend() {
		return review_recommend;
	}

	public void setReview_recommend(int review_recommend) {
		this.review_recommend = review_recommend;
	}

	public int getReview_star() {
		return review_star;
	}

	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}

	@Override
	public String toString() {
		return "ReviewVO [review_no=" + review_no + ", user_no=" + user_no + ", book_no=" + book_no
				+ ", review_content=" + review_content + ", review_date=" + review_date + ", review_recommend="
				+ review_recommend + ", review_star=" + review_star + ", getReview_no()=" + getReview_no()
				+ ", getUser_no()=" + getUser_no() + ", getBook_no()=" + getBook_no() + ", getReview_content()="
				+ getReview_content() + ", getReview_date()=" + getReview_date() + ", getReview_recommend()="
				+ getReview_recommend() + ", getReview_star()=" + getReview_star() + "]";
	}

	
}
