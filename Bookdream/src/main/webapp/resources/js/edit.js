function updateUser() {
			var id = $('#user_id').val();
			var password = $('#user_password').val();
			var password_check = $('#user_passwordcheck').val();
			var name = $('#user_name').val();
			var email = $('#user_email').val();

			$.ajax({
				url : '/mypage/updateUser',
				type : 'post',
				data : {
					id : id,
					password : password,
					password_check : password_check,
					name : name,
					email : email
				},
				success : function(data) {
					console.log(data);
					if (data === "error") {
						alert('입력칸을 확인해주세요!');
					} else if (data === "password_error") {
						alert('비밀번호가 달라요!');
					} else {
						$('#modal').fadeOut();
						location.href=data;
					}

				},
				error : function() {
					alert('서버 에러입니다.');
				}
			});

		}

		function PasswordCheck() {
			var pw = $('#user_password').val();
			var pwCheck = $('#user_passwordcheck').val();

			if (pw != pwCheck) { // 비밀번호가 일치하지 않는다면
				$('.pw_no').css("display", "inline-block");
				$('.pw_ok').css("display", "none");
			} else { // 비밀번호가 일치한다면
				$('.pw_no').css("display", "none");
				$('.pw_ok').css("display", "inline-block");
			}
		};
		
		function unregisterCheck() {
			const checkbox = document.getElementById('unregister_agree');
			const agree = checkbox.checked;
			var unregisterBtn = document.getElementById('unregister_btn');
			
			if(agree) {
				unregisterBtn.toggleAttribute('disabled');
			} else {
				unregisterBtn.setAttribute('disabled', true);
			}
		};
		
		
		function deleteUser() {
			const id = $('#unregister_id').val();
			const password = $('#unregister_password').val();

			// 패스워드 맞는지 확인
			$.ajax({
				url : "/mypage/deleteUser",
				type : "POST",
				data : {
					id : id,
					password : password
				},
				success : function(data) {
					console.log(data);
					if (data === "error") {
						alert('비밀번호를 입력해주세요');
					} else if (data === "password_error") {
						alert('회원 비밀번호가 일치하지 않습니다.');
					} else {
						$('#unregisterCheckModal').modal('hide');
						alert('회원탈퇴가 완료되었습니다.')
						document.location.replace(data);
					}
				},
				error : function() {
					alert("서버 에러.");
				}
			});

		};