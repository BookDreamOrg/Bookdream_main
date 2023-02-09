package com.spring.bookdream.service;

import java.util.HashMap;
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
	

/*************************** 리뷰 리스트 가져오기  ***************************************/	
	@Override
	public List<ReviewVO> getReview(int book_no) {
		return reviewDAO.getReview(book_no);
	}

/*************************** 리뷰 등록 ***********************************************/
	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
	}

/*************************** 리뷰 추천 (+1) *****************************************/
	@Override
	public int updateReviewRecommend(int review_no) {
		return reviewDAO.updateReviewRecommend(review_no);
	}

/*************************** 리뷰 내용 수정  *****************************************/
	@Override
	public void udpateReview(int review_no, String review_content) {
		ReviewVO vo = new ReviewVO();
		vo.setReview_no(review_no);
		vo.setReview_content(review_content);
		reviewDAO.updateReview(vo);
	}

/*************************** 리뷰 삭제 ********************************************/
	@Override
	public void deleteReview(int review_no) {
		reviewDAO.deleteReview(review_no);
	}

/*************************** 리뷰 존재 여부  ********************************************/	
	@Override
	public int existReview(int book_no, String user_id) {
		ReviewVO vo = new ReviewVO();
		vo.setBook_no(book_no);
		vo.setUser_id(user_id);
		return reviewDAO.existReview(vo);
	}

/*************************** 리뷰 평균 평점  ********************************************/
	@Override
	public double avgReview(int book_no) {
		return reviewDAO.avgReview(book_no);
	}

/*************************** 별점 별 갯수  ********************************************/
	@Override
	public List<HashMap<Integer, Integer>> progressStar(int book_no) {
		return reviewDAO.progressStar(book_no);
	}


}
