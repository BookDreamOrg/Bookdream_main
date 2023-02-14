function qna_btn() {
			var qna_user_no = $('#qna_user_no').val();
			var qna_type = $('#qna_type').val();
			var qna_title = $('#qna_title').val();
			var qna_content = $('#qna_content').val();
			console.log(user_no);
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
					alert('문의완료');
					location.href = '/mypage/getMyQnAList';
				},
				error : function() {
					alert('서버에러입니다.');
				}

			});
}