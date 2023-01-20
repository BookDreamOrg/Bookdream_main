package com.spring.bookdream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.ReviewDAO;
import com.spring.bookdream.vo.ReviewVO;



@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public List<ReviewVO> getReview(int book_no) {
		return reviewDAO.getReview(book_no);
	}

	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
		
	}

	@Override
	public int updateReviewRecommend(int review_no) {
		return reviewDAO.updateReviewRecommend(review_no);
	}

}
