function answer_btn(value,index) {
			
			var user_num = value;
			let node_list = document.querySelectorAll('.form_textarea');
			var ans_content = node_list[index].value;
			
			let qnano_list = document.querySelectorAll('.qna_nocls');
			var qna_no = qnano_list[index].value;
			
			console.log(user_num);
			console.log(ans_content);
			console.log(qna_no);
			
			$.ajax({
				type : "POST",
				url : "/admin/user/answerQnA",
				data : {
					user_no : user_num,
					ans_content : ans_content,
					qna_no : qna_no
				},
				success : function(data) {
					alert('답변완료 되었습니다.');
					location.href='/admin/user/getAllQnAList';
				},
				error : function() {
					alert('서버에러입니다.');
				}
			});

		}