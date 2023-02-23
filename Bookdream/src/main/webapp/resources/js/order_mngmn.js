/*  */
$(function() {

	defaultSrch()
		
})


/* 공통 FUNCTION */


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

/***************************** 초기 검색 function *****************************/
function defaultSrch() {
	
	// 기본 값
	let pageNum = 1
	let srchCrtr = 'all'
	let srchKey = ''
	let status = 100
	let start_date = '23.01.01'
	let end_date = '23.12.31'
	
	orderMngmn(pageNum, srchCrtr, srchKey, status, start_date, end_date)
}


/***************************** Session 삭제 FUNCTION *****************************/
function removeSession() {
	
	sessionStorage.removeItem("pageNum")
	sessionStorage.removeItem("srch_crtr")
	sessionStorage.removeItem("srch_key")
	sessionStorage.removeItem("order_no")
	sessionStorage.removeItem("start_date")
	sessionStorage.removeItem("end_date")
}

/***************************** Session 호출 FUNCTION *****************************/
function getItemSession() {
	
	let pageNum = sessionStorage.getItem("pageNum");	
	let srchCrtr = sessionStorage.getItem("srchCrtr");	
	let srchKey = sessionStorage.getItem("srchKey");
	let status = sessionStorage.getItem("status");
	let start_date = sessionStorage.getItem("start_date");
	let end_date = sessionStorage.getItem("end_date");

	orderMngmn(pageNum, srchCrtr, srchKey, status, start_date, end_date)
}

/* 공통 FUNCTON 끝 */


/***************************** 상단 배송상태별 조회 버튼 *****************************/
$(document).on("click", "label.orderclsfc_btn", function(e) {	 
	
	ById('dtls-box').style.display = "none"	

	let status = e.target.control.value
	
	/*
	ById('srch_crtr').selectedIndex = 0
	ById('srch_key').value = null
	*/
		
	/* 
	let pageNum = 1
	let srchCrtr = 'all'
	let srchKey = ''
			
	// 기존세션 삭제
	sessionStorage.removeItem("pageNum");
	sessionStorage.removeItem("srch_crtr");
	sessionStorage.removeItem("srch_key");
	sessionStorage.removeItem("order_no");
	sessionStorage.removeItem("start_date");
	sessionStorage.removeItem("end_date");
	
	console.log("status : " + status)
	*/
	
	let pageNum = sessionStorage.getItem("pageNum");	
	let srchCrtr = sessionStorage.getItem("srchCrtr");	
	let srchKey = sessionStorage.getItem("srchKey");
	//let status = sessionStorage.getItem("status");
	let start_date = sessionStorage.getItem("start_date");
	let end_date = sessionStorage.getItem("end_date");

	orderMngmn(pageNum, srchCrtr, srchKey, status, start_date, end_date)
	
})


/***************************** 페이징 버튼 클릭 *****************************/
$(document).on("click", "button.paging_btn", function(e) {	
	
	ById('dtls-box').style.display = "none"	
			
	let pageNum = e.currentTarget.value	

	// 페이지 이동시 검색조건,검색키워드 유지됨
	let srchCrtr = sessionStorage.getItem("srchCrtr");	
	let srchkey = sessionStorage.getItem("srchKey");
	let status = sessionStorage.getItem("status");
	let start_date = sessionStorage.getItem("start_date");
	let end_date = sessionStorage.getItem("end_date");

	orderMngmn(pageNum, srchCrtr, srchkey, status, start_date, end_date)
})

