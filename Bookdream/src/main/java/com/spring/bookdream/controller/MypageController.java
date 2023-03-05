package com.spring.bookdream.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bookdream.service.AddressService;
import com.spring.bookdream.service.OrderService;
import com.spring.bookdream.service.QnAService;
import com.spring.bookdream.service.ReviewService;
import com.spring.bookdream.service.SearchKeywordService;
import com.spring.bookdream.service.UserService;
import com.spring.bookdream.vo.AddressVO;
import com.spring.bookdream.vo.AnswerVO;
import com.spring.bookdream.vo.KeywordHistoryVO;
import com.spring.bookdream.vo.OrderVO;
import com.spring.bookdream.vo.PageVO;
import com.spring.bookdream.vo.QnAVO;
import com.spring.bookdream.vo.ReviewVO;
import com.spring.bookdream.vo.SearchCriteria;
import com.spring.bookdream.vo.UserVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private UserService userService;

	@Autowired
	private OrderService orderService;	
	
	@Autowired
	private AddressService addressService;	

	@Autowired
	private SearchKeywordService keywordService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private HttpSession session;	
	
	
	// 마이페이지 - 메인 
	@RequestMapping(value="/main")
	public String mypage(HttpServletResponse response, AddressVO address, OrderVO order, QnAVO qna, UserVO user, Model model) {
		
		int user_no = (int) session.getAttribute("user_no");
		
		address.setDefault_add("Y");
		address.setUser_no(user_no);
		order.setUser_no(user_no);
		qna.setUser_no(user_no);
		user.setUser_no(user_no);
		
		model.addAttribute("userPointHistory", userService.userPointHistory(user));
		model.addAttribute("userPoint", userService.userPoint(user));
		model.addAttribute("address", addressService.getDefaultAddress(address));
		model.addAttribute("order", orderService.recentOrder(order));		
		model.addAttribute("qna", qnaService.getRecentMyQnAList(qna));

		List<QnAVO> qnaList = qnaService.getMyQnAList(qna);
		
		int answerCnt = 0;
		for(int i=0; i<qnaList.size(); i++) {
			String check = qnaList.get(i).getAns_check();
			if(check.equals("1")) { //답변 완료 목록 개수
				answerCnt++;
			}
		}
		
		System.out.println("answerCnt : " + answerCnt);
		model.addAttribute("answerCnt", answerCnt);
		return "mypage/mypage";
				
	}	
	
	// 마이페이지 사이드 맞춤도서 표시
	@RequestMapping(value="/rcmndBookList")
	@ResponseBody
	public List<KeywordHistoryVO> rcmndBookList(KeywordHistoryVO key) {

		String user_id = (String) session.getAttribute("user_id");
		key.setUser_id(user_id);
		
		List<KeywordHistoryVO> list = keywordService.rcmndBooklist(key);
		
		return list;
				
	}		

	// 마이페이지 메인 : 포인트사용현황
	@RequestMapping(value="/userPointHistory")
	@ResponseBody	
	public List<Map<String, Object>> userPointHistory(UserVO user) {

		int user_no = (int) session.getAttribute("user_no");
		user.setUser_no(user_no);
		
		List<Map<String, Object>> list = userService.userPointHistory(user);
		
		return list;
				
	}		

	// 마이페이지 - 주문목록 조회 (간단)
	@RequestMapping(value="/tracking")
	public String mypageTracking(HttpServletResponse response, Model model) {

		// 로그인해야 진입됨
		if (session.getAttribute("user_no") == null) {
			String msg = "로그인 후 이용해주세요";
			String url ="/views/user/login.jsp";	
		    try {
		        response.setContentType("text/html; charset=utf-8");
		        PrintWriter w = response.getWriter();
		        w.write("<script>alert('"+msg+"');location.href='"+url+"';</script>");
		        w.flush();
		        w.close();
		    } catch(Exception e) {
		        e.printStackTrace();
		    }
					    
		}

		return "mypage/mypage_tracking";
			
	}


	// 마이페이지(배송지관리)
	@RequestMapping(value="/address")
	public String myPageAddress(HttpServletResponse response) {

		// 로그인해야 진입됨
		if (session.getAttribute("user_no") == null) {
			String msg = "로그인 후 이용해주세요";
			String url ="/views/user/login.jsp";	
		    try {
		        response.setContentType("text/html; charset=utf-8");
		        PrintWriter w = response.getWriter();
		        w.write("<script>alert('"+msg+"');location.href='"+url+"';</script>");
		        w.flush();
		        w.close();
		    } catch(Exception e) {
		        e.printStackTrace();
		    }
					
		}
					
		return "mypage/mypage_address";
			
	}
		
	// 마이페이지(내가작성한 리뷰)
	@RequestMapping(value="/review")
	public String mypageReview(HttpServletResponse response) {

		// 로그인해야 진입됨
		if (session.getAttribute("user_no") == null) {
			String msg = "로그인 후 이용해주세요";
			String url ="/views/user/login.jsp";	
		    try {
		        response.setContentType("text/html; charset=utf-8");
		        PrintWriter w = response.getWriter();
		        w.write("<script>alert('"+msg+"');location.href='"+url+"';</script>");
		        w.flush();
		        w.close();
		    } catch(Exception e) {
		        e.printStackTrace();
		    }
					
		}
					
		return "mypage/myReview";
			
	}	
	
	// 작성한 리뷰 리스트 및 리뷰개수, 총 추천수, 평균 별점
	@RequestMapping(value="/reviewList")
	@ResponseBody
	public ReviewVO reviewList(SearchCriteria cri) {

		String user_id = (String) session.getAttribute("user_id");
		cri.setUser_id(user_id);
		
		// 한 페이지의 표시 개수
		cri.setAmount(3);	
		
		// 페이지 블록의 개수
		int pageBlcok = 3;		
		
		// 리뷰 목록
		List<Map<String, Object>> list = reviewService.myReview(cri);
		
		// 리뷰개수, 추천수, 평균 별점
		Map<String, Object> cnt = reviewService.myReviewCount(cri);		

		// 리뷰개수 추출
		int count = Integer.parseInt(String.valueOf(cnt.get("CNT")));	
			
		PageVO pageMaker = new PageVO(cri, count, pageBlcok);		
				
		ReviewVO result = new ReviewVO();
		result.setList(list);
		result.setCnt(cnt);
		result.setPage(pageMaker);
		
		return result;
			
	}		
	
	
	//회원정보 수정
	@PostMapping(value="/updateUser")
	@ResponseBody
	public String updateUser(@RequestParam(value="id") String id,
							 @RequestParam(value="password") String password,
							 @RequestParam(value="password_check") String password_check,
							 @RequestParam(value="email") String email,
							 @RequestParam(value="name") String name){
		
		if(id.equals("") || password.equals("") || password_check.equals("") || email.equals("") || name.equals("")) {
			return "error";
		}
		
		if(!(password.equals(password_check))) {
			return "password_error";
		}
		
		UserVO userVO = (UserVO)session.getAttribute("authUser");
		
		userVO.setUser_id(id);
		userVO.setUser_password(password);
		userVO.setUser_email(email);
		userVO.setUser_name(name);
		System.out.println("회원정보 수정");
		System.out.println(id);
		System.out.println(password);
		System.out.println(email);
		System.out.println(name);
		userService.updateUser(userVO);
		
		return "/mypage/main";
	}
	
	// 회원탈퇴
	@RequestMapping(value="/deleteUser")
	@ResponseBody
	public String deleteUser(@RequestParam(value="id") String id,
			 				 @RequestParam(value="password") String password) throws Exception {
		
		System.out.println("회원탈퇴 중...");
		if(password.equals("")) {
			return "error";
		}
		
		UserVO userVO = (UserVO)session.getAttribute("authUser");
		String sessionPassword = userVO.getUser_password();
		System.out.println("password check...");
		
		if(!sessionPassword.equals(password)) {
			return("password_error");
		} 		
		userService.deleteUser(userVO);
		session.invalidate();
		return "/views/main/main.jsp";
		
	}
	
	@RequestMapping(value="/edit")
	public String edit(HttpServletResponse response) {
		// 로그인해야 진입됨
		System.out.println("editController");
			if (session.getAttribute("user_no") == null) {
				String msg = "로그인 후 이용해주세요";
				String url ="/views/user/login.jsp";	
			    try {
			        response.setContentType("text/html; charset=utf-8");
			        PrintWriter w = response.getWriter();
			        w.write("<script>alert('"+msg+"');location.href='"+url+"';</script>");
			        w.flush();
			        w.close();
			    } catch(Exception e) {
			        e.printStackTrace();
			    }
						
			}
						
			return "mypage/edit";
	}
	
	// 1:1문의 insert
	@RequestMapping(value="/insertQnA")
	@ResponseBody
	public int qnaInsert(HttpServletResponse response, QnAVO qnaVO) {
		
		System.out.println("QnAInsert실행");
		System.out.println(qnaVO);
		if(qnaVO.getQna_type().equals("select")) {
			return -1;
		} else if(qnaVO.getQna_title().equals("") || qnaVO.getQna_content().equals("")) {
			return 0;
		}
		qnaService.QnAInsert(qnaVO);
		
		return 1;
	}
	
	// 나의 문의 리스트 가져오기
	@RequestMapping(value="/getMyQnAList")
	public String getMyQnAList(HttpServletResponse response, Model model, SearchCriteria cri){
		
		System.out.println("getMyQnAList실행");
		
		int num = 1;
		
		UserVO user = (UserVO)session.getAttribute("authUser");
		QnAVO qnaVO = new QnAVO();
		
		qnaVO.setUser_no(user.getUser_no());
		System.out.println(qnaVO.getUser_no());
		System.out.println(qnaVO);
		List<QnAVO> qnaMyList = qnaService.getMyQnAList(qnaVO);
		List<AnswerVO> ansMyList = qnaService.getAnswer(qnaVO);
		for(int i=0; i<ansMyList.size(); i++) {
			System.out.println(ansMyList.get(i));
		}
		
		model.addAttribute("ansMyList",ansMyList);
		model.addAttribute("myQnAList", qnaMyList);
		model.addAttribute("qnaUrl", "/mypage/qna_write");
		
		int answerCnt = 0;
		for(int i=0; i<qnaMyList.size(); i++) {
			String check = qnaMyList.get(i).getAns_check();
			if(check.equals("1")) { //답변 완료 목록 개수
				answerCnt++;
			}
		}
		model.addAttribute("answerCnt", answerCnt);
		
		return "mypage/qna";
	}
	
	//qna가져오기
	@RequestMapping(value="/getQnA")
	public String getQnA(HttpServletRequest request, QnAVO qnaVO, Model model) {
		
		System.out.println("getQnA실행");
		
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		qnaVO.setQna_no(qna_no);
		
		QnAVO qna = qnaService.getQnA(qnaVO);
		System.out.println(qna.getQna_no());
		System.out.println(qna.getQna_title());
		System.out.println(qna.getQna_content());
		
		model.addAttribute("getQnA", qna);
		
		return "mypage/qna_updatewrite";
	}
	
	// 1:1문의 수정
	@RequestMapping(value="/updateQnAInfo")
	@ResponseBody
	public int updateQnA(HttpServletRequest request, QnAVO qnaVO, Model model) {
		
		System.out.println("updateQnA실행");
		
		if(qnaVO.getQna_type().equals("select")) {
			System.out.println("typenull");
			return -1;
		} else if(qnaVO.getQna_title().equals("") || qnaVO.getQna_content().equals("")) {
			return 0;
		}
		
		System.out.println(qnaVO);
		
		qnaService.updateQnA(qnaVO);
		return 1;
	}
	  
	// 1:1문의 삭제
	@RequestMapping(value="/deleteQnA")
	public String deleteQnA(HttpServletRequest request, HttpServletResponse response, QnAVO qnaVO, Model model) throws IOException {
		
		System.out.println("deleteQnA실행");
		
		String qna_no = request.getParameter("qna_no");
		
		qnaService.deleteQnA(qnaVO);
		
		return "redirect:/mypage/getMyQnAList";
	}
  
}


