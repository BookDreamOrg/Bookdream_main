function delete_btn(value){
	var qna_no = value;
	console.log(qna_no);
	$.ajax({
		type : "POST",
		url : "/mypage/deleteQnA",
		data : {qna_no : qna_no},
		success : function(data){
			alert('삭제 되었습니다.');
			location.href='/mypage/getMyQnAList'
		},
		error : function(){
			alert('서버에러입니다.')
		}
	});
}
