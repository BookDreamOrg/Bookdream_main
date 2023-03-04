package com.spring.bookdream.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bookdream.service.BookService;
import com.spring.bookdream.service.MainService;
import com.spring.bookdream.service.ReviewService;
import com.spring.bookdream.service.SearchKeywordService;
import com.spring.bookdream.vo.BookVO;
import com.spring.bookdream.vo.ReviewVO;


@Controller
public class BookController {
	
	/*도서 페이징----------------------------------------------------------*/
	final static int PAGE_DIVISION_NUMBER = 10 ; // 한 페이지에 보여줄 컨텐츠 숫자
	final static int PAGE_DEFAULT = 1; //키워드 검색 시 디폴트 페이지
	
	/*리뷰 통계----------------------------------------------------------*/
	final static int REVIEW_STAR_MIN = 1; //리뷰 최소 별점 
	final static int REVIEW_STAR_MAX = 5; //리뷰 최대 별점 
	final static String REVIEW_STAR = "REVIEW_STAR";
	
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
	public String bookList(String keyword, Model model, int num) {
		
		//페이징 처리 전 키워드의 모든 상품리스트
		List<BookVO> all_book_list = bookService.getBookList(keyword);
		
		// Model 정보 저장
		model.addAttribute("search_keyword",keyword);		
		 
		//입력한 키워드 DB 저장
		searchKeywordService.searchingKeyword(keyword);	
		
		//키워드 검색 결과의 결과 값 count
		double pageCNT = bookService.getBookByKeywordCount(keyword);

		//불러온  페이지 안에 들어갈 도서 목록 
		List<BookVO> book = new ArrayList<BookVO>();
		
		//키워드 검색 결과에 따른 한 페이지에 보여줄 페이징 숫자
		int pageLastIndex = (int)Math.ceil(pageCNT/PAGE_DIVISION_NUMBER);
				
		//페이지번호에 따른 상품 리스트
		//페이지가 1일 때와 나머지
		if(num == PAGE_DEFAULT) {
			num = PAGE_DEFAULT;
		}else {
			num=((num-1)*PAGE_DIVISION_NUMBER)+1;
		}
		
		
		
		for( int i = num ; i < num+PAGE_DIVISION_NUMBER ; i ++) {
			if(i<=all_book_list.size()) {
				book.add(all_book_list.get(i-1));
			}else {
				break; 
			}
		}
		
		//조회된 책에 매핑된 리뷰 평균
		Map<String, String> reviewAVG  = new HashMap<String, String>();
		for(int i = 0; i <book.size(); i++) {
			String key = Integer.toString(book.get(i).getBook_no());
			String value = Double.toString( reviewService.avgReview(book.get(i).getBook_no()));
			reviewAVG.put(key,value);
			
		}
		
		model.addAttribute("book", book);// Model 정보 저장
		model.addAttribute("lastIndex", pageLastIndex);
		model.addAttribute("review_star", reviewAVG);
		
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
				String strDate = simpleDateFormat.format(bookService.getBook(book_no).getPblic_date()); 
				model.addAttribute("strdate",strDate);
				
				//review정보 매핑
				model.addAttribute("review",reviewService.getReview(book_no));
				
				//review 평균 별점 매핑
				model.addAttribute("avgStar",reviewService.avgReview(book_no));
			
				
				//review 별점 별 갯수
				//도서 별 리뷰 통계
				Map<Integer, Object> total_star_result = new HashMap<Integer, Object>();
				Map<String, Integer> zero_star = new HashMap<String, Integer>();
				
				//도서 별 리뷰 갯수
				int review_cnt_by_book = reviewService.progressStar(book_no).size();
				
				//별점 별 갯수,퍼센트 계산
				List<HashMap<Integer, Integer>> review_by_cnt_and_percent  = reviewService.progressStar(book_no);
				
				//하나의 도서에 딸린 리뷰의 점수 별 갯수와 비율(퍼센트)
				for(int star = REVIEW_STAR_MIN; star<=REVIEW_STAR_MAX; star++) {
					for(int i=0; i<review_cnt_by_book;i++) {
						//key는 별점(1~5사용)  
						if(star == Integer.parseInt(String.valueOf(review_by_cnt_and_percent.get(i).get(REVIEW_STAR)))) {
							total_star_result.put(star,review_by_cnt_and_percent.get(i));
						}
					}
					// 등록된 별점이 없는 경우 0으로 나타내기 위해서 0값 넣음
					if(total_star_result.get(star) == null) {
						zero_star.put("STARCOUNT",0); //리뷰 갯수
						zero_star.put("REVIEW_STAR",star); //리뷰 별점
						zero_star.put("PROPORTION",0); //리뷰의 등록 비율
						total_star_result.put(star,zero_star);
					}
				}
		
				model.addAttribute("progressStar",total_star_result);
				return "detail/detail";

			}
		
			
			//베스트 셀러 상품 조회
			//리뷰가 많이 등록된 상품 조회
			//평균 리뷰가 높은  상품 조회
			@RequestMapping(value = "/main/main")
			@ResponseBody
			public Map<Integer,List<BookVO>> bestSeller(Model model ) throws Exception{
				System.out.println("bestSeller controller");
				
				Map<Integer,List<BookVO>> mainList= new HashMap<Integer, List<BookVO>>();
				
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
