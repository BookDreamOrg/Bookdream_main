/*  */
$(function() {
	
	// 기본 값
	let pageNum = 1
	let srchCrtr = 'all'
	let srchKey = ''
		
	orderMngmn(pageNum, srchCrtr, srchKey)
})

/***************************** getElementById function *****************************/
function ById(id) {
	return document.getElementById(id);
}

/***************************** comma function *****************************/
function comma(value) {
	
	let comma = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

	return comma;
}
	
/***************************** switch case function *****************************/
function switchCase(data) {
	
	switch (data) {
	    case 0: return "결제완료"
	    case 1: return "배송중"	 
	    case 2: return "배송완료"	 
	    case 3: return "구매확정"	 
	    case 10: return "결제취소요청"	 
	    case 11: return "결제취소"	 
	    case 12: return "반품요청"	 
	    case 13: return "반품완료"	 
	}

}

/***************************** 주문 총 관리 function *****************************/
function orderMngmn(pageNum, srchCrtr, srchKey) {
	
	let data = {
			
			"pageNum" : pageNum,
			"srchCrtr" : srchCrtr,
			"srchKey" : srchKey
	}
	
	// 검색조건 세션 저장
	sessionStorage.setItem("pageNum", pageNum);
	sessionStorage.setItem("srchCrtr", srchCrtr);
	sessionStorage.setItem("srchKey", srchKey);
		
	$.ajax ({
		type : "GET",
		url : "/admin/mngmn",
		data : data,
		dataType : "json",
		contentType : "application/json",
		
		success : function(data) {

			let html = 	`<table class="mngmn_table">
						  	<tr>
								<th class="mngmn_table_th1">주문번호</th>
								<th class="mngmn_table_th2">ID</th>
								<th class="mngmn_table_th3">주문명</th>
								<th class="mngmn_table_th4">결제금액</th>
								<th class="mngmn_table_th5">결제수단</th>
								<th class="mngmn_table_th6">결제일시</th>
								<th class="mngmn_table_th7">결제상태</th>
							</tr>`	
				
			for(order of data.list) {
				
				let PRICE = comma(order.FINAL_PRICE)
				let STATUS = switchCase(order.ORDER_STATUS)
				
				html +=		`<tr class="mngmn_table_tr">
								<td class="mngmn_table_col1">${order.ORDER_NO}</td>
								<td class="mngmn_table_col2">${order.USER_ID}</td>
								<td class="mngmn_table_col3">${order.ORDER_NAME}</td>
								<td class="mngmn_table_col4">${PRICE}</td>
								<td class="mngmn_table_col5">${order.PAY_METHOD}</td>
								<td class="mngmn_table_col6">${order.ORDER_DATE}</td>
								<td class="mngmn_table_col7">${STATUS}</td>
							</tr>`
			
			}	
			    html += 	`</table>`
					
			    /* 페이징 */	
				let paging	
				
				paging  = `<div class="text-center paging_btn">
							<ul class="pagination justify-content-left">`
							
							if(data.page.prev) {
				paging +=		`<li class="page-item paginate_button previous">
									<button class="page-link paging_btn" value="${data.page.startPage-1}" ><</button>
								</li>`							
							}
							for (let i = data.page.startPage; i<=data.page.endPage; i++) {
								let active = pageNum == i ? 'active' : ''
				paging +=		`<li class="page-item paginate_button ${active} " >								
									<button class="page-link paging_btn " value="${i}" >${i}</button>
								</li>`							 
								 
							}	
							if(data.page.next) {
				paging +=		`<li class="page-item paginate_button next">
									<button class="page-link paging_btn" value="${data.page.endPage+1}">></button>
								</li>`						
							}																		
	
								
				paging +=	`</ul>
						</div>`					    	
				    	
			ById('order_mngmn').innerHTML = html
			ById('paging').innerHTML = paging
			
			
			
		},
		
		error : function(request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		
		}
	})
}

/***************************** 페이징 버튼 클릭 *****************************/
$(document).on("click", "button.paging_btn", function(e) {	
	
	ById('dtls-box').style.display = "none"	
			
	let pageNum = e.currentTarget.value	

	// 페이지 이동시 검색조건,검색키워드 유지됨
	let srchCrtr = sessionStorage.getItem("srchCrtr");	
	let srchkey = sessionStorage.getItem("srchKey");

	orderMngmn(pageNum, srchCrtr, srchkey)
})

/***************************** 조건 검색 버튼 클릭 *****************************/
$(document).on("click", "#srch_btn", function(e) {	
	srchOrders()
})

/***************************** 검색입력후 클릭! *****************************/
$(document).on("keyup", "#srch_key", function(e) {	

	// 엔터키를 누른다면 (13)
	if (e.keyCode == 13) {
		srchOrders()
	}
})

