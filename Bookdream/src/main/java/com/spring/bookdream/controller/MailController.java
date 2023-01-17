package com.spring.bookdream.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bookdream.service.MailSendService;
import com.spring.bookdream.service.UserService;


@Controller
@RequestMapping(value="/member/*")
public class MailController {

	@Autowired
	private UserService userService;
	@Autowired
	private MailSendService mailService;

	@GetMapping("/join")
	public void userJoin() {}
	
	//이메일 인증
	@GetMapping(value="/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴! ");
		System.out.println("이메일 인증 이메일: " + email);
		
		 return mailService.joinEmail(email);
	}
	
}
