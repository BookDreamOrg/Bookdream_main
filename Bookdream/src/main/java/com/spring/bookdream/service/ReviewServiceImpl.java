package com.spring.bookdream.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.bookdream.dao.ReviewDAO;
import com.spring.bookdream.vo.ReviewVO;
import com.spring.bookdream.vo.UserVO;



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
