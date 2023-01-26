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
import com.spring.bookdream.auth.SnsUser;
import com.spring.bookdream.auth.SnsValue;

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
		
		@RequestMapping(value="/auth/{service}/callback",
				method =  {RequestMethod.GET, RequestMethod.POST}) 
		public String snsLoginCallback(@PathVariable String service, 
				Model model, @RequestParam String code, HttpSession session) throws Exception {
			
			SnsValue sns = null;
			if(StringUtils.equals("naver", service)) {
				sns = naverSns;
			} else if(StringUtils.equals("google", service)) {
				sns = googleSns;
			};
			
			// 1. code를 이용해서 access_token 받기
			// 2. access_token을 이용해서 사용자 profile 정보 가져오기
			SNSLogin snsLogin = new SNSLogin(sns);
			SnsUser snsUser = snsLogin.getUserProfile(code);
			System.out.println("Service>>" + service);
			System.out.println("Profile>>" + snsUser);
			
			// 3. DB 해당 유저가 존재하는지 Check (googleid, naverid 컬럼 추가)
			// 4. 존재 시 강제 로그인, 미존재 시 가입페이지
			
			return "user/main_test";
		}
		
}
