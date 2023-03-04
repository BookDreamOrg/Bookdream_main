/***************************** 페이지 로딩 *****************************/
$(function() {
	
	let pageNum = 1
	
	reviewList(pageNum)

})

/***************************** reviewList function *****************************/
function reviewList(pageNum) {
    
	let data = {"pageNum" : pageNum}
		
	$.ajax ({
		type : 'GET',
		url : '/mypage/reviewList',
		data: data,
		dataType : 'json',		
		contentType : "application/json",		
				
		success : function(data) {	
				
			// 페이지번호 세션저장
			sessionStorage.setItem("pageNum", pageNum);
			
			// 데이터가 있어야 계산
			if (data.cnt.AVG_STAR != undefined) {
				
		    // 채워진 별점의 백분율 계산
		    let percentage = (data.cnt.AVG_STAR / 5) * 100;
		    
			// 별점 수소점 2자리까지 표시
			let num = data.cnt.AVG_STAR
			let roundedNum = num.toFixed(2);
			
		    // 별점을 채울 요소 선택
		    let starsInner = ById('stars-inner')
	   	   
		    // 요소의 너비를 채워진 별점의 백분율로 설정
		    starsInner.style.width = percentage + '%';				    
		    
		    // 별점 텍스트 업데이트
		    ById('number-rating').innerHTML = '(' + roundedNum + ')'	    
		    ById('review_cnt').innerHTML = data.cnt.CNT
		    ById('review_rcmnd').innerHTML = data.cnt.SUM_RCMND
		    
			}
		    
		    /* 리뷰 목록 */
	    
		    
		    let html = ''
		    	
		    for (let review of data.list) {
		    	
			html +=	`	<table class="reviewlist_table">
							<tr>
								<td rowspan="2"><img style="width: 50px; height: 70px; border: 1px solid #ccc; margin-top:10px;" src="${review.BOOK_IMG}" alt="img"></td>
								<th colspan="3">${review.TITLE}</th>
							</tr>
							
							<tr>
								<td colspan="3">
									<div class="star-outer">
									  <div class="stars-inner" id="review_star${review.REVIEW_NO}"></div>
									</div>
									<span id="star_text"></span>	
									
									<i class="bi bi-hand-thumbs-up" style="font-size:14px; margin:0px 10px 0px 10px;"> ${review.REVIEW_RECOMMEND}</i>
																	
									<span style="font-size:12px; color:#CCC;">${review.REVIEW_DATE}</span>

								</td>
							</tr>
							
							<tr>
								<td colspan="3">${review.REVIEW_CONTENT}</td>

								<td>
									<button class="btn btn-outline-primary review_update_btn" value="${review.REVIEW_NO}"><i class="bi bi-pen"><span style="font-size:10px; font-weight: bold;"> 수정<span></i>
									<button class="btn btn-outline-primary review_delete_btn" value="${review.REVIEW_NO}"><i class="bi bi-trash"><span style="font-size:10px; font-weight: bold;"> 삭제<span></i>
								</td>
								<input type="hidden" value="${review.REVIEW_CONTENT}"/>								
							</tr>
						</table>`
				
			
						
		    }

		    /* 페이징 */	
			
			let prevDisabled = data.page.prev == true ? '' : 'disabled'
			let nextDisabled = data.page.next == true ? '' : 'disabled'
			
			paging = `<div class="text-center paging_btn">
						<ul class="pagination justify-content-left">
						
					  <li class="page-item paginate_button previous">
						<button class="page-link paging_btn ${prevDisabled}" value="${data.page.startPage-1}" ><i class="fas fa-angle-left"></i></button>
					  </li>`							

						for (let i = data.page.startPage; i<=data.page.endPage; i++) {
							let active = pageNum == i ? 'active' : ''
			paging +=		`<li class="page-item paginate_button ${active} " >								
								<button class="page-link paging_btn " value="${i}" >${i}</button>
							</li>`							 
							 
						}	
			paging +=		`<li class="page-item paginate_button next">
								<button class="page-link paging_btn ${nextDisabled}" value="${data.page.endPage+1}"><i class="fas fa-angle-right"></i></button>
							</li>						

					 	</ul>
					</div>`			    
		    
		    ById('reviewlist').innerHTML = html
			ById('paging').innerHTML = paging
			
		    // 동적부분 생성후 별점 표시
		    for (let review of data.list) {

			    let percent = (review.REVIEW_STAR / 5) * 100
				
			    let starsInner = ById(`review_star${review.REVIEW_NO}`)		   	    
			    
		    	starsInner.style.width = percent + '%';		    	
		    }
		    
		},
				
		error: function(request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}	
	})
}


