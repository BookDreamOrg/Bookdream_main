package com.spring.bookdream.vo;

public class CartVO {
	
	private int cart_no;
	private String user_no;
	private String book_no;
	private String product_count;
	
	private UserVO userVO;
	private BookVO bookVO;
	

	 
	public BookVO getBookVO() {
		return bookVO;
	}
	public void setBookVO(BookVO bookVO) {
		this.bookVO = bookVO;
	}

	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public String getUser_no() {
		return user_no;
	}
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	public String getBook_no() {
		return book_no;
	}
	public void setBook_no(String book_no) {
		this.book_no = book_no;
	}
	public String getProduct_count() {
		return product_count ;
	}
	public void setProduct_count(String product_count) {
		this.product_count = product_count;
	}
	
	

}
