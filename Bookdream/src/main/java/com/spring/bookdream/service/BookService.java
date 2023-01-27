package com.spring.bookdream.service;

import java.util.List;
import com.spring.bookdream.vo.BookVO;


public interface BookService {

	// 책 조회
	List<BookVO> getBookList(BookVO vo);
	
	//책 하나 조회
	BookVO getBook(int book_no);
	
	// 책 검색어 조회
	List<BookVO> getBookList(String keyword);
	

	
}