/***************************** 기간검색 INPUT BOX 생성 *****************************/
$(function() {

    let start = moment().startOf('year')	
    let end = moment()

    cb(start, end)
 
    $('#reportrange').daterangepicker({
        "locale": {
            "format": "YYYY-MM-DD",
            "separator": " ~ ",
            "applyLabel": "확인",
            "cancelLabel": "취소",
            "fromLabel": "From",
            "toLabel": "To",
            "customRangeLabel": "직접입력",
            "weekLabel": "W",
            "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        },
    	startDate: start,
        endDate: end,
        ranges: {
           '오늘': [moment(), moment()],
           '어제': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
           '일주일': [moment().subtract(6, 'days'), moment()],
           '한달': [moment().subtract(29, 'days'), moment()],
           '이번달': [moment().startOf('month'), moment().endOf('month')],
           '저번달': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        }
    }, cb);    
    
});

function cb(start, end) {

    $('#reportrange span').html(start.format('YY.MM.DD') + ' ~ ' + end.format('YY.MM.DD'));
	
}


/***************************** 검색 초기화 버튼 클릭 *****************************/
$(document).on("click", "#reset_btn", function(e) {	
	
	// 세션 삭제
	removeSession()
	
	// 검색 날짜 초기화
    let start = moment().startOf('year')	
    let end = moment()

    cb(start, end)	
	
    // 검색 조건, 검색 값 초기화
	ById('srch_crtr').selectedIndex = 0
	ById('srch_key').value = null    
  
	// 초기 검색 값
	defaultSrch()	
})


/***************************** 조건 검색 버튼 클릭 *****************************/
$(document).on("click", "#srch_btn", function(e) {	
	srchOrders()
})

/***************************** 검색입력 후 클릭 *****************************/
$(document).on("keyup", "#srch_key", function(e) {	

	// 엔터키를 누른다면 (13)
	if (e.keyCode == 13) {
		srchOrders()
	}
})

/***************************** 조건검색 FUNCTION *****************************/
function srchOrders() {
	
	// 기존에 열린 주문상세 숨김
	ById('dtls-box').style.display = "none"	

	let pageNum = 1	

	let srchCrtr = ById('srch_crtr').value
	let srchKey = ById('srch_key').value
	
	let status = document.querySelector('input[name="orderclsfc_btn"]:checked').value
	
	// 달력 date
    let dateRange = ById('scrh_date').textContent
	let [start_date, end_date] = dateRange.split(' ~ ');
	
	// 검색 시 기존세션 초기화
	removeSession()
	
	orderMngmn(pageNum, srchCrtr, srchKey, status, start_date, end_date)	
}

/***************************** 주문 총 관리 function *****************************/
function orderMngmn(pageNum, srchCrtr, srchKey, status, start_date, end_date) {
	
	let data = {
			
			"pageNum" : pageNum,
			"srchCrtr" : srchCrtr,
			"srchKey" : srchKey,
			"order_status" : status,
			"srchStrDate" : start_date,
			"srchEndDate" : end_date
	}
	
	// 검색조건 세션 저장
	sessionStorage.setItem("pageNum", pageNum);
	sessionStorage.setItem("srchCrtr", srchCrtr);
	sessionStorage.setItem("srchKey", srchKey);
	sessionStorage.setItem("status", status); 
	sessionStorage.setItem("start_date", start_date); 
	sessionStorage.setItem("end_date", end_date); 
		
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



/***************************** 세부내역 확인 *****************************/
$(document).on("click", "tr.mngmn_table_tr", function(e) {	
	
	let order_no = e.currentTarget.cells[0].innerText
	
	// 세션 저장
	sessionStorage.setItem("order_no", order_no);
	
	// 상세 TABLE
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
			console.log(data[0].COURIER)
			console.log(data[0].INVOICE_NO)
			console.log(data[0].START_DATE)
			
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
			let BTN = (data[0].ORDER_STATUS == 10 || data[0].ORDER_STATUS == 12) ? `<a class="aprvl_btn" id="aprvl_btn" value="1">요청승인</a>` : '' 	
					
					
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
						</table>	
						
						<input type="hidden" id="order_no" value="${data[0].ORDER_NO}">
						<input type="hidden" id="user_no" value="${data[0].USER_NO}">
						<input type="hidden" id="order_status" value="${data[0].ORDER_STATUS}">`
				
			let INVOICE = data[0].INVOICE_NO === undefined ? '등록' : data[0].INVOICE_NO
			let COURIER = data[0].COURIER === undefined ?  `<select class="form-select courier_select" id="courier_select" aria-label="Default select example">
															  <option selected value="우체국택배">우체국택배</option>
															  <option value="롯데택배">롯데택배</option>
															  <option value="로젠택배">로젠택배</option>
															  <option value="한진택배">한진택배</option>
															  <option value="CJ택배">CJ택배</option>
															</select>` : data[0].COURIER
			
			let DLVY_BTN = data[0].INVOICE_NO === undefined ? '' : `style="display: none;"`
			
			let CMPLT = (data[0].ORDER_STATUS == 2) || (data[0].ORDER_STATUS ==12) || 
					    (data[0].ORDER_STATUS ==13) ? data[0].CMPLT_DATE : '' 
			let RTRN = 	data[0].ORDER_STATUS == 13 ? '반품처리' : ''
			
				
				
			let CANCEL = (data[0].ORDER_STATUS == 10 ) || (data[0].ORDER_STATUS == 11 ) ? '' : 	
															`<tr>
																<th>운송장번호</th>
																<td id="invoice_no">${INVOICE}</td>
																<th>택배사</th>
																<td>${COURIER}</td>
																<td><button class="btn btn-primary dlvy_btn" id="dlvy_btn" ${DLVY_BTN}>등록</button></td>
															</tr>`
							
			let DATE = data[0].START_DATE === undefined ? '' : 
																`<tr>
																	<th>배송시작</th>
																	<td>${data[0].START_DATE}</td>
																	<th>배송도착</th>
																	<td>${CMPLT}</td>
																	<td>${RTRN}</td>
																</tr>`
				
			let dlvy = 	`<table class="dlvy-box_table">

							${CANCEL}
							${DATE}
							
						</table>`
			
						
			ById('table-box').innerHTML = html
			ById('info-box').innerHTML = info
			ById('dlvy-box').innerHTML = dlvy
		},
		
		error : function(request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		
		}
		
	})
}

/***************************** 세부내역 확인 : 누른거만 색상 바뀜 *****************************/
$(document).on("click", ".mngmn_table_tr", function(e) {	

	const rows = document.getElementsByClassName("mngmn_table_tr");

	for (let i = 0; i < rows.length; i++) {
	      rows[i].style.backgroundColor = "";
	      this.style.backgroundColor = "#e0e0ee";
	}
	
})


/***************************** 주문상세 : 승인버튼 클릭 *****************************/
$(document).on("click", "a.aprvl_btn", function(e) {	

	let order_no = ById('order_no').value
	let user_no = ById('user_no').value
	let status = ById('order_status').value	
	
	 Swal.fire({
	      title: '취소 & 반품',
	      text: "해당 요청을 승인하시겠습니까?",
	      icon: 'warning',
	      showCancelButton: true,
	      confirmButtonColor: '#3085d6',
	      cancelButtonColor: '#d33',
	      confirmButtonText: '승인',
	      cancelButtonText: '취소',
	      reverseButtons: true, // 버튼 순서 거꾸로
	      
	    }).then((result) => {
	      if (result.isConfirmed) {
	        Swal.fire(
	  	      
	          orderAprvl(order_no, status, user_no),	        
	          '정상처리 되었습니다.',
	          'success'

	        )
	      }
	    })

	
	
})

/***************************** 주문상세 : 취소/반품 승인 FUNCTION *****************************/
function orderAprvl(order_no, status, user_no) {
	
	let data = {
				"order_no" : order_no,
				"order_status" : status,
				"user_no" : user_no
	}
	
	$.ajax({
		type : "POST",                              
		url : "/admin/orderAprvl",
		data : JSON.stringify(data),  
		dataType : "text",
		contentType : "application/json",		
			
		success : function() {
							
			// 세션호출 후 재검색
			getItemSession()
			
			// 세션호출 후 상세내역 유지
			let order_no = sessionStorage.getItem("order_no");	
			
			orderMngmnDtls(order_no)
			
		},
			
		error: function(request, status, error) {
		       console.log("code: " + request.status)
		       console.log("message: " + request.responseText)
		       console.log("error: " + error);
		        
		}	
				
	})		
	
}

/***************************** 운송장번호 등록 버튼 클릭 *****************************/
$(document).on("click", "#invoice_no", function(e) {	 
	
	let check = ById('invoice_no').innerHTML

	// 등록되어있거나, 등록했다면 
	if (check.length == 16) {
		return false
	} else {
		
		// 운송장번호 = 현재시간 + 랜덤3자리 숫자
		let timestamp = new Date().getTime();

		let random = ""
		let possible = "0123456789"
				    
		for(let i=0; i < 3; i++ ) {
				random += possible.charAt(Math.floor(Math.random() * possible.length))
			}	
		
		let invoice_no = Number(timestamp + random)
		
		ById('invoice_no').innerHTML = invoice_no		
	}

})


/***************************** 배송 등록 버튼 클릭*****************************/
$(document).on("click", "#dlvy_btn", function(e) {	 
	
    const Toast = Swal.mixin({
        toast: true,
        position: 'center-center',
        showConfirmButton: false,
        timer: 2000,
        timerProgressBar: true,
        didOpen: (toast) => {
          toast.addEventListener('mouseenter', Swal.stopTimer)
          toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
      })

      Toast.fire({
        icon: 'success',
        title: '배송처리가 정상적으로 완료되었습니다.'
      })
    
	let order_no = ById('order_no').value
	let invoice_no = ById('invoice_no').innerHTML
	let courier = ById('courier_select').value
		
	insertDlvy(order_no, invoice_no, courier)
})


/***************************** 송장번호 INSERT FUNCTION *****************************/
function insertDlvy(order_no, invoice_no, courier) {
	
	let data = {
			"order_no" : order_no,
			"invoice_no" : invoice_no,
			"courier" : courier
	}
	
	$.ajax({
		type : "POST",                              
		url : "/admin/updateDelivery",
		data : JSON.stringify(data),  
		dataType : "text",
		contentType : "application/json",		
			
		success : function() {
	
			// 세션호출 후 재검색
			getItemSession()

			// 세션호출 후 상세내역 유지			
			let order_no = sessionStorage.getItem("order_no");	
			orderMngmnDtls(order_no)			
			
			
		},
			
		error: function(request, status, error) {
		       console.log("code: " + request.status)
		       console.log("message: " + request.responseText)
		       console.log("error: " + error);
		        
		}	
				
	})		
}
	