package com.spring.bookdream.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bookdream.service.UserService;
import com.spring.bookdream.vo.UserVO;


@Controller
@RequestMapping("/admin")
public class AdminUserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/user", method=RequestMethod.GET)
	public String getUserList(UserVO uservo, Model model) {
		System.out.println("UserList Controller 진입");
		
		List<UserVO> userList = userService.selectUser();
		model.addAttribute("userList", userList);
		
		return "userList";
	};
	
	
}
