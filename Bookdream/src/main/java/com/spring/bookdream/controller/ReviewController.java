package com.spring.bookdream.controller;


import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// 리뷰 등록
		@RequestMapping(value="/insertReview", method = RequestMethod.POST)
		@ResponseBody
		public String insertReview(@RequestBody String jsonData,  ReviewVO vo,  Model model, ObjectMapper mapper) throws Exception {
			System.out.println("/insertReview");

			//JSON을 객체로 변경시 UnknownProperty에 대해서는 무시하고 처리
			mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
	
			//ajax에서 가져온 json가져오기
			System.out.println("jsonDATA : " + jsonData);
			
			//json 데이터를 vo에 파싱
			vo = mapper.readValue(jsonData ,new TypeReference<ReviewVO>(){});
			
			reviewService.insertReview(vo);
			return "/detail";
		}

		//리뷰 추천버튼 클릭
		@RequestMapping(value = "/updateReviewRecommend")
		@ResponseBody
		public int updateReviewRecommend(@RequestParam(value = "review_no") int review_no) {
			System.out.println("/updateReviewRecommend : " + review_no);
			return reviewService.updateReviewRecommend(review_no);
		}
	
}
