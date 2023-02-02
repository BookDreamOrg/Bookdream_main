package com.spring.bookdream.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.bookdream.dao.UserDAO;
import com.spring.bookdream.service.KakaoService;
import com.spring.bookdream.service.UserService;
import com.spring.bookdream.vo.UserVO;


@Controller
@RequestMapping(value="/views/user/*")
public class LoginController {
   @Autowired
   private UserService userService;
   
   @Autowired
   private KakaoService ms;
   
   @Autowired
   private HttpSession session;
   
   
   // 기존 회원 로그인
   @RequestMapping(value="/login.do")
   public String login(@ModelAttribute UserVO vo, UserDAO userDAO, Model model) {

		System.out.println("로그인 인증 처리 ...");
		System.out.println(vo.getUser_id());
		System.out.println(vo.getUser_password());
			
		boolean result = userService.loginCheck(vo, model);
		UserVO user = userService.getUser(vo);
		
		if (result) { //로그인 성공
			System.out.println("로그인 처리");
			session.setAttribute("authUser", user);
			
			session.setAttribute("user_id", user.getUser_id());
			session.setAttribute("user_no", user.getUser_no());
			
			session.setAttribute("flatform", user.getFlatform_type());
			
			return "/main/main_teset";
		} else { //로그인 실패
			System.out.println("로그인 실패");
			
			model.addAttribute("loginMsg", "로그인에 실패하였습니다. 아이디나 비밀번호를 확인해주세요");
			model.addAttribute("loginUrl", "login.jsp");
			
			return "/user/login";
		}
	}
	
	// 카카오 로그인
	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model) throws Exception {
		System.out.println("#########" + code);
		
			String access_Token = ms.getAccessToken(code);
			
			UserVO userInfo = ms.getUserInfo(access_Token);
			
			System.out.println("###access_Token#### : " + access_Token);
			System.out.println("###nickname#### : " + userInfo.getUser_name());
			System.out.println("###email#### : " + userInfo.getUser_email());
			
			session.setAttribute("kakaoName", userInfo.getUser_name());
			session.setAttribute("kakaoEmail", userInfo.getUser_email());
			
			session.setAttribute("authUser", userInfo);
			 
		return "/main/main_teset";
		
    	}
	
	@RequestMapping(value="/kakaoLogout", method=RequestMethod.GET)
	public String kakaoLogout() {
		session.invalidate();
		return "/main/main_teset";
	}


}