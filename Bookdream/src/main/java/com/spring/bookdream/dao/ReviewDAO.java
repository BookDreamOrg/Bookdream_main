package com.spring.bookdream.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bookdream.vo.ReviewVO;


@Repository
public class ReviewDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 장바구니 목록 조회
	public List<ReviewVO> getReview(int book_no) {
		System.out.println("---> getReviewDAO");
		// selectList : select 조회 SQL문에서 결과값이 여러개의 row가 return될 때 사용
		return mybatis.selectList("ReviewDAO.getReview",book_no);
	}
	
	//리뷰등록
	public void insertReview(ReviewVO vo) {
		System.out.println("---> insertReviewDAO");
		//mybatis의 insert문은 실행한 row(행)을 return 한다. 
		mybatis.insert("ReviewDAO.insertReview",vo);

	}
	
	//리뷰 추천수 업데이트
	public int updateReviewRecommend(int review_no) {
		System.out.println("------> updateReviewDAO");
		return mybatis.update("ReviewDAO.updateReviewRecommend",review_no);
	}
	
	
	
}
