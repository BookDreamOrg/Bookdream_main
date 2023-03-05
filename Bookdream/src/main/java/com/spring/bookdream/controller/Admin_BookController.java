package com.spring.bookdream.controller;




import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.http.HttpRequest;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.jstl.core.Config;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import org.springframework.format.datetime.joda.LocalDateParser;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.google.common.io.Files;
import com.spring.bookdream.service.BookService;
import com.spring.bookdream.service.OrderService;
import com.spring.bookdream.vo.BookVO;



@Controller
public class Admin_BookController {
	
	
	
	/*[차트]보여줄 날짜----------------------------------------------------------*/
	final static int DAYS7 = 7;
	
	/*[페이징]도서 페이징----------------------------------------------------------*/
	final static int PAGE_DIVISION_NUMBER = 10 ; // 한 페이지에 보여줄 컨텐츠 숫자
	final static int PAGE_DEFAULT = 1; //키워드 검색 시 디폴트 페이지
	
	
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private OrderService orderService;
	
	
	/*[관리자] 페이징 처리용  ------------------------------------------------------------*/
	//선택된 페이지를 포함하여 10개씩 묶으로 보여주는 페이징 처리
	//예시) 1~10, 2~20, 3~30
	public BookVO page(int num, BookVO vo) {
		
		//선택된 페이지
		vo.setIndex(num);
		
		//키워드 검색 결과에 따른 한 페이지에 보여줄 페이징 숫자
		double pageCNT = bookService.adminBookListCount(vo);  // 검색결과 모든 갯수
		int finalIndex = (int)Math.ceil(pageCNT/PAGE_DIVISION_NUMBER); //페이징 처리되는 index의 마지막
		System.out.println("finalIndex" + finalIndex);
		vo.setFinalIndex(finalIndex);
		
		//선택한 페이지에 맞춘 첫 index
		
		int startIndex =  (int)Math.ceil((num-1)/10) * 10 + 1 ;// (num/10)*10 + 1
		 
		vo.setStartIndex(startIndex);
		System.out.println( num + " : startIndex : " +  startIndex);
		
		//선택한 페이지에 맞춘 마지막 index
		int endIndex = startIndex + 9 ;
		if(  finalIndex  <  endIndex  ) {
			endIndex = finalIndex;
		}
		vo.setEndIndex(endIndex);
		return vo;
		
	}

	/*[관리자] 관리용 도서 정보 조회 ------------------------------------------------------------*/
	@GetMapping("/admin_bookList")
	public @ResponseBody List<BookVO> bookList( @RequestParam("num") int num ,BookVO vo, Model model) {
		
		//페이지 가져오기
		BookVO tempBook = new BookVO();
		tempBook = page(num, vo);
		int startIndex = tempBook.getStartIndex();
		int endIndex = tempBook.getEndIndex();
		int finalIndex = tempBook.getFinalIndex();
		int index = tempBook.getIndex();
		
		System.out.println(startIndex + " : " +  endIndex + " : " + finalIndex);
		//모든 리스트
		List<BookVO> all_book_list = bookService.AdmingetBookList(vo);
		
		//불러온  페이지 안에 들어갈 도서 목록 
		List<BookVO> book = new ArrayList<BookVO>();
		
		//페이지번호에 따른 상품 리스트
		//페이지가 1일 때와 나머지
		
		if(num == PAGE_DEFAULT) {
			num = PAGE_DEFAULT;
		}else {
			num=((num-1)*PAGE_DIVISION_NUMBER)+1;
		}
		
		for( int i = num ; i < num+PAGE_DIVISION_NUMBER ; i ++) {
			if(i<=all_book_list.size()) {
				all_book_list.get(i-1).setStartIndex(startIndex);
				all_book_list.get(i-1).setEndIndex(endIndex);
				all_book_list.get(i-1).setFinalIndex(finalIndex);
				all_book_list.get(i-1).setIndex(index);
				book.add(all_book_list.get(i-1));
			}else {
				break; 
			}
		}
		
		System.out.println("book.toString() : "+book.toString());
		
		return book;
	}
	
