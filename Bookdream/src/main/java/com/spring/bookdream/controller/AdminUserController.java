package com.spring.bookdream.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.bookdream.service.UserService;
import com.spring.bookdream.vo.UserVO;


@Controller
@RequestMapping("/admin/user/*")
public class AdminUserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/uesrList", method = RequestMethod.GET)
	public void getUserList(Model model) {
		System.out.println("UserList Controller 진입");
		
		List<UserVO> userList = userService.selectUser();
		model.addAttribute("userList", userList);
	};
	
	
	@RequestMapping(value = "/userListPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) {
		
		int count = userService.countUser();
		
		int postNum = 10;
		
		int pageNum = (int)Math.ceil((double)count/postNum);
		
		int displayPost = (num - 1) * postNum;
		
		List<UserVO> userList = userService.userListPage(displayPost, postNum);
		model.addAttribute("userList", userList);
		model.addAttribute("pageNum", pageNum);
	}
}

