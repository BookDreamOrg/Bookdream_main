package com.spring.bookdream.dao;

import java.util.List;
import java.util.Map;

import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionManager;
import org.json.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.spring.bookdream.service.ReviewService;
import com.spring.bookdream.vo.ReviewVO;
import com.spring.bookdream.vo.UserVO;


@Repository
public class ReviewDAO {
	
	public ReviewDAO() {

	}

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	@Autowired
	private HttpSession session;
	

	// 장바구니 목록 조회
	public List<ReviewVO> getReview(int book_no) {
		System.out.println("---> getReviewDAO");
		// selectList : select 조회 SQL문에서 결과값이 여러개의 row가 return될 때 사용
		return mybatis.selectList("ReviewDAO.getReview",book_no);
	}
	

	
	public void insertReview(ReviewVO vo) {
		System.out.println("---> insertReviewDAO");
//		vo.setUser_id((String)session.getAttribute("user_id"));
		
//		return mybatis.insertReview("ReviewDAO.insertReview",map);
		mybatis.insert("ReviewDAO.insertReview",vo);
	}
	
	//리뷰 추천수 업데이트
	public int updateReviewRecommend(int review_no) {
		System.out.println("------> updateReviewDAO");
		return mybatis.update("ReviewDAO.updateReviewRecommend",review_no);
	}
	
	
	
}
