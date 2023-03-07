<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<!-- jQuery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   <link rel="stylesheet" href="/resources/css/login.css">
  <title>북드림 아이디/비밀번호 찾기 페이지</title>
    
</head>
<body class="text-center">
    <main class="form-signin">
		<img class="mb-4" src="/resources/images/bookdream_img.png" alt="" width="160" height="70">
		<div><b>입력하신 정보와 일치하는 결과입니다.</b></div>
		<br>
		<hr>
		<br>
          <div class="form-floating">
            <div>비밀번호는 ${pwfind } 입니다.</div>
          </div>	
          <br>
          <div class="form-floating">
          <button class="btn btn-secondary" onclick="location.href='login.jsp'">로그인</button>
          </div>
          

    </main>
     
    
 </body>
</html>
