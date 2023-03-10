 package com.spring.bookdream.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;


import com.spring.bookdream.vo.ReviewVO;
import com.spring.bookdream.vo.SearchCriteria;


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
	
	//리뷰 평균 평점
	double avgReview(int book_no);
	
	//리뷰 별점로 별 갯수,퍼센트 계산 결과
	List<HashMap<Integer, Integer>> progressStar(int book_no);
	
	// 내가 작성한 리뷰 
	List<Map<String,Object>> myReview(SearchCriteria cri);
	
	// 내가 작성한 리뷰의 개수, 추천수, 평균 별점
	Map<String, Object> myReviewCount(SearchCriteria cri);
}
