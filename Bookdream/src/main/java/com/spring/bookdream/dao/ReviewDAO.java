package com.spring.bookdream.dao;

import java.util.HashMap;
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
	

/*************************** 리뷰 리스트 가져오기  ***************************************/
	public List<ReviewVO> getReview(int book_no) {
		System.out.println("---> getReviewDAO");
		// selectList : select 조회 SQL문에서 결과값이 여러개의 row가 return될 때 사용
		return mybatis.selectList("ReviewDAO.getReview",book_no);
	}
	
/*************************** 리뷰 등록 ***********************************************/
	public void insertReview(ReviewVO vo) {
		System.out.println("---> insertReviewDAO");
		mybatis.insert("ReviewDAO.insertReview",vo);
	}
	
/*************************** 리뷰 추천 (+1) *****************************************/
	public int updateReviewRecommend(int review_no) {
		System.out.println("------> updateReviewRecommendDAO");
		return mybatis.update("ReviewDAO.updateReviewRecommend",review_no);
	}
	
/*************************** 리뷰 내용 수정  *****************************************/
	public void updateReview(ReviewVO vo) {
		System.out.println("------> updateReviewDAO");
		mybatis.update("ReviewDAO.updateReview",vo);
	}
	
/*************************** 리뷰 삭제 ********************************************/
	public void deleteReview(int review_no) {
		System.out.println("------> deleteReviewDAO");
		mybatis.delete("ReviewDAO.deleteReview",review_no);
	}
	
/*************************** 리뷰 존재 여부 ********************************************/
	public int existReview(ReviewVO vo) {
		System.out.println("------> existReviewDAO");
		return mybatis.selectOne("ReviewDAO.existReview",vo);
	}

/*************************** 리뷰 평균 평점 ********************************************/
	public double avgReview (int book_no) {
		System.out.println("------> avgReviewDAO");
		return mybatis.selectOne("ReviewDAO.avgReview",book_no);
	}
	
/*************************** 별점 별  갯수와 퍼센트 값 ********************************************/	
	public List<HashMap<Integer, Integer>> progressStar(int book_no){
		return mybatis.selectList("ReviewDAO.progressStar",book_no);
	}
}
