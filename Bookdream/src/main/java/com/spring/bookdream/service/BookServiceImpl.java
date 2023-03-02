package com.spring.bookdream.service;

import java.util.ArrayList;
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
	public List<BookVO> AdmingetBookList(BookVO vo) {
		return bookDAO.AdmingetBookList(vo);
	}

	@Override
	public BookVO getBook(int book_no) {
		return bookDAO.getBook(book_no);
	}

	@Override
	public List<BookVO> getBookList(String keyword) {
		return bookDAO.getBookList(keyword);
	}
	
	//[페이징] 키워드 검색한 데이터의 결과 count
	@Override
	public double getBookByKeywordCount(String keyword) {
		return bookDAO.getBookByKeywordCount(keyword);
	}
	
	@Override
	public void updateBookStock(BookVO vo) {
		bookDAO.updateBookStock(vo);
	}

	@Override
	public void deleteBook(int book_no) {
		bookDAO.deleteBook(book_no);
	}

	//[어드민/페이징]
	@Override
	public double adminBookListCount(BookVO vo) {
		return bookDAO.adminBookListCount(vo);
	}

	
	//[어드민] 도서등록
	@Override
	public int bookRegister(BookVO vo) {
		return bookDAO.bookRegister(vo); //성공 시 1 반환
		
	}

	//[어드민 파일업로드] 이미지 이름으로 사용할 값 가져오기
	@Override
	public int bookImgUploadFileName() {
		return bookDAO.bookImgName();
	}
	
	//[어드민/체크박스] 도서 조회
	@Override
	public List<BookVO> checkGetBook(ArrayList<Integer> list) {
		return bookDAO.checkGetBook(list);
	}

	//[어드민/체크박스] 일괄 업데이트
	@Override
	public void chkBookUpd(ArrayList<BookVO> voList) {
		bookDAO.chkBookUpd(voList);
	}



}