/***************************** 페이징 버튼 클릭 *****************************/
$(document).on("click", "button.paging_btn", function(e) {	
				
	let pageNum = e.currentTarget.value	


	reviewList(pageNum)
})



/***************************** 리뷰 삭제버튼 *****************************/
$(document).on("click", "button.review_delete_btn", function(e) {	
	
	let title = '리뷰 삭제'
	let text = '리뷰를 삭제하시겠습니까?'
	let msg = '리뷰가 삭제되었습니다.'
	let icon = 'warning'
	let review_no = e.currentTarget.value
	
	confirmed(title, text, icon, msg, function() {
        deleteReview(review_no)
    })
})


function deleteReview(review_no) {
	
	let data = "review_no=" + review_no
		
	$.ajax ({
		type : 'GET',
		url : '/deleteReview',
		data: data,
		dataType : 'text',		
		contentType : "application/json",		
				
		success : function() {	

			let pageNum = sessionStorage.getItem("pageNum")
			reviewList(pageNum)
		},
		
		error: function(request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}
		
	})
}

/***************************** 리뷰 수정버튼 *****************************/
$(document).on("click", "button.review_update_btn", function(e) {	
	
	// 리뷰번호
    let review_no = e.currentTarget.value 
    // 버튼이 속한 행의 첫 번째 td 태그의 텍스트 값을 가져옴
    let review_content = e.target.closest('tr').querySelector('td:first-child').textContent; 
    
    let html = `<textarea class="review_content" style="width:100%; height:90%; min-height: 100px; max-height: 300px;">${review_content}</textarea>`
    		
    let btns = `<button class="btn btn-outline-primary review_submit_btn" value="${review_no}"><i class="bi bi-check"><span style="font-size:10px; font-weight: bold;"> 등록<span></i>
			    <button class="btn btn-outline-primary review_cancel_btn" value="${review_no}"><i class="bi bi-x"><span style="font-size:10px; font-weight: bold;"> 취소<span></i>`
    
    e.target.closest('tr').querySelector('td:first-child').innerHTML = html
    e.target.closest('tr').querySelector('td:nth-child(2)').innerHTML = btns

})

/***************************** 리뷰 수정버튼 후 취소버튼 *****************************/
$(document).on("click", "button.review_cancel_btn", function(e) {	

	let title = '수정 취소'
	let text = '수정중인 내용은 초기화 됩니다.'
	let msg = '수정이 취소되었습니다.'
	let icon = 'warning'
    let review_no = e.currentTarget.value 
    let review_content = e.target.closest('tr').querySelector('input[type=hidden]').value
  
    confirmed(title, text, icon, msg, function() {
		
	    let	btns = `<button class="btn btn-outline-primary review_update_btn" value="${review_no}"><i class="bi bi-pen"><span style="font-size:10px; font-weight: bold;"> 수정<span></i>
					<button class="btn btn-outline-primary review_delete_btn" value="${review_no}"><i class="bi bi-trash"><span style="font-size:10px; font-weight: bold;"> 삭제<span></i>`

	    e.target.closest('tr').querySelector('td:first-child').innerHTML = review_content	
	    e.target.closest('tr').querySelector('td:nth-child(2)').innerHTML = btns   
    })


})


/***************************** 리뷰 수정버튼 후 등록버튼 *****************************/
$(document).on("click", "button.review_submit_btn", function(e) {	
	
	let title = '리뷰 수정'
	let text = '작성한 리뷰가 수정됩니다.'
	let msg = '리뷰가 수정되었습니다.'
	let icon = 'question'		
		
    let review_no = e.currentTarget.value 
    let review_content = e.target.closest('tr').querySelector('textarea').value; 
 
	confirmed(title, text, icon, msg, function() {
	    updateReview(review_no, review_content)  
    })    

      
})

/***************************** 리뷰 수정 FUNCTION *****************************/
function updateReview(review_no, review_content) {

	
	let data = {"review_no" : review_no,
			    "review_content" : review_content}	
	$.ajax ({
		type : 'POST',
		url : '/updateReview',
		data: data,	
				
		success : function() {	
			
			let pageNum = sessionStorage.getItem("pageNum")
			reviewList(pageNum)
		},
		
		error: function(request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}
		
	})
}



