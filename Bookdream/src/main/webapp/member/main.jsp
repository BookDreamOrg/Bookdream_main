
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>북드림</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
   <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
  <script>
  Kakao.init('c089c8172def97eb00c07217cae17495'); // 사용하려는 앱의 JavaScript 키 입력
</script>
   <style>
         .container mt{
            background-color: red;
         }
   </style>
</head>
<body>
     
     
     	<nav class="navbar navbar-expand-sm bg-info">
        <div class="container-fluid">
          <a class="navbar-brand" href="javascript:void(0)">
            <img src="../resources/images/bookdream_img.png" alt="" style="width: 100px; height: 50px;">
          </a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="container mt">
            <ul class="nav justify-content-center">
              <li class="nav-item">
                <a class="nav-link" href="#">bookderam 소개</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">추천 도서</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="mypage.jsp">마이 페이지</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="https://kauth.kakao.com/oauth/logout?client_id=47ad839005d8b9a94d3007b30a956894&logout_redirect_uri=http://localhost:8000/member/kakaoLogout"> 카카오 로그아웃</a>
                
              </li>
              <li class="nav-item">
                <a class="nav-link" href="logout.do">회원 로그아웃</a>
              </li>
              
         
            </ul>
          </div>
        </div>
    </nav>
      
      	
      <!-- 메인 -->
      <div class="container-fluid mt-3">
        <h3>${kakaoN }</h3>
        <h3>${kakaoE }</h3>
        <h3>${flatform_type }</h3>
      </div>
    
      <!-- 메인 -->
      <div class="container-fluid mt-3">
        <h3>${userId }</h3>
        <h3>${userPassword }</h3>   
		<h3>${flatform_type }</h3>
      </div>
    
      <div>
      	<h1>model</h1>
      	<h3>${userVO.getUser_id() }</h3>
      	<h3>${userVO.getUser_password() }</h3>
      	<h3>${userVO.getUser_email() }</h3>
      	<h3>${userVO.getPlatform_type() }</h3>
      	
      	
      </div>

</body>
</html>