/***************************** 조건검색 FUNCTION *****************************/
function srchOrders() {
	
	ById('dtls-box').style.display = "none"	
		
	let srchCrtr = ById('srch_crtr').value
	let srchkey = ById('srch_key').value
	
	let pageNum = 1
	
	// 검색 시 기존세션 초기화
	sessionStorage.removeItem("pageNum");
	sessionStorage.removeItem("srch_crtr");
	sessionStorage.removeItem("srch_key");
	
	orderMngmn(pageNum, srchCrtr, srchkey)	
}



/***************************** 세부내역 확인 *****************************/
$(document).on("click", "tr.mngmn_table_tr", function(e) {	
	
	let order_no = e.currentTarget.cells[0].innerText
	
	ById('dtls-box').style.display = "block"
	
	orderMngmnDtls(order_no)
})

/***************************** 주문 상세 테이블 FUNCTION *****************************/
function orderMngmnDtls(order_no) {

	let data = { "order_no" : order_no }
		
	$.ajax ({
		type : "GET",
		url : "/admin/mngmnDtls",
		data : data,
		dataType : "json",
		contentType : "application/json",
		
		success : function(data) {
			
			console.log(data)
			
			let html = `<table class="mngmn_dtls_table">
							<thead>
								<tr>
									<th class="mngmn_dtls_table_th1">상품명</th>
									<th class="mngmn_dtls_table_th2">개수</th>
									<th class="mngmn_dtls_table_th3">가격</th>
								</tr>
							</thead>`	
								
			for (order of data) {
				
				let PRICE = comma(order.BOOK_PRICE)
				
				html += `<tbody>
							  <tr>
								<td class="mngmn_dtls_table_col1">${order.TITLE}</td>
								<td class="mngmn_dtls_table_col2">${order.PRODUCT_COUNT}</td>
								<td class="mngmn_dtls_table_col3">${PRICE}</td>
							 </tr>
						</tbody>`							 
			}
			
			html += `</table>`
							
			let TOTAL_PRICE = comma(order.TOTAL_PRICE)				
			let PAY_FEE = comma(order.PAY_FEE)				
			let USE_POINT = comma(order.USE_POINT)				
			let FINAL_PRICE = comma(order.FINAL_PRICE)				
			let SAVE_POINT = comma(order.SAVE_POINT)				
				
			let STATUS = switchCase(data[0].ORDER_STATUS)		
			let CANCEL_DATE = data[0].CANCEL_DATE === undefined ? 'N' : data[0].CANCEL_DATE
			let BTN = data[0].ORDER_STATUS == (10 || 12) ? `<a class="btns">요청승인</a>` : '' 	
					
					
			let info = `<div class="info-box_title">주문정보</div>
			
						<ul class="info-box_ul1">
							<li class="text-left">상품금액</li>
							<li class="text-left"><span class="text-right">${TOTAL_PRICE}</span></li>
							<li class="text-left">배송비</li>
							<li class="text-left"><span class="text-right">${PAY_FEE}</span></li>							
							<li class="text-left">사용포인트</li>
							<li class="text-left"><span class="text-right">${USE_POINT}</span></li>	
							<hr>
							<li style="height: 0px;"></li>
							<li class="text-left">적립포인트</li>
							<li class="text-left"><span class="text-right">${SAVE_POINT}</span></li>								
							<li class="text-left">결제금액</li>
							<li class="text-left"><span class="text-right fianl_price">${FINAL_PRICE}</span></li>							
						</ul>	
						
						<table class="info-box_table">
							<tr>
								<th>받는사람</th>
								<td>${data[0].ORDER_RECEIVER}</td>
								<th>전화번호</th>
								<td>${data[0].ORDER_TEL}</td>
							</tr>
							
							<tr>
								<th colspan="4">주소</th>
							</tr>
							
							<tr>
								<td colspan="4">${data[0].ORDER_ADDRESS}</td>
							</tr>
							<tr>
								<th colspan="4">배송요청사항</th>
							</tr>	
							<tr>
								<td colspan="4">${data[0].ORDER_COMMENT}</td>
							</tr>		
							
							<tr>
								<th>결제시간</th>
								<td>${data[0].ORDER_DATE}</td>
								<th>배송상태</th>
								<td>${STATUS}</td>
							</tr>
							
							<tr>
								<th>요청시간</th>
								<td>${CANCEL_DATE}</td>
								<th>승인</th>

	
			
								<td>${BTN}</td>
							</tr>												
						</table>`	
				
								
			ById('table-box').innerHTML = html
			ById('info-box').innerHTML = info
		},
		
		error : function(request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		
		}
		
	})
}

/***************************** 세부내역 확인 *****************************/
$(document).on("click", ".mngmn_table_tr", function(e) {	

	const rows = document.getElementsByClassName("mngmn_table_tr");

	for (let i = 0; i < rows.length; i++) {
	  rows[i].addEventListener("click", function() {
	    for (let j = 0; j < rows.length; j++) {
	      rows[j].style.backgroundColor = "";
	    }
	    this.style.backgroundColor = "#e0e0ee";
	  });
	}
	
})











