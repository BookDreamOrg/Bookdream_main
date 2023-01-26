package com.spring.bookdream.auth;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.spring.bookdream.dao.UserDAO;
import com.spring.bookdream.vo.UserVO;

public class SNSLogin {
	private OAuth20Service oauthService;
	private SnsValue sns;
	
	public SNSLogin(SnsValue sns) {
		this.oauthService = new ServiceBuilder(sns.getClientId())
				.apiSecret(sns.getClientSecert())
				.callback(sns.getRedirectUrl())
				.scope("profile")
				.build(sns.getApi20Instance());
		this.sns = sns;
	}

	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}

	public UserVO getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request); 
		return parseJson(response.getBody());
	}

	private UserVO parseJson(String body) throws Exception {
		System.out.println(body);
		UserVO userVo = new UserVO();
		
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		
		
		if (this.sns.isGoogle()) {
			if(rootNode.has("family_name")) {
				userVo.setUser_name(rootNode.get("family_name").asText() + rootNode.get("given_name").asText());
			} else {
				userVo.setUser_name(rootNode.get("given_name").asText());
			}
			userVo.setUser_email(rootNode.get("email").asText());
			userVo.setFlatform_type("google");
		} else if (this.sns.isNaver()) {
			JsonNode resNode = rootNode.get("response");
			userVo.setUser_email(resNode.get("email").asText());
			userVo.setUser_name(resNode.get("name").asText());
			userVo.setUser_tel(resNode.get("mobile").asText());
			userVo.setFlatform_type("naver");
		}
		
		return userVo;
	}
	
	
}
