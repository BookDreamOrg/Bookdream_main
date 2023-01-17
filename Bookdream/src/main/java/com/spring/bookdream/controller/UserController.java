package com.spring.bookdream.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bookdream.dao.UserDAO;
import com.spring.bookdream.service.UserService;
import com.spring.bookdream.vo.UserVO;


@Controller
@RequestMapping(value="/member/*")
public class UserController {

	@Autowired
	private UserService userService;

	//회원가입
	@RequestMapping(value="/insertUser.do")
	public String insertUser(UserVO userVO, UserDAO userDAO) throws IOException {
		System.out.println("회원가입 처리 ");
		
		
		userService.insertUser(userVO);
		return "/member/login";
	}
	
	// 회원가입 아이디 중복체크
	@PostMapping("/idCheck.do")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		System.out.println("idcheckController" + id);
		int cnt = userService.idCheck(id);

		
		return cnt;
	}
	
}
