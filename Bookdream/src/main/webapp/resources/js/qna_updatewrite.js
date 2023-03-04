function updateQnAIn(){
			var qna_no = $('#qna_no').val();
			var qna_type = $('#qna_type').val();
			var qna_title = $('#qna_title').val();
			var qna_content = $('#qna_content').val();
			console.log(qna_no);
			console.log(qna_type);
			console.log(qna_title);
			console.log(qna_content);
			let title = '문의 수정'
				let text = '문의를 수정하시겠습니까?'
				let msg = '문의가 수정되었습니다.'
				let icon = 'question'
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
				error : function(){
					alert('서버에러입니다.');
				}
			});
		}