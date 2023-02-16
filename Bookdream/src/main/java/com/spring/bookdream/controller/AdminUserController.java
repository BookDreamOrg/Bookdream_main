package com.spring.bookdream.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
@RequestMapping("/admin/user/*")
public class AdminUserController {
	
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
		
	@RequestMapping(value = "/userListPage.do", method = RequestMethod.GET)
	public String getListPage(Model model, @RequestParam("num") int num, UserVO userVO) {
		System.out.println("userListPage.do실행");
		List<UserVO> userAllList = userService.getAllUserList(userVO);

		int count = userAllList.size();
		
		// 페이지에 보이는 수(변경 가능)
		int postNum = 5;
		
		int pageNum = (int)Math.ceil((double)count/postNum);
		
		int displayPost = 0;
		
		if(num > 1) {
			displayPost = ((num - 1) * postNum) + 1;
			postNum = (postNum - 1);
		} 
		
		userVO.setDisplayPost(displayPost);
		userVO.setPostNum(postNum);
		
		String key = userVO.getSearchUserKeyword();
		
		List<UserVO> userList = null;
		
		userList = userService.userListPage(userVO);
		
		model.addAttribute("userList", userList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("SearchUserKeyword",key);
		
		return "/admin/user/userList";
	}
	
	@RequestMapping(value = "/getUserByNo.do", method = RequestMethod.POST)
	@ResponseBody
	public UserVO getUserById(@RequestParam("user_no") int num, Model model) {
		
		UserVO getUserById = userService.getUserByNo(num);
		model.addAttribute("getUserById", getUserById);
		
		return getUserById;
	}
	
	@RequestMapping(value = "/blackList.do", method = RequestMethod.POST)
	@ResponseBody
	public void setBlack(@RequestParam("user_no") int num) {
		userService.setBlack(num);
	}
	
	
	// 검색 유저 목록 가져오기
	@RequestMapping(value="/getSearchUserList")
	@ResponseBody	
	public String getSearchUserList(UserVO userVO, Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		System.out.println("getSearchUserList실행");
		System.out.println(userVO.getSearchUserKeyword());
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String key = userVO.getSearchUserKeyword();
		
		return key;
	}
	
	// 관리자의 전체 문의 리스트 가져오기
	@RequestMapping(value="/getAllQnAList")
	public String getAllQnAList(HttpSession session, Model model, UserVO userVO){
		
		System.out.println("getAllQnAList실행");
		
		
		List<QnAVO> qnaAllList = qnaService.getAllQnAList();
		
		List<UserVO> user = qnaService.getQnAUser();
		
		model.addAttribute("userList", user);
		model.addAttribute("qnaAllList", qnaAllList);
		
		return "admin/user/admin_qnaanswer";
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
		 
		return "admin/user/admin_qnaanswer";
	}	
	
}

