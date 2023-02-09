package com.spring.bookdream.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bookdream.dao.BookDAO;
import com.spring.bookdream.dao.ReviewDAO;
import com.spring.bookdream.service.BookService;
import com.spring.bookdream.service.MainService;
import com.spring.bookdream.service.ReviewService;
import com.spring.bookdream.service.SearchKeywordService;
import com.spring.bookdream.vo.BookVO;
import com.spring.bookdream.vo.ReviewVO;


@Controller
public class BookController {
	
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private SearchKeywordService searchKeywordService;
	
	@Autowired
	private MainService mainService;
	
	// 글 목록 검색
	@RequestMapping(value="/bookListSearchByKeyword")
	public String bookList(String keyword, Model model) {
		// Model 정보 저장
		model.addAttribute("book", bookService.getBookList(keyword));// Model 정보 저장
		model.addAttribute("search_keyword",keyword);		
		searchKeywordService.searchingKeyword(keyword);		
		
		return "booklist/bookListSearchByKeyword"; //조회된 책 뿌리기
	}
	
	// 글 상세 조회
			@GetMapping(value="/getBook")
			public String getBoard( Model model,ReviewVO vo, @RequestParam("book_no") int book_no) {
				System.out.println("글 상세 조회 처리");
				//book정보 매핑
				model.addAttribute("book", bookService.getBook(book_no));
				
				//출판 날짜 포맷 변경
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String strDate = simpleDateFormat.format(bookService.getBook(book_no).getPublic_date()); 
				model.addAttribute("strdate",strDate);
				
				//review정보 매핑
				model.addAttribute("review",reviewService.getReview(book_no));
				
				//review 평균 별점 매핑
				model.addAttribute("avgStar",reviewService.avgReview(book_no));
			
				
				//review 별점 별 갯수
				Map<Integer, Object> map = new HashMap<Integer, Object>();
				Map<String, Integer> newmap = new HashMap<String, Integer>();
				
				for(int i = 1; i<6; i++) {
					for(int j=0; j<reviewService.progressStar(book_no).size();j++) {
						//key는 별점(1~5사용)  
						if(i == Integer.parseInt(String.valueOf(reviewService.progressStar(book_no).get(j).get("REVIEW_STAR")))) {
							map.put(i,reviewService.progressStar(book_no).get(j));
						}
					}
					// 별점이 없는 경우 0으로 나타내기 위해서 0값 넣음
					if(map.get(i) == null) {
						newmap.put("STARCOUNT",0);
						newmap.put("REVIEW_STAR",i);
						newmap.put("PROPORTION",0);
						map.put(i,newmap);
					}
				}
		
				model.addAttribute("progressStar",map);
				return "detail/detail";

			}
		
			
			//베스트 셀러 상품 조회
			//리뷰가 많이 등록된 상품 조회
			//평균 리뷰가 높은  상품 조회
			@RequestMapping(value = "/main/main")
			@ResponseBody
			public Map<Integer,List<BookVO>> bestSeller(Model model){
				System.out.println("bestSeller controller");
				
				Map<Integer,List<BookVO>> mainList = new HashMap<Integer, List<BookVO>>();
				
				List<BookVO> bestSeller = new ArrayList<BookVO>();
				bestSeller = mainService.bestSeller();
				
				List<BookVO> bestSellerByReviewCount = new ArrayList<BookVO>();
				bestSellerByReviewCount = mainService.bestSellerByReviewCount();
				
				List<BookVO> bestSellerByReviewGrade = new ArrayList<BookVO>();
				bestSellerByReviewGrade = mainService.bestSellerByReviewGrade();

				mainList.put(1,bestSeller);
				mainList.put(2,bestSellerByReviewCount);
				mainList.put(3,bestSellerByReviewGrade);
				
				System.out.println("mainList.size() : "+mainList.size());
				
				return mainList;
			}
			
			
}
