$(document).ready(function(e) {
	$('#unregister_check_btn').click(function() {
		const id = $('#unregister_id').val();
		const password = $('#unregister_password').val();

		// 패스워드 맞는지 확인
		$.ajax({
			url : "/mypage/deleteUser",
			type : "POST",
			data : {
				id : id,
				password : passowrd
			},
			success:function(data){
				console.log(data);
				if(data === "error"){
					alert('비밀번호를 입력해주세요');
				}
				else if(data === "password_error"){
					alert('회원 비밀번호가 일치하지 않습니다.');
				}				
			}, 
			error : function() {
				alert("서버 에러.");
			}
		});
	});
});