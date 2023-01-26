<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="759629996127-2168hvg19ogj7kah4thgo16a2seoc50q.apps.googleusercontent.com" >
<title>login Test</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
  html, div, body,h3{
  	margin: 0;
  	padding: 0;
  }
  h3{
  	display: inline-block;
  	padding: 0.6em;
  }
</style>
</head>
<body>
	<div style="background-color:#15a181; width: 100%; height: 50px;text-align: center; color: white; "><h3>SIST Login</h3></div>
	<br>
	<!-- 구글 로그인 화면으로 이동 시키는 URL -->
	<!-- 구글 로그인 화면에서 ID, PW를 올바르게 입력하면 oauth2callback 메소드 실행 요청-->
	<div id="google_id_login" style="text-align:center">
		<a href="${ google_url }">
			<img width="300px" src="/resources/images/google_login.PNG" alt="google_login">
		</a>
		<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=0328Vi7efumpXAgBjKZA&state=STATE_STRING&redirect_uri=https://localhost:8000/auth/naver/callback">
			<img width="300px" src="/resources/images/naver_login.png" alt="naver_login">
		</a>
	</div>
</body>
</html>