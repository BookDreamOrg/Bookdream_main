package com.spring.bookdream.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
		
		//[페이징]검색한 키워드의 결과 값 count
		public double getBookByKeywordCount(String keyword) {
			return mybatis.selectOne("BookDAO.getBookByKeywordCount",keyword);
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
		
		//[어드민] 도서 삭제
		public void deleteBook (int book_no) {
			System.out.println("---> JDBC로 deleteBook() 처리");
			mybatis.delete("BookDAO.deleteBook",book_no);
		}
		
		//[어드민/페이징]
		public double adminBookListCount(BookVO vo) {
			System.out.println("---> JDBC로 adminBookListCount() 처리");
			return mybatis.selectOne("BookDAO.adminBookListCount", vo);
		}
		
		//[어드민] 도서 등록
		public int bookRegister(BookVO vo) {
			System.out.println("---> JDBC로 bookRegister() 처리");
			return mybatis.insert("BookDAO.bookRegister", vo);
		}
		
		//[어드민/이미지 업로드] 이미지 이름 가져오기
		public int bookImgName() {
			System.out.println("---> JDBC로 bookImgName() 처리");
			return mybatis.selectOne("BookDAO.bookImgName");
		}
		
		//[어드민/체크박스/모달] 체크한 도서 리스트 가져오기
		public List<BookVO> checkGetBook(ArrayList<Integer> list){
			System.out.println("---> JDBC로 checkGetBook() 처리");
			return mybatis.selectList("BookDAO.checkGetBook",list);
		}
		
		//[어드민/모달] checkGetBook()에서 가져온 도서 정보 일괄 업데이트
		public void chkBookUpd(ArrayList<BookVO> voList) {
			System.out.println("---> JDBC로 chkBookUpd() 처리");
			mybatis.update("BookDAO.chkBookUpd", voList);
		}

		// 신간도서 10권
		public List<Map<String, Object>> newBookList() {

			return mybatis.selectList("BookDAO.newBookList");
		}
}