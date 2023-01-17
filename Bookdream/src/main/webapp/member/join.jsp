<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	<!-- jQuery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="../resources/js/join.js"></script>
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	  	<link rel="stylesheet" href="../resources/css/join.css">
	  	
    <title>회원가입 페이지</title>
    
</head>

    <body class="text-center">
        <main class="form-signin">
           <form action="insertUser.do" method="post" id="frm">
              <img class="mb-4" src="../resources/images/bookdream_img.png" alt="" width="200" height="100">
              <h1 class="h3 mb-3 fw-normal">회원가입</h1>
              
             <div class ="d-flex">
              	<div class="form-floating">
                 <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디 입력">
                 <label for="id">아이디</label>
              	</div>
              <button class="w-30 btn btn-sm btn-primary" id="btn" onclick="checkId()" type="button">아이디 중복 </button>
              </div>
              
              <div>
              	<span class="id_ok">멋진 아이디네요!</span>
              	<span class="id_already">사용중인 아이디 입니다.</span>
              </div>
              
 <!-- 유효성 검사  -->
 
              <div class="form-floating" id="pswd1Img">
                <input type="password" class="form-control" id="user_password" name="user_password" placeholder="비밀번호" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
                <label for="pswd1">비밀번호</label>
             </div>
           
             <div class="form-floating" id="pswd2Img">
                <input type="password" class="form-control" id="user_passwordCheck" name="user_passwordCheck" onchange="PasswordCheck()" placeholder="비밀번호확인" class="int" title="비밀번호 재확인 입력" aria-describedby="pswd2Blind" maxlength="20">
                <label for="pswd2">비밀번호 확인</label>
             </div>
              
     		<div>
     			<span class="pw_ok">비밀번호가 일치합니다!</span>
     			<span class="pw_no">비밀번호가 일치하지 않습니다!</span>
     		</div>
     		
      		<div class="form-floating">
                <input type="text" class="form-control" id="user_name" name="user_name" placeholder="이름 입력">
                <label for="name">이름</label>
             </div>
     
     			<div class="d-flex">
              		<div class="form-floating">
		                <input type="text" class="form-control" id="user_email" name="user_email" placeholder="이메일 입력...">
		                <label for="tel">이메일</label>
              		</div>
              		<select class="form-control" name="user_email2" id="user_email2" >
			       <option>@naver.com</option>
			       <option>@daum.net</option>
			       <option>@gmail.com</option>
			       <option>@hanmail.com</option>
			        <option>@yahoo.co.kr</option>
		       </select>    
		       
              	</div>
           	<div class="input-group-addon">
				<button type="button" class="btn btn-primary" onclick="mailCheckBtn()">본인인증</button>
			</div>
			<div class="mail-check-box">
				<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
			</div>
			<span id="mail-check-warn"></span>
		
              
              <button class="w-70 btn btn-lg btn-primary" id="join-btn" disabled="disabled" type="submit">회원가입 완료</button>
              
           </form>
           <input type="hidden" name="idChk" value="invalid" />

	
	
        </main>
       
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
      
     </body>

</html>

