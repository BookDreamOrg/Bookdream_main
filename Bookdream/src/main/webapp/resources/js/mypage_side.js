	/***************************** 페이지 로딩 *****************************/
	$(function() {
		// new표시 Check 쿠키 설정
		var answerCnt = $('#answerCnt').val();
		console.log('answerCnt: ' + answerCnt);
		console.log('getCookie: ' + getCookie("answerCnt"));
		console.log('쿠키 정보: ' + document.cookie);
		console.log('saveid정보: ' + getCookie("saveid"));
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
		
		
		rcmnd_book();
	})
	
	function rcmnd_book() {
		
		$.ajax({
			type : "POST",                              
			url : "/mypage/rcmndBookList",
			dataType : "json",
			contentType : "application/json",		
				
			success : function(data) {
				console.log(data)
				var html = '';
				
				for(i=0; i<data.length; i++) {
					
				var active = (i==0) ? 'active' : '' 
	
				html += `<div class="carousel-item ${active} " data-bs-interval="5000">
		    				<a href="/getBook?book_no=${data[i].BOOK_NO}"><img class="recmnd_carousel_img" src="${data[i].BOOK_IMG}" class="" alt="사진입니다."></a> 
		   				</div>`				
				}		
				document.getElementById('carousel-inner').innerHTML = html;
			},
			
			error: function(request, status, error) {
			       console.log("code: " + request.status)
			       console.log("message: " + request.responseText)
			       console.log("error: " + error);
		        
			}	
		
		})		
	}
	
	
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