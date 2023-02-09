package com.spring.bookdream.vo;

import lombok.Data;

@Data
public class CartVO {
/*
    CART_NO       number(10) NOT NULL,
    USER_NO       number     NOT NULL,
    BOOK_NO       number     NOT NULL,
    PRODUCT_COUNT number(10) NOT NULL , -- 디폴트 1로 지정하기.
 */
	private int cart_no;
	private int user_no;
	private int book_no;
	private int product_count;
	
	private int listCount;
	private int initCount;

	private UserVO userVO;
	private BookVO bookVO;
	

}
