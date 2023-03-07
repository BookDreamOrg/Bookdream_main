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
  <!-- Favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="/resources/images/favicon/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="/resources/images/favicon/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/favicon/favicon-16x16.png" />
<link rel="manifest" href="/resources/images/favicon/site.webmanifest" />

   <link rel="stylesheet" href="/resources/css/login.css">
   <link rel="stylesheet" href="/resources/css/styles.css" />
    <title>북드림 로그인 페이지</title>
    
</head>
<body class="text-center">
    <main class="form-signin">
       <form action="login.do" method="post" onsubmit="return frm_check()">
       <img class="mb-4" src="/resources/images/bookdream_img.png" alt="" width="160" height="70">
          
          <div class="form-floating">
             <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디를 입력해 주세요">
             <label for="id">아이디</label>
          </div>	
          <div class="form-floating">
             <input type="password" class="form-control" id="user_password" name="user_password" placeholder="패스워드를 입력해 주세요">
             <label for="password">비밀번호</label>
          </div>
          <div class="btn_wrap justify">
          	<div class="d-grid">
          	 <button class="login_btn w-20 btn btn-sm btn-outline-primary" type="submit">
          	 	<span class="text"><b>로그인</b></span>
          	 </button>
          	</div>
          <div class="save_id_box">
          	<span class="form_chk">
          		<label class="formSaveId">
          			<input class="form-check-input" type="checkbox" value="remember-me" id="saveId">
          			<span class="btn_text_link">아이디 저장</span>
          		</label>
          	</span>
          	<span><a href="idfind.jsp" class="btn_text_link">아이디·비밀번호 찾기</a></span>
          </div>
          
        
        </div>
        
   
       </form>
       
 		<div class="sns_login_box">
          	<ul class="sns_login_list">          	
          		<li class="sns_login_item">
          		<button onclick="kakaoLogin()" class="sns_login_btn">
          			<img src="/resources/images/kakao_login2.PNG" class="rounded-circle" width="50px" height="45px">
          		</button>	 
          		</li>
          		<li class="sns_login_item">
	          		<button onclick="naverLogin()" class="sns_login_btn">
          				<img src="/resources/images/naver_login.png" class="rounded-circle" width="50px" height="45px">
          			 </button>
          		</li>
          		<li class="sns_login_item">	
          			<button onclick="googleLogin()" class="sns_login_btn">
          				<img src="/resources/images/google_login.PNG" class="rounded-circle" width="50px" height="45px">
          			</button>
          		</li>
          	</ul>
          </div>
          
          <div class="d-grid">
          	 <button class="login_btn w-20 btn btn-sm btn-outline-primary" type="button" onclick="location.href='join.jsp'">
          	 	<span class="text"><b>회원가입</b></span>
          	 </button>
          </div>
    </main>
    
    <script src="/resources/js/socialLogin.js"></script>
     
     
    <!-- 로그인 실패시  -->
    <script type="text/javascript"> 
    
    	//아이디 중복
	    $(function() {
	        fnInit();
	  	});
    
    	function frm_check(){
    			saveid();	
   	 		}
    
    	function fnInit(){
            var cookieid = getCookie("saveid");
            console.log(cookieid);
            if(cookieid !=""){
                $("input:checkbox[id='saveId']").prop("checked", true);
                $('#user_id').val(cookieid);
            }
            
        }    
    	
	   function setCookie(name, value, expiredays) {
	       var todayDate = new Date();
	       todayDate.setTime(todayDate.getTime() + 0);
	       if(todayDate > expiredays){ // 오늘날짜보다 작다면 쿠키삭제
	           document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
	       }else if(todayDate < expiredays){ // 오늘날짜 보다 크다면 한달추가
	           todayDate.setDate(todayDate.getDate() + expiredays);
	           document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	       }
	       console.log(document.cookie);
	   }
    
	   function getCookie(Name) {
	        var search = Name + "=";
	        console.log("search : " + search);
	        
	        if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
	            offset = document.cookie.indexOf(search);
	            console.log("offset : " + offset);
	            if (offset != -1) { // 쿠키가 존재하면 
	                offset += search.length;
	                // set index of beginning of value
	                end = document.cookie.indexOf(";", offset);
	                console.log("end : " + end);
	                // 쿠키 값의 마지막 위치 인덱스 번호 설정 
	                if (end == -1)
	                    end = document.cookie.length;
	                console.log("end위치  : " + end);
	                
	                return unescape(document.cookie.substring(offset, end));
	            }
	        }
	        return "";
	    }
	   
	   // 체크되어있다면 쿠키저장
	    function saveid() {
	        var expdate = new Date();
	        if ($("#saveId").is(":checked")){
	            expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 3);
	            setCookie("saveid", $("#user_id").val(), expdate);
            }else{
	           expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 3);
	            setCookie("saveid", $("#user_id").val(), expdate);
	             
	        }
	    }
	    var message = '${loginMsg }'; 
		var returnUrl = '${loginUrl }'; 
		
		if(message){
			alert(message);
		} 
		
		document.location.href = url; 
		
		
	</script>
	
 </body>
</html>
