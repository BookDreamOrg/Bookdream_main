package com.spring.bookdream.vo;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

public class KakaoLoginVO {
	public final static String url = "https://kauth.kakao.com/oauth/authorize?";
	public final static String client_id = "47ad839005d8b9a94d3007b30a956894";
	public final static String redirect_uri = "http://localhost:8000/views/user/kakaoLogin";
	
}
