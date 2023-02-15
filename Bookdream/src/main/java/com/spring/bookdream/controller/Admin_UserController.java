package com.spring.bookdream.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bookdream.service.AddressService;
import com.spring.bookdream.service.OrderService;
import com.spring.bookdream.service.QnAService;
import com.spring.bookdream.service.SearchKeywordService;
import com.spring.bookdream.service.UserService;
import com.spring.bookdream.vo.AnswerVO;
import com.spring.bookdream.vo.QnAVO;
import com.spring.bookdream.vo.UserVO;

@Controller
@RequestMapping(value="/admin")
public class Admin_UserController {
	
	@Autowired
	private UserService userService;

	@Autowired
	private OrderService orderService;	
	
	@Autowired
	private AddressService addressService;	

	@Autowired
	private SearchKeywordService keywordService;
	
	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private HttpSession session;
	
	// 관리자의 전체 문의 리스트 가져오기
		@RequestMapping(value="/getAllQnAList")
		public String getAllQnAList(HttpSession session, Model model){
			
			System.out.println("getAllQnAList실행");
			
			
			List<QnAVO> qnaAllList = qnaService.getAllQnAList();
			
			
			UserVO user = (UserVO)session.getAttribute("authUser");
			
			model.addAttribute("qna_user", user);
			model.addAttribute("qnaAllList", qnaAllList);
			
			return "admin/admin_qnaanswer";
		}

		
		// 답변 
		@RequestMapping(value="/answerQnA")
		@ResponseBody
		public String answerQnA(HttpServletRequest request, AnswerVO answerVO, QnAVO qnaVO) {
			
			System.out.println("answerQnA실행");
			//답변완료 표시
			qnaVO.setAns_check("1");
			
			System.out.println(answerVO.getUser_no());
			System.out.println(answerVO.getAns_content());
			System.out.println(answerVO.getQna_no());
			System.out.println(qnaVO.getAns_check());
			
			qnaService.insertAnswer(answerVO);
			qnaService.answerCheck(qnaVO);
			 
			return "admin/admin_qnaanswer";
		}	
}
