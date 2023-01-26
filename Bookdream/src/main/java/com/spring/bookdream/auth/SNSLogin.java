package com.spring.bookdream.auth;

import java.io.IOException;
import java.util.Iterator;

import org.springframework.util.StringUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

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

	public SnsUser getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request); 
		return parseJson(response.getBody());
	}

	private SnsUser parseJson(String body) throws Exception {
		System.out.println(body);
		SnsUser snsuser = new SnsUser();
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		
		
		if (this.sns.isGoogle()) {
			snsuser.setGoogleid(rootNode.get("email").asText());
			snsuser.setName(rootNode.get("given_name").asText());
			
		} else if (this.sns.isNaver()) {
			JsonNode resNode = rootNode.get("response");
			snsuser.setNaverid(resNode.get("email").asText());
			snsuser.setName(resNode.get("name").asText());
			snsuser.setMobile(resNode.get("mobile").asText());
		}
		
		return null;
	}
	
	
}
