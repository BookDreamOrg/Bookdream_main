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
@RequestMapping("/views/admin/user/*")
public class AdminUserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/uesrList.do", method = RequestMethod.GET)
	public String getUserList(Model model) {
		System.out.println("UserList Controller 진입");
		
		List<UserVO> userList = userService.selectUser();
		model.addAttribute("userList", userList);
		
		return "/admin/user/userList";
	};
	
	
	@RequestMapping(value = "/userListPage.do", method = RequestMethod.GET)
	public String getListPage(Model model, @RequestParam("num") int num) {
		
		int count = userService.countUser();
		
		// 페이지에 보이는 수(변경 가능)
		int postNum = 5;
		
		int pageNum = (int)Math.ceil((double)count/postNum);
		
		int displayPost = 0;
		
		if(num > 1) {
			displayPost = ((num - 1) * postNum) + 1;
			postNum = (postNum - 1);
		} 
				
		List<UserVO> userList = null;
		userList = userService.userListPage(displayPost, postNum);
		model.addAttribute("userList", userList);
		model.addAttribute("pageNum", pageNum);
		
		return "/admin/user/userList";
	}
}

