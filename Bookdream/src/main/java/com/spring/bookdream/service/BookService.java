package com.spring.bookdream.service;

import java.util.List;
import com.spring.bookdream.vo.BookVO;


public interface BookService {

	//책 하나 조회
	BookVO getBook(int book_no);
	
	// 책 검색어 조회
	List<BookVO> getBookList(String keyword);
	
	// [어드민] 책 리스트  조회 
	List<BookVO> AdmingetBookList(BookVO vo);
	
	//[어드민] 도서 재고 추가
	void updateBookStock(BookVO vo);
	
}
