package com.spring.bookdream.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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

import com.spring.bookdream.service.OrderService;
import com.spring.bookdream.service.PurchaseService;
import com.spring.bookdream.service.QnAService;
import com.spring.bookdream.service.UserService;
import com.spring.bookdream.vo.AnswerVO;
import com.spring.bookdream.vo.OrderVO;
import com.spring.bookdream.vo.PurchaseVO;
import com.spring.bookdream.vo.QnAVO;
import com.spring.bookdream.vo.SearchCriteria;
import com.spring.bookdream.vo.UserVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private OrderService orderService;	
	
	@Autowired
	private UserService userService;

	@Autowired
	private PurchaseService purchaseService;	
	
	@Autowired
	private HttpSession session;

	@Autowired
	private QnAService qnaService;
	
	// 마이페이지 - 주문목록 조회 (간단)
	@RequestMapping(value="/tracking")
	public String mypageTracking(HttpServletResponse response, OrderVO order, 
								 SearchCriteria cri, Model model) {

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


//		cri.setUser_no(user_no);
//      @RequestParam(value="p") int pageNum		
//		//********** 페이징 처리 시작 **********//
//		
//		// 1. 주문 총 개수  
//		int count = orderService.orderCount(order).getOrder_count();
//		
//		// 2. URL파라미터
//		cri.setPageNum(pageNum);
//		
//		// 3. 페이징버튼 
//		PageVO pageMaker = new PageVO(cri, count);
//		
//		model.addAttribute("pageMaker", pageMaker);
//		
//		//********** 페이징 처리 끝 **********//
//		
//		// 배송상태 업데이트
//		// 결제 1일뒤 = 배송중, 2일뒤 = 배송완료
//		orderService.trackingUpdate(order);			
//		
//		// 주문 목록 표시
//		model.addAttribute("orderlist", orderService.searchOrder(cri));
		
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
		
		return "/mypage/mypage";
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
	public QnAVO qnaInsert(HttpServletResponse response, QnAVO qnaVO) {
		
		System.out.println("QnAInsert실행");
		
		System.out.println(qnaVO);
		qnaService.QnAInsert(qnaVO);
		
		return qnaVO;
	}
	
	// 나의 문의 리스트 가져오기
	@RequestMapping(value="/getMyQnAList")
	public String getMyQnAList(HttpServletResponse response, Model model){
		
		System.out.println("getMyQnAList실행");
		
		UserVO user = (UserVO)session.getAttribute("authUser");
		QnAVO qnaVO = new QnAVO();
		
		qnaVO.setUser_no(user.getUser_no());
		System.out.println(qnaVO.getUser_no());
		
		List<QnAVO> qnaMyList = qnaService.getMyQnAList(qnaVO);
		
		model.addAttribute("myQnAList", qnaMyList);
		model.addAttribute("qnaUrl", "/mypage/qna_write");
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
	public String updateQnA(HttpServletRequest request, QnAVO qnaVO, Model model) {
		
		System.out.println("updateQnA실행");
		String qna_type = request.getParameter("qna_type");
		String qna_title = request.getParameter("qna_title");
		String qna_content = request.getParameter("qna_content");
		
		qnaVO.setQna_type(qna_type);
		qnaVO.setQna_title(qna_title);
		qnaVO.setQna_content(qna_content);
		
		System.out.println(qnaVO);
		
		qnaService.updateQnA(qnaVO);
		return "mypage/qna";
	}
	
	// 1:1문의 삭제
	@RequestMapping(value="/deleteQnA")
	public String deleteQnA(HttpServletRequest request, HttpServletResponse response, QnAVO qnaVO, Model model) throws IOException {
		
		System.out.println("deleteQnA실행");
		
		String qna_no = request.getParameter("qna_no");
		
		qnaService.deleteQnA(qnaVO);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter w = response.getWriter();
		w.write("<script>alert('삭제되었습니다.');</script>");
		w.flush();
        w.close();
		
		return "redirect:/mypage/getMyQnAList";
	}

	// 관리자의 전체 문의 리스트 가져오기
		@RequestMapping(value="/getAllQnAList")
		public String getAllQnAList(HttpServletResponse response, Model model){
			
			System.out.println("getAllQnAList실행");
			
			List<QnAVO> qnaAllList = qnaService.getAllQnAList();
			
			model.addAttribute("qnaAllList", qnaAllList);
			
			return "mypage/answer";
		}

		
		// 답변 
		@RequestMapping(value="/answerQnA")
		@ResponseBody
		public String answerQnA(HttpServletRequest request, AnswerVO answerVO, Model model) {
			
			System.out.println("answerQnA실행");
			
			System.out.println(answerVO.getUser_no());
			System.out.println(answerVO.getAns_content());
			
			qnaService.insertAnswer(answerVO);
			 
			return "mypage/answer";
		}	
}


