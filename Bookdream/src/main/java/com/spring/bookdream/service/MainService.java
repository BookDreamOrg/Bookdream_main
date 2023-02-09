package com.spring.bookdream.service;

import java.util.List;

import com.spring.bookdream.vo.BookVO;

public interface MainService {

	//가장 많이 팔린 도서 상품 5개 조회
	List<BookVO> bestSeller();
	
	//리뷰가 가장 많이 달린 도서 5개 조회
	List<BookVO> bestSellerByReviewCount();
	
	//리뷰 평점이 가장 높은 도서 5개 조회
	List<BookVO> bestSellerByReviewGrade();
}
