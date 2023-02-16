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
		public List<BookVO> AdmingetBookList(BookVO vo) {
		
		System.out.println("---> JDBC로 BookList() 처리-----");
	 
		// selectList : select 조회 SQL문에서 결과값이 여러개의 row가 return될 때 사용
		return mybatis.selectList("BookDAO.adminBookList", vo);
		}
	
		//한 권의 도서 상품 조회
		public BookVO getBook(int book_no) {
		
		System.out.println("---> getBook() 처리");
	
		// selectList : select 조회 SQL문에서 결과값이 여러개의 row가 return될 때 사용
		return mybatis.selectOne("BookDAO.getBook", book_no);
		}
	
		//키워드 조회
		public List<BookVO> getBookList(String keyword) {
		
		System.out.println("---> JDBC로 BookList() 처리");
	 
		// selectList : select 조회 SQL문에서 결과값이 여러개의 row가 return될 때 사용
		return mybatis.selectList("BookDAO.getBookKeyword", keyword);
		}
	
		//베스트 셀러 상위 5개 상품 조회
		public List<BookVO> bestSeller(){
			System.out.println("---> JDBC로 bestSeller() 처리");
			return mybatis.selectList("BookDAO.bestSeller");
		}
	
		//리뷰가 많이 등록된 상위5개 상품 조회
		public List<BookVO> bestSellerByReviewCount(){
			System.out.println("---> JDBC로 bestSellerByReviewCount() 처리");
			return mybatis.selectList("BookDAO.bestSellerByReviewCount");
		}
		
		//평균리뷰가 높은 상위 5개 상품 조회
		public List<BookVO> bestSellerByReviewGrade(){
			System.out.println("---> JDBC로 bestSellerByReviewGrade() 처리");
			return mybatis.selectList("BookDAO.bestSellerByReviewGrade");
		}
		
		//[어드민] 도서 재고 추가
		public void updateBookStock	(BookVO vo) {
			System.out.println("---> JDBC로 updateBookStock() 처리");
			mybatis.update("BookDAO.updateBookStock",vo);
		}
		
	
	
	
}