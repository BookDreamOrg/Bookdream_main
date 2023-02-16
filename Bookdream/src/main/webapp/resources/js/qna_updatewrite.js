function updateQnAIn(){
			var qna_no = $('#qna_no').val();
			var qna_type = $('#qna_type').val();
			var qna_title = $('#qna_title').val();
			var qna_content = $('#qna_content').val();
			console.log(qna_no);
			console.log(qna_type);
			console.log(qna_title);
			console.log(qna_content);
			
			$.ajax({
				type : "POST",
				url : "/mypage/updateQnAInfo",
				data : {
						qna_no : qna_no,
						qna_type : qna_type,
						qna_title : qna_title,
						qna_content : qna_content
						},
				success : function(data){
					alert('수정되었습니다.');
					location.href='/mypage/getMyQnAList';
				},
				error : function(){
					alert('서버에러입니다.');
				}
			});
		}