	/*[관리자] 일주일 도서 판매량 차트 ------------------------------------------------------------*/
	@PostMapping("/admin/bookOrderChart")
	public @ResponseBody List<Map<String, Object>> orderBy7DaysBook() {
		//현재 날짜
		LocalDate TODAY = LocalDate.now();
				
		
		//결과값 List<Map>
		List<Map<String, Object>> result = orderService.orderBy7DaysBook();
		int exists_book_order_data = result.size();		
		
		//map 형식으로 oracle에 존재하는 날짜에 수량 담음
		List<LocalDate> tempListDate = new ArrayList<LocalDate>();
		Map<LocalDate, Integer> tempKey_Value = new HashMap<LocalDate, Integer>();
		for(int i = 0; i <exists_book_order_data; i++) {
			//DT = order_date 
			//PC = product_count
			LocalDate exists_date = LocalDate.parse(result.get(i).get("DT").toString());
			int exists_book_order_cnt = Integer.parseInt(result.get(i).get("PC").toString());
			
			tempListDate.add(exists_date);
			tempKey_Value.put(exists_date, exists_book_order_cnt);
		}

		//정렬을 위한 초기화
		result.removeAll(result);
		System.out.println( " remove : " + result.toString());
		
		//오늘날짜부터 ~ 7일 전까지 데이터 담기
		for(int i = 0 ; i< DAYS7; i++) {
			//list에 중복된 키 값을 넣기 위한 hashMap 초기화
			Map<String, Object> tempMap = new HashMap<String, Object>();
			
			//if 날짜가 존재하는 데이터의 경우 
			//else 그 밖의 경우
			if( tempListDate.contains(TODAY.minusDays(i)) ) {
				System.out.println( "존재" + TODAY.minusDays(i));
				
				tempMap.put("DT", TODAY.minusDays(i));
				tempMap.put("PC", tempKey_Value.get(TODAY.minusDays(i)) );
				
				result.add(tempMap);
				
			}else {
				tempMap.put("DT", TODAY.minusDays(i));
				tempMap.put("PC", 0);
				result.add(tempMap);
			}
		}
		
		
		System.out.println(result.toString());
		return result;
	}	
	
	/*[관리자] 모달 도서 정보조회 ------------------------------------------------------------*/
	@PostMapping("/Modal_Detail")
	public @ResponseBody BookVO stock_Modal(int book_no) {
		System.out.println(book_no+"book_no");
		return bookService.getBook(book_no);
	}
	
	
	/*[관리자] 모달 도서 재고 추가 ------------------------------------------------------------*/
	@PostMapping("/updateBookStock")
	public @ResponseBody void update_Book_Stock(BookVO vo) {
		bookService.updateBookStock(vo);
	}
	
	/*[관리자] 모달 도서 삭제 ------------------------------------------------------------*/
	@PostMapping("/dlt_Modal_Detail")
	public @ResponseBody void delete_Book(int book_no) {
		bookService.deleteBook(book_no);
	}

	
	/*[관리자]  도서 등록 ------------------------------------------------------------*/
	@PostMapping(path =  "/book_register")
	public @ResponseBody int book_register( BookVO vo , HttpServletRequest request) throws IOException, ParseException {
	//@RequestParam("pblic_date") Date pblic_date
		System.out.println("----------------도서 등록 시작 ------------");
		
		return bookService.bookRegister(vo); 			
		
	}
	
	/*[관리자] 체크박스 선택 도서리스트 정보 가지고 오기------------------------------------------------------------*/
	@PostMapping(path = "/checkGetBook")
	public @ResponseBody List<BookVO> checkGetBook(@RequestParam("check") ArrayList<Integer> list )  {
		System.out.println("book_no_list : " + list);
		return bookService.checkGetBook(list);
	}
	
	/*[관리자] 체크박스 선택 도서리스트 일괄 업데이트------------------------------------------------------------*/
	@PostMapping(path = "/chkBookUpd" )
	public @ResponseBody void chkBookUpd(@RequestParam("book_price") int book_price , @RequestParam("discount") int discount,
						   @RequestParam("stock") int stock, @RequestParam("check[]") ArrayList<Integer> list, 
						   ArrayList<BookVO> voList	) {
		
		
		
		System.out.println("book_price : " + book_price);
		System.out.println("stock : " + stock);
		System.out.println("discount : "  + discount );
		//체크박스에 담겨있는 BOOK_NO 가져와서 voList의 book_no에 넣음
		for(int i= 0; i<list.size(); i++) {
			
			//bookVO 객체 생성해서 업데이트 할 내용 담아오기
			BookVO tempVO = new BookVO();
			tempVO.setBook_no(list.get(i)); //book_no
			tempVO.setBook_price(book_price); //정가
			tempVO.setDiscount(discount); //할인율
			tempVO.setStock(stock); //재고
			
			voList.add(i,tempVO); 
		}
		
		System.out.println("여기 들어오는지?" + voList.toString());
		
		bookService.chkBookUpd(voList);
		
	}
	
}
