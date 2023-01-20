package com.spring.bookdream.controller;


import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.bookdream.dao.BookDAO;
import com.spring.bookdream.service.BookService;
import com.spring.bookdream.service.ReviewService;
import com.spring.bookdream.vo.BookVO;
import com.spring.bookdream.vo.ReviewVO;



@Controller
public class BookController {
	
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private ReviewService reviewService;
	
	// 글 목록 검색
	@RequestMapping(value="/bookList")
	public String bookList(BookVO vo, BookDAO bookDAO, Model model) {
		// Model 정보 저장
		model.addAttribute("bookList", bookService.getBookList(vo));	// Model 정보 저장
		return "/book.jsp";
	}

	
	
	// 글 상세 조회
			@RequestMapping(value="/getBook", method = RequestMethod.GET)
			public String getBoard( Model model,ReviewVO vo, @RequestParam("book_no") int book_no) {
				System.out.println("글 상세 조회 처리");
				//book정보 매핑
				model.addAttribute("book", bookService.getBook(book_no));
				
				//출판 날짜 포맷 변경
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String strDate = simpleDateFormat.format(bookService.getBook(book_no).getPublic_date()); 
				model.addAttribute("strdate",strDate);
				
				//review정보 매핑
				model.addAttribute("review",reviewService.getReview(book_no));
				
				
				return "/detail";
			}
}
