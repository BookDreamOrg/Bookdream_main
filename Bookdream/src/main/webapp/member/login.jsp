<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   
    <title>북드림 로그인 페이지</title>
    <style>
        html, body{
            height: 100%;
        }
        body {
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 100px;
            background-color: #f5f5f5;
        }
        .form-signin {
        
            width: 100%;
            max-width: 330px;
            padding: 15px;
            margin: auto;
        }
        
        .form-signin .checkbox {
            font-weight: 400;
        }
        
        .form-signin .form-floating:focus-within {
            z-index: 2;
        }
        
        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }
        
        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
</head>
<body class="text-center">
    <main class="form-signin">
       <form action="login.do" method="post">
       <img class="mb-4" src="../resources/images/bookdream_img.png" alt="" width="200" height="100">
          <h1 class="h3 mb-3 fw-normal">로그인 페이지</h1>
          
          <div class="form-floating">
             <input type="text" class="form-control" id="user_id" name="user_id" placeholder="'-'을 빼고 입력하세요">
             <label for="id">아이디</label>
          </div>
          <div class="form-floating">
             <input type="password" class="form-control" id="user_password" name="user_password" placeholder="Password">
             <label for="password">비밀번호</label>
          </div>
          
          <div class="checkbox mb-3">
             <label>
                <input type="checkbox" value="remember-me"> 아이디 저장
             </label>
          </div>
          <div class="d-flex justify-content-center">
            <button class="login_btn w-20 btn btn-sm btn-primary" type="submit">로그인</button> &nbsp;&nbsp;&nbsp;
            <button class="login_btn w-30 btn btn-sm btn-primary" type="button" onclick="location.href='join.jsp'">회원가입</button>
            <!-- 카카오 로그인 -->
	<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=47ad839005d8b9a94d3007b30a956894&redirect_uri=http://localhost:8000/member/kakaoLogin&response_type=code">
	<!-- REST_API키 및 REDIRECT_URi는 본인걸로 수정하세요 -->
	<!-- 저는 redirect_uri을 http://localhost:8000/member/kakaoLogin로 했습니다. -->
	<!-- 본인걸로 수정 시 띄어쓰기 절대 하지 마세요. 오류납니다. -->
	
		<img src="../resources/images/kakao_login.png" style="height:30px">
      		<!-- 이미지는 카카오 개발자센터에서 제공하는 login 이미지를 사용했습니다. -->

	</a>
          </div>

       </form>
    </main>
    
    <!-- 로그인 실패시  -->
    <script type="text/javascript"> 
		var message = '${loginMsg }'; 
		var returnUrl = '${loginUrl }'; 
		
		if(message){
			alert(message);
		} 
		
		document.location.href = url; 
		
	</script>
 </body>
</html>
