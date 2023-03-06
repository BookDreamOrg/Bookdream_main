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
   <link rel="stylesheet" href="/resources/css/login.css">
   <link rel="stylesheet" href="/resources/css/styles.css" />
    <title>북드림 아이디/비밀번호 찾기 페이지</title>
    
</head>
<body class="text-center">
    <main class="form-signin">
       <img class="mb-4" src="/resources/images/bookdream_img.png" alt="" width="160" height="70">
	          <ul class="nav nav-tabs d-flex flex-row justify-content-center">
	          	<li class="nav-item">
	          		<a class="nav-link active text-muted" data-bs-toggle="tab" href="#idfind"> 아이디 찾기</a>
	          	</li>
	          	<li class="nav-item">
	          		<a class="nav-link text-muted" data-bs-toggle="tab" href="#pwfind">비밀번호 찾기</a>
	          	</li>
	          </ul>
          <div class="tab-content">
          	<div class="tab-pane container active" id="idfind">
		         		<div class="form-floating">
		           <div></div>
		            <input type="text" class="form-control" id="user_name" name="user_name" placeholder="이름를 입력해 주세요">
		            <label for="name">이름</label>
		         </div>	
		         <div class="form-floating">
		            <input type="text" class="form-control" id="user_email" name="user_email" placeholder="이메일를 입력해 주세요">
		            <label for="email">이메일</label>
		         </div>
		        
		         <br>
		         <div class="d-grid">
		         	 <button class="login_btn w-20 btn btn-sm btn-outline-primary" onclick="idFind()">
		         	 	<span class="text"><b>아이디 찾기</b></span>
		         	 </button>
		         </div>
          	</div>
          	
          	<div class="tab-pane container fade" id="pwfind">
		          		<div class="form-floating">
		             <input type="text" class="form-control" id="user_id2" name="user_id" placeholder="아이디를 입력해 주세요">
		             <label for="id">아이디</label>
		          </div>
		          <div class="form-floating">
		             <input type="text" class="form-control" id="user_name2" name="user_name" placeholder="이름를 입력해 주세요">
		             <label for="name">이름</label>
		          </div>	
		          <div class="d-flex">
		              		<div class="form-floating">
				                <input type="text" class="form-control" id="user_email_2" name="user_email" placeholder="이메일 입력...">
				                <label for="tel">이메일</label>
		              		</div>
		              		<div class="form-floating">
				                <input type="text" class="form-control" value="@" id="user_email2_2" name="user_email2" placeholder="이메일 입력...">
				                <label for="email">도메인</label>
              				</div>
				       
		              	</div>
		          <br>
		          
		          <div class="mail-check-box">
						<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
					</div>
					<span id="mail-check-warn"></span>
					<br>
		         <div class="input-group-addon d-grid">
						<button type="button" class="id_chk_btn w-20 btn btn-sm btn-outline-primary" id="btn_in" onclick="mailCheckBtn()">
							<span class="text"><b>본인인증</b></span>
						</button>
				</div>
		          <br>
		          <div class="d-grid">
		          	 <button class="login_btn w-20 btn btn-sm btn-outline-primary" id="pwfind-btn" disabled="disabled" onclick="pwFind()">
		          	 	<span class="text"><b>비밀번호 찾기</b></span>
		          	 </button>
		          </div>
          	</div>
          </div>
          
    </main>
     
    <script type="text/javascript">
    	function idFind(){
    		var name = $('#user_name').val();
    		var email = $('#user_email').val();
    		$.ajax({
    			url:'/views/user/idfindUser.do',
    			type:'post',
    			data:{name : name,
    				  email : email},
    			success:function(data){
    				if(data == ""){
    					alert('아이디 정보 없음');
    				} else{
    					location.href='idfindResult.jsp';
    				}
    			},
    			error:function(){
    				alert('에러입니다');
    			}
    		});
    	}
    	
    	function pwFind(){
    		var id = $('#user_id2').val();
    		var name = $('#user_name2').val();
    		var email = $('#user_email_2').val() + $('#user_email2_2').val();
    		$.ajax({
    			url:'/views/user/pwfindUser.do',
    			type:'post',
    			data:{id : id,
    				  name : name,
    				  email : email},
    			success:function(data){
    				if(data == ""){
    					alert('정보가 없습니다.');
    				} else{
    					location.href='pwfindResult.jsp';
    				}
    			},
    			error:function(){
    				alert('에러입니다');
    			}
    		});
    	}
    	
    	// 메일 인증
    	 function mailCheckBtn(){
    		 
    		 const email = $('#user_email_2').val() + $('#user_email2_2').val(); // 이메일 주소값 얻어오기!
    			console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
    			const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
    			
    			$.ajax({
    				type : 'get',
    				url : '/user/mailCheck?email=' + email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
    				success : function (data) {
    					console.log("data : " +  data);
    					checkInput.attr('disabled',false);
    					code = data;
    					alert('인증번호가 전송되었습니다.');
    				},
    				error:function(){
    					alert('서버 에러입니다.');
    				}
    			}); // end ajax
    			
    			// 인증번호 비교 
    			// blur -> focus가 벗어나는 경우 발생
    			$('.mail-check-input').blur(function () {
    				const inputCode = $(this).val();
    				const $resultMsg = $('#mail-check-warn');
    				
    				if(inputCode === code){
    					$resultMsg.html('인증번호가 일치합니다.');
    					$resultMsg.css('color','green');
    					$('#mail-Check-Btn').attr('disabled',true);
    					$('#user_email').attr('readonly',true);
    					$('#user_email2').attr('readonly',true);
    					$('#user_email2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
    			         $('#user_email2').attr('onChange', 'this.selectedIndex = this.initialSelect');
    			         $('#pwfind-btn').attr("disabled" , false);
    				}else{
    					$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
    					$resultMsg.css('color','red');
    				}
    			});
    	 }
    </script>
 </body>
</html>
