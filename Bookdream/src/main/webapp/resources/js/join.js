const count = 0;
function checkId(){
             var id = $('#user_id').val(); //id값이 "id"인 입력란의 값을 저장
             $.ajax({
                 url:'/member/idCheck.do', //Controller에서 요청 받을 주소
                 type:'post', //POST 방식으로 전달
                 data:{id:id},
                 success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                     if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                         $('.id_ok').css("display","inline-block"); 
                         $('.id_already').css("display", "none");
                     } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                         $('.id_already').css("display","inline-block");
                         $('.id_ok').css("display", "none");
                         alert("사용중인 아이디입니다.");
                         $('#user_id').val('');
                         
                     }
                 },
                 error:function(){
                     alert("에러입니다");
                 }
             });
 };
 
 function PasswordCheck(){
	 var pw = $('#user_password').val();
     var pwCheck = $('#user_passwordCheck').val(); 
     
		if(pw != pwCheck){ // 비밀번호가 일치하지 않는다면
			$('.pw_no').css("display","inline-block");
			$('.pw_ok').css("display", "none");
		} else{ // 비밀번호가 일치한다면
			$('.pw_no').css("display","none");
			$('.pw_ok').css("display", "inline-block");
		}
 };
 
 // 메일 인증
 function mailCheckBtn(){
	 
	 const email = $('#user_email').val() + $('#user_email2').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
		$.ajax({
			type : 'get',
			url : '/member/mailCheck?email=' + email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
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
		         $('#join-btn').attr("disabled" , false);
			}else{
				$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
				$resultMsg.css('color','red');
			}
		});
 }

 
 
 
