package com.spring.bookdream.vo;

public class OrderitemVO {

	// DB에는 없고 VO만 존재
	private int cart_no;
	private int user_no;
	private int book_no;
	private int product_count;
	private int total_count;
	private int col_count;
	
	// JOIN TABLE
	private UserVO userVO;
	private BookVO bookVO;
	
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
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
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public int getTotal_count() {
		return total_count;
	}
	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}
	
	public int getCol_count() {
		return col_count;
	}
	public void setCol_count(int col_count) {
		this.col_count = col_count;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	public BookVO getBookVO() {
		return bookVO;
	}
	public void setBookVO(BookVO bookVO) {
		this.bookVO = bookVO;
	}
	
	
	
	

	

	 

	
	

}
