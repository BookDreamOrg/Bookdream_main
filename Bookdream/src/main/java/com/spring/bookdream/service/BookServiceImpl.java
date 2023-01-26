package com.spring.bookdream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.BookDAO;
import com.spring.bookdream.vo.BookVO;



@Service("bookService")
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookDAO bookDAO;

	@Override
	public List<BookVO> getBookList(BookVO vo) {
		
		return bookDAO.getBookList(vo);
	}

	@Override
	public BookVO getBook(int book_no) {
		return bookDAO.getBook(book_no);
	}

	@Override
	public List<BookVO> getBookList(String keyword) {
		return bookDAO.getBookList(keyword);
	}



}
