	/***************************** 페이지 로딩 *****************************/
	$(function() {
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
	