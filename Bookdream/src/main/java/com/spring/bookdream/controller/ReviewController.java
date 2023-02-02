package com.spring.bookdream.controller;



import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.bookdream.service.ReviewService;
import com.spring.bookdream.vo.ReviewVO;


@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService; 
	
/*****************************리뷰 등록******************************/

		@PostMapping("/review")
		@ResponseBody
		public void insertReview(@RequestBody String jsonData, Model model,ObjectMapper mapper, ReviewVO vo) throws Exception {
			System.out.println("/Review+insert");
				
			//JSON을 객체로 변경시 UnknownProperty에 대해서는 무시하고 처리
			mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);

			//ajax에서 가져온 json가져오기
			System.out.println("jsonDATA : " + jsonData);
				
			//json 데이터를 vo에 파싱
			//vo = mapper.readValue(jsonData , ReviewVO.class );
			vo = mapper.readValue(jsonData ,new TypeReference<ReviewVO>(){});
			
			
			reviewService.insertReview(vo);
				
		}
				
			
/*****************************추천버튼 클릭******************************/
		@RequestMapping(value = "/updateReviewRecommend")
		@ResponseBody
		public int updateReviewRecommend(@RequestParam(value = "review_no") int review_no) {
			System.out.println("/updateReviewRecommend : " + review_no);
			return reviewService.updateReviewRecommend(review_no);
		}
		
	
/*****************************[모달]리뷰 내용 수정 ******************************/
		@RequestMapping(value = "/updateReview")
		@ResponseBody
		public void updateReview(@RequestParam(value = "review_no") int review_no, @RequestParam(value = "review_content") String review_content) {
			System.out.println("/updateReview : " + review_no + " 내용 : " + review_content);
			reviewService.udpateReview(review_no, review_content);
		}
 
/*****************************리뷰 삭제 ******************************/
		@RequestMapping(value = "/deleteReview")
		@ResponseBody
		public void deleteReview(@RequestParam(value = "review_no") int review_no) {
			System.out.println("/deleteReview : " + review_no );
			reviewService.deleteReview(review_no);
		}
		
		
/*****************************리뷰 존재 여부 ******************************/		
		@RequestMapping(value = "/existReview")
		@ResponseBody
		public int existReview(int book_no, String user_id) {
			return reviewService.existReview(book_no,user_id);
		}
}
