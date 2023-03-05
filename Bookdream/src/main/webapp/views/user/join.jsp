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
	
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/join.css">
    <link rel="stylesheet" href="/resources/css/styles.css" />
    <title>회원가입 페이지</title>
    
</head>

    <body class="text-center">
        <main class="form-signin">
           <form action="insertUser.do" method="post" id="frm">
              <img class="mb-4" src="/resources/images/bookdream_img.png" alt="" width="160" height="70">
				<div>              
            		<div class="form-floating">
		                <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디 입력">
		                <label for="id">아이디</label>
	             	</div>
					<div class="d-grid">
						<button class="id_chk_btn w-20 btn btn-sm btn-outline-primary" id="btn" onclick="checkId()" type="button">
							<span class="text"><b>아이디 중복 확인</b></span>
						</button>
					</div>    
		             	<span class="id_ok">멋진 아이디네요!</span>
		             	<span class="id_already">사용중인 아이디 입니다.</span>
             	</div>
              
 <!-- 유효성 검사  -->
 
              <div class="form-floating" id="pswd1Img">
                <input type="password" class="form-control" id="user_password" name="user_password" onchange="PasswordCheck()" placeholder="비밀번호" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
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
		                <label for="email">이메일</label>
              		</div>
              		 <input type="text" class="form-control" id="user_email2" name="user_email2" value="@">
		       
              	</div>
           	<div class="input-group-addon d-grid">
				<button type="button" class="id_chk_btn w-20 btn btn-sm btn-outline-primary" id="btn_in" onclick="mailCheckBtn()">
					<span class="text"><b>본인인증</b></span>
				</button>
			</div>
			
			<div class="mail-check-box">
				<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
			</div>
			<span id="mail-check-warn"></span>
		
             <div>
             	<button class="join-submit w-70 btn btn-lg btn-outline-primary" id="join-btn" disabled="disabled" type="submit">회원가입 완료</button>
             </div> 
              
           </form>
           <input type="hidden" name="idChk" value="invalid" />

	
	
        </main>
       
      <script type="text/javascript" src="/resources/js/join.js"></script>
     </body>

</html>

