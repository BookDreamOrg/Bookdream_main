package com.spring.bookdream.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
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
		
		for(int i=0; i<count; i++) {
			System.out.println(userAllList.get(i));
		}
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
		
		System.out.println("userListPage.do의 키워드: " + key);		
		System.out.println("userListPage.do의 키워드타입: " + userVO.getSearchUserType());
		
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
	public HashMap<String, String> getSearchUserList(UserVO userVO, Model model) {
		 
		System.out.println("getSearchUserList실행");
		System.out.println(userVO.getSearchUserKeyword());
		System.out.println("userListPage.do의 키워드타입: " + userVO.getSearchUserType());
		UserVO user = new UserVO();
		
		String keyword = userVO.getSearchUserKeyword();
		String type = userVO.getSearchUserType();
		
		user.setSearchUserKeyword(userVO.getSearchUserKeyword());
		user.setSearchUserType(userVO.getSearchUserType());
		System.out.println(user);
		String key = userVO.getSearchUserKeyword();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("type", type);
		
		System.out.println(map.get(keyword));
		return map;
	}
	
	// 관리자의 답변대기 리스트 가져오기
	@RequestMapping(value="/getAllQnAList")
	public String getWaitQnAList(HttpSession session, Model model, UserVO userVO, QnAVO qnaVO){
		
		System.out.println("getWaitQnAList실행");
		List<QnAVO> qnaAllList = qnaService.getWaitQnAList(); //답변 대기 문의 리스트
			int count = qnaAllList.size();
			int num = qnaVO.getPageNum();
			int postNum = 5;
			
			int pageNum = (int)Math.ceil((double)count/postNum);
			
			int displayPost = 0;
			
			if(num > 1) {
				displayPost = ((num - 1) * postNum) + 1;
				postNum = (postNum - 1);
			} 
		
			qnaVO.setDisplayPost(displayPost);
			qnaVO.setPostNum(postNum);
			
			System.out.println(num);
			System.out.println(displayPost);
			System.out.println(postNum);
			
			List<QnAVO> qnaAllList2 = qnaService.getAllQnAPageList(qnaVO);
			for(int i=0;i<qnaAllList2.size(); i++) {
				System.out.println(qnaAllList2.get(i));
			}
			
		List<UserVO> user = qnaService.getQnAUser();
		
		model.addAttribute("userList", user);
		model.addAttribute("qnaAllList", qnaAllList2);
		model.addAttribute("pageNum", pageNum);
		
		return "admin/user/admin_qnaanswer";
	}

	// 관리자의 답변완료 리스트 가져오기
		@RequestMapping(value="/getClearQnAList")
		public String getClearQnAList(HttpSession session, Model model, UserVO userVO, QnAVO qnaVO){
			
			System.out.println("getClearQnAList실행");
			List<QnAVO> qnaAllList = qnaService.getClearQnAList(); //답변완료 문의 리스트
				int count = qnaAllList.size();
				System.out.println("count: "+ count);
				int num = qnaVO.getPageNum();
				int postNum = 5;
				
				int pageNum = (int)Math.ceil((double)count/postNum);
				
				int displayPost = 0;
				
				if(num > 1) {
					displayPost = ((num - 1) * postNum) + 1;
					postNum = (postNum - 1);
				} 
			
				qnaVO.setDisplayPost(displayPost);
				qnaVO.setPostNum(postNum);
				
				System.out.println(num);
				System.out.println(displayPost);
				System.out.println(postNum);
				
				List<QnAVO> qnaAllList2 = qnaService.getClearQnAPageList(qnaVO);
				for(int i=0;i<qnaAllList2.size(); i++) {
					System.out.println(qnaAllList2.get(i));
				}
				
			List<UserVO> user = qnaService.getQnAUser();
			
			List<AnswerVO> ansMyList = qnaService.getAnswer(qnaVO);
			System.out.println("ans리스트");
			for(int i=0; i<ansMyList.size(); i++) {
				System.out.println(ansMyList.get(i));
			}
			
			model.addAttribute("ansMyList",ansMyList);
			
			model.addAttribute("userList", user);
			model.addAttribute("qnaAllList", qnaAllList2);
			model.addAttribute("pageNum", pageNum);
			
			return "admin/user/admin_qnaanswer_clear";
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
	
	@RequestMapping(value="/QnADashBoard")
	public String QnADashBoard(Model model, UserVO userVO, QnAVO qnaVO) {
		
		System.out.println("QnADashBoard실행");
		List<QnAVO> qnaWaitList = qnaService.getWaitQnAList(); //답변 대기 문의 리스트
			int count = qnaWaitList.size();
			int num = 1;
			int postNum = 6;
			
			int pageNum = (int)Math.ceil((double)count/postNum);
			
			int displayPost = 0;
			
			if(num > 1) {
				displayPost = ((num - 1) * postNum) + 1;
				postNum = (postNum - 1);
			} 
		
			qnaVO.setDisplayPost(displayPost);
			qnaVO.setPostNum(postNum);
			
			System.out.println(num);
			System.out.println(displayPost);
			System.out.println(postNum);
			
			List<QnAVO> qnaAllList2 = qnaService.getAllQnAList();
			List<QnAVO> qnaAllList = new ArrayList<>();
			
			for(int i=0;i<6; i++) {
				qnaAllList.add(qnaAllList2.get(i));
				System.out.println(qnaAllList.get(i));
			}
			
		List<UserVO> user = qnaService.getQnAUser();
		
		model.addAttribute("userList", user);
		model.addAttribute("qnaAllList", qnaAllList);
		model.addAttribute("pageNum", pageNum);
		
		return "admin/admin"; 
	}	
}

