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

// 쿠키 설정
$(function(){
	var answerCnt = $('#answerCnt').val();
	setCookie(answerCnt);
console.log('answerCnt: ' + answerCnt);
console.log('getCookie: ' + getCookie("answerCnt"));
console.log('쿠키 정보: ' + document.cookie);
console.log('qna');

if(document.cookie.length == 0){
	setCookie(answerCnt);
} else{
	if(answerCnt != getCookie("answerCnt")){
		console.log(getCookie(answerCnt));
		console.log('전값과 다름');
		if($('#qnanew-icon').css("display") == "none"){
			$('#qnanew-icon').show();
		}
	} else{
		console.log('전값과 같음');
		$('#qnanew-icon').hide();
	}
}
//		deleteCookie('answerCnt');
})

function setCookie(value){
	document.cookie = "answerCnt=" + value;
console.log('setcookie: ' + document.cookie);
}
function getCookie(cName){
var cName = cName + '=';

var cookieData = document.cookie;
var start = cookieData.indexOf(cName); //쿠키의 첫번째 인덱스값 가져옴

var cValue = '';
if(start != -1){
	start += cName.length;
	var end = cookieData.indexOf(';', start);
	if(end == -1){
		end = cookieData.length;
	}
	cValue = cookieData.substring(start, end);
}
return cValue;
}

function deleteCookie(name) {
	document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}

