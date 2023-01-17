package com.spring.bookdream.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.BookVO;


@Repository
public class BookDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 장바구니 목록 조회
	public List<BookVO> getBookList(BookVO vo) {
		
		System.out.println("---> JDBC로 BookList() 처리");
	 
		// selectList : select 조회 SQL문에서 결과값이 여러개의 row가 return될 때 사용
		return mybatis.selectList("BookDAO.getBookList", vo);
	}
	
	public BookVO getBook(int book_no) {
		
		System.out.println("---> getBook() 처리");
	
		// selectList : select 조회 SQL문에서 결과값이 여러개의 row가 return될 때 사용
		return mybatis.selectOne("BookDAO.getBook", book_no);
	}
	
	
}