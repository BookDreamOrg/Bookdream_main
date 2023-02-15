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
				
				html +=		`<tr class="mngmn_table_tr" value="${order.ORDER_NO}">
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
							<tr>
								<th>상품명</th>
								<th>개수</th>
								<th>가격</th>
							<tr>`	
								
			for (order of data) {
				
				html += `<tr>
							<td class="mngmn_dtls_table_col1">${order.TITLE}</td>
							<td class="mngmn_dtls_table_col2">${order.PRODUCT_COUNT}</td>
							<td class="mngmn_dtls_table_col3">${order.BOOK_PRICE}</td>
						 </tr>`	
			}
			
			html += `</table>`
			ById('order_mngmn_dtls').innerHTML = html
		},
		
		error : function(request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		
		}
		
	})
}













