package com.spring.bookdream.controller;



import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.spring.bookdream.service.BookService;
import com.spring.bookdream.service.OrderService;
import com.spring.bookdream.vo.BookVO;



@Controller
public class Admin_BookController {
	
	final static LocalDate TODAY = LocalDate.now();
	final static int DAYS7 = 7;
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private OrderService orderService;

	/*[관리자] 관리용 도서 정보 조회 ------------------------------------------------------------*/
	@GetMapping("/admin_bookList")
	public String bookList(BookVO vo, Model model) {
		
		model.addAttribute("book", bookService.AdmingetBookList(vo));
		return "/admin/item_mngmn";
	}
	
	/*[관리자] 일주일 도서 판매량 차트 ------------------------------------------------------------*/
	@PostMapping("/admin/bookOrderChart")
	@ResponseBody
	public List<Map<String, Object>> orderBy7DaysBook() {
		//결과값 List<Map>
		List<Map<String, Object>> result = orderService.orderBy7DaysBook();
		int exists_book_order_data = result.size();		
		
		//map 형식으로 oracle에 존재하는 날짜에 수량 담음
		List<LocalDate> tempListDate = new ArrayList<LocalDate>();
		Map<LocalDate, Integer> tempKey_Value = new HashMap<LocalDate, Integer>();
		for(int i = 0; i <exists_book_order_data; i++) {
			
			LocalDate exists_date = LocalDate.parse(result.get(i).get("DT").toString());
			int exists_book_order_cnt = Integer.parseInt(result.get(i).get("PC").toString());
			
			tempListDate.add(exists_date);
			tempKey_Value.put(exists_date, exists_book_order_cnt);
		}

		//정렬을 위한 초기화
		result.removeAll(result);
		System.out.println( " remove : " + result.toString());
		
		for(int i = 0 ; i< DAYS7; i++) {
			//list에 중복된 키 값을 넣기 위한 hashMap 초기화
			Map<String, Object> tempMap = new HashMap<String, Object>();
			
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
	@ResponseBody
	public BookVO stock_Modal(int book_no) {
		return bookService.getBook(book_no);
	}
	
	
	/*[관리자] 모달 도서 재고 추가 ------------------------------------------------------------*/
	@PostMapping("/updateBookStock")
	@ResponseBody
	public void update_Book_Stock(BookVO vo) {
		bookService.updateBookStock(vo);
	}
	
	/*[관리자] 모달 도서 삭제 ------------------------------------------------------------*/
	@PostMapping("/dlt_Modal_Detail")
	@ResponseBody
	public void delete_Book(int book_no) {
		bookService.deleteBook(book_no);
	}

	


}
