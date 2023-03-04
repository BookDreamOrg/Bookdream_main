package com.spring.bookdream.service;

import java.util.List;
import com.spring.bookdream.vo.BookVO;
import java.util.ArrayList;



public interface BookService {

	//책 하나 조회
	BookVO getBook(int book_no);
	
	// 책 검색어 조회
	List<BookVO> getBookList(String keyword);
	
	//[페이징]검색한 키워드의 결과 count
	double getBookByKeywordCount (String keyword);
	
	// [어드민] 책 리스트  조회 
	List<BookVO> AdmingetBookList(BookVO vo);
	
	//[어드민] 도서 재고 추가
	void updateBookStock(BookVO vo);
	
	//[어드민] 도서 삭제
	void deleteBook (int book_no);
	
	//[어드민/페이징] 필터링 검색한 결과 count
	double adminBookListCount(BookVO vo);
	
	//[어드민] 도서 등록
	int bookRegister(BookVO vo);
	
	//[어드민/파일업로드] 이미지 이름으로 쓸 도서번호 (pk) 가져오기 max + 1 
	int bookImgUploadFileName(); 
	
	//[어드민/체크박스] 도서 조회
	List<BookVO> checkGetBook(ArrayList<Integer> list);
	
	//[어드민/체크박스] 도서 업데이트
	void chkBookUpd(ArrayList<BookVO> voList);
}
