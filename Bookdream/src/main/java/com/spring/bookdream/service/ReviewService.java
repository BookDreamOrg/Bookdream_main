 package com.spring.bookdream.service;

import java.util.List;

import com.spring.bookdream.vo.ReviewVO;


public interface ReviewService {

	//book_no 하나에 매핑된 Review
	List<ReviewVO> getReview(int book_no);
	
	//리뷰등록
	void insertReview(ReviewVO vo);
	
	//리뷰 추천수 업데이트 
	int updateReviewRecommend(int review_no);
	
	//리뷰 수정
	void udpateReview(int review_no, String review_content);
	
	//리뷰 삭제
	void deleteReview(int review_no);
	
	//등록된 리뷰가 있는지 확인
	int existReview(int book_no,String user_id);
}
