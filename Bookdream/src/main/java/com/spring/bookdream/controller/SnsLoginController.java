package com.spring.bookdream.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.api.services.people.v1.PeopleService;
import com.google.api.services.people.v1.model.Person;
import com.spring.bookdream.auth.SNSLogin;
import com.spring.bookdream.auth.SnsValue;
import com.spring.bookdream.dao.UserDAO;
import com.spring.bookdream.service.UserService;
import com.spring.bookdream.vo.UserVO;

@Controller
public class SnsLoginController {
	
		// Google Login
		@Inject
		private GoogleConnectionFactory googleConnectionFactory;
		@Inject
		private OAuth2Parameters googleOAuth2Parameters;
	
		@Inject
		private SnsValue naverSns;
		@Inject
		private SnsValue googleSns;
		
		@Inject
		UserDAO userDao;
		
		@Inject
		private UserService userService;
		
		@RequestMapping(value="/auth/{snsService}/callback",
				method =  {RequestMethod.GET, RequestMethod.POST}) 
		public String snsLoginCallback(@PathVariable String snsService, 
				Model model, @RequestParam String code, HttpSession session) throws Exception {
			
			SnsValue sns = null;
			if(StringUtils.equals("naver", snsService)) {
				sns = naverSns;
			} else if(StringUtils.equals("google", snsService)) {
				sns = googleSns;
			};
			
			// 1. code를 이용해서 access_token 받기
			// 2. access_token을 이용해서 사용자 profile 정보 가져오기
			SNSLogin snsLogin = new SNSLogin(sns);
			UserVO snsUser = snsLogin.getUserProfile(code);
			
			System.out.println("Service>>" + snsService);
			System.out.println("Profile>>" + snsUser);
			
			// 3. DB 해당 유저가 존재하는지 Check (googleid, naverid 컬럼 추가)
			// 4. 존재 시 강제 로그인, 미존재 시 가입페이지
			UserVO user = userService.getBySns(snsUser);
			if(user == null) {
				model.addAttribute("result", "존재하지 않는 사용자입니다. 가입해주세요");
				if (snsService.equals("naver")) {
					userDao.naverinsert(snsUser);
				} else if (snsService.equals("google")) {
					userDao.googleinsert(snsUser);
				}
			} else {
				System.out.println(user.getUser_name() + " 님 반갑습니다.");
				model.addAttribute("result", user.getUser_name() + " 님 반갑습니다.");
				session.setAttribute("authUser", user);
			}
			
			return "redirect:/views/main/main.jsp";
		}
		
}
