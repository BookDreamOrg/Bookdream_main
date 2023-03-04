function qna_btn() {
			var qna_user_no = $('#qna_user_no').val();
			var qna_type = $('#qna_type option:selected').val();
			var qna_title = $('#qna_title').val();
			var qna_content = $('#qna_content').val();
			
			let title = '문의 등록'
				let text = '작성한 문의를 등록하시겠습니까?.'
				let msg = '문의가 등록되었습니다.'
				let icon = 'question'
					
			console.log(qna_type);
			$.ajax({
				type : "POST",
				url : "/mypage/insertQnA",
				data : {
					user_no : qna_user_no,
					qna_type : qna_type,
					qna_title : qna_title,
					qna_content : qna_content
				},
				success : function(data) {
					if(data == 1){
						confirmed(title, text, icon, msg, function() {
							location.href = '/mypage/getMyQnAList';
					    })   
					} else if(data == -1) {
						alert('문의유형을 선택해주세요!');
						 history.go(1);
					} else {
						alert('빈칸이 있습니다!');
						 history.go(1);
					}
				},
				error : function() {
					alert('서버에러입니다.');
				}

			});
}




