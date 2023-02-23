$(function() {
	
	order_list_default()

})

function order_list_default() {
	
	// 초기 값 
	let pageNum = 1
	let status = 100
	let start_date = '23.01.01'
	let end_date = '23.12.31'
		
	order_list(pageNum, status, start_date, end_date)		
	
}

$(function() {

    let start = moment().subtract(29, 'days')
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


/***************************** getElementById function *****************************/
function ById(id) {
	return document.getElementById(id);
}

/***************************** 날짜 형식 변경 function *****************************/
function timestamp(date){
    var today = new Date(date);
    today.setHours(today.getHours() + 9);
    return today.toISOString().replace('T', ' ').substring(0, 16); //년도~분까지 표시
}


/***************************** 주문 목록 표시 *****************************/
function order_list(pageNum, status, start_date, end_date) {

	let data = {		
			"pageNum" : pageNum,
			"order_status" : status,
			"srchStrDate" : start_date,
			"srchEndDate" : end_date
	}

	// 세션등록
	sessionStorage.setItem("pageNum", pageNum);
	sessionStorage.setItem("status", status); 
	sessionStorage.setItem("start_date", start_date); 
	sessionStorage.setItem("end_date", end_date); 	
	
	$.ajax({
		type : "GET",                              
		url : "/order/orderList",
		data : data,  
		dataType : "json",
		contentType : "application/json",
		
		success : function(data) {
			
			console.log(data.list)
			
			let html = "";
			let paging, cnt 
				
			if (data.list[0] == null) {				
				html += `<div class="trackinglist_null"><i class="bi bi-exclamation-circle"> 주문내역이 존재하지 않습니다 </i></div>`

			} else {
				
				for (let order of data.list) {

					let date = timestamp(order.ORDER_DATE)
					let status = switchCase(order.ORDER_STATUS) 	
					
					let red = ((order.ORDER_STATUS == 10) || (order.ORDER_STATUS == 11)) ? `style="color: red"` : ''
					let	blue = ((order.ORDER_STATUS == 12) || (order.ORDER_STATUS == 13)) ? `style="color: blue"` : ''

					html += `<table class="trackinglist_table">
							 	<tr>
									<th class="trackinglist_table_th1" colspan="3">
										<span class="trackinglist_table_title">${date} (${order.ORDER_NO})</span>
										<br>
										<button type="button" class="btn btn-link trackinglist_table_detail_btn" 
												data-bs-toggle="modal" data-bs-target="#exampleModal" value="${order.ORDER_NO}">
												상세 조회<i class="bi bi-chevron-right"></i>
										</button>
									</th>
									
									<th class="trackinglist_table_th2" >`
									
									if(order.ORDER_STATUS == 0) {
					html +=				`<button type="button" class="btn btn-outline-secondary pay_cancel cancel_btn" 
											 	 data-bs-toggle="modal" data-bs-target="#pay_cancel" 
											 	 value="${order.ORDER_NO}">결제취소</button>`

									} else if(order.ORDER_STATUS == 2) {
					html +=				`<button type="button" class="btn btn-outline-secondary return_request cancel_btn" 
												data-bs-toggle="modal" data-bs-target="#return_reqeust" 
												value="${order.ORDER_NO}">반품신청</button>`							
									
									}
							 	
					html +=			`</th>
								</tr>
							 	
								<tr>
									<td class="trackinglist_table_col1">
										<img class="trackinglist_table_img" alt="img" src="${order.BOOK_IMG}">
									</td>				
											
									<td class="trackinglist_table_col2">${order.ORDER_NAME}</td>						
									<td class="trackinglist_table_col3">
										${order.FINAL_PRICE} 원
									</td>				
							
								<td class="trackinglist_table_col4" ${red} ${blue} >${status}</td>	

								</tr>							 	
							 </table>`
							
					
				}
				
			    /* 페이징 */	
				
				
				paging = `<div class="text-center paging_btn">
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
					
				cnt = `${data.cnt}`
			}
			
			paging = paging === undefined ? '' : paging	
					
			ById('trackinglist').innerHTML = html
			ById('paging').innerHTML = paging
			ById('cnt').innerHTML = cnt
			
			orderHistory()
			
			console.log("로딩완료");
			
		},
		
		error: function(request, status, error) {
				        console.log("code: " + request.status)
				        console.log("message: " + request.responseText)
				        console.log("error: " + error);
		}
	});	
							
}
/***************************** 주문내역 카운트 갱신 function *****************************/
function orderHistory() {

	$.ajax({
		type : "POST",                              
		url : "/order/orderHistory",
		dataType : "json",
		contentType : "application/json",
			
		success : function(data) {
			
			var num = 0
			
			console.log(data)
			
			for(order of data) {
						
				if (order.ORDER_STATUS == 10 || order.ORDER_STATUS == 11 ||
					order.ORDER_STATUS == 12 || order.ORDER_STATUS == 13 ) {
					
					order.ORDER_STATUS = 10
					num += Number(order.STATUSCOUNT)

				} 
				
				switch (order.ORDER_STATUS) {

		            case  0: ById('order_count0').innerHTML = order.STATUSCOUNT
		                     break;
		            	            
		            case  1: ById('order_count1').innerHTML = order.STATUSCOUNT
	        				 break;		            
	        				
		            case  2: ById('order_count2').innerHTML = order.STATUSCOUNT
		            		 break;		            		
		           
		            case 10: ById('order_count10').innerHTML = num
	        				 break;

				}
				
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

	// 페이지 이동시 검색조건,검색키워드 유지됨
	let status = sessionStorage.getItem("status");
	let start_date = sessionStorage.getItem("start_date");
	let end_date = sessionStorage.getItem("end_date");

	order_list(pageNum, status, start_date, end_date)	
})

/***************************** switch case function *****************************/
function switchCase(data) {
	
	switch (data) {
	    case  0: return "결제완료"    
	    case  1: return "배송중"	
	    case  2: return "배송완료"
	    case 10: return "결제취소중"
	    case 11: return "결제취소"
	    case 12: return "반품요청중"	 
	    case 13: return "반품완료"
	}

}


/***************************** 주문내역 : 상세조회 버튼 클릭 *****************************/
$(document).on("click", "#order_search_btn", function(e) {
		
	$('#offcanvas').offcanvas('show');
})

/***************************** 주문내역 상세조회 : 조건설정 후 적용버튼클릭 *****************************/
$(document).on("click", "#order_search_view_btn", function(e) {
	
	// 세션 호출
	let pageNum = 1
	
	// 달력 date
    let dateRange = ById('scrh_date').textContent
	let [start_date, end_date] = dateRange.split(' ~ ');
	
	// 주문배송상태
	let status = ById('order_status_select_btn').value
	
	$('#offcanvas').offcanvas('hide')
	
	order_list(pageNum, status, start_date, end_date)	
	
	
})

/***************************** 검색 초기화 버튼 클릭 *****************************/
$(document).on("click", "#order_search_reset_btn", function(e) {	
	
	// 세션 삭제
	sessionStorage.removeItem("pageNum")
	sessionStorage.removeItem("start_date")
	sessionStorage.removeItem("end_date")
	
	// 검색 날짜 초기화
    let start = moment().subtract(29, 'days')
    let end = moment()
    
    // 상태 검색 초기화
	ById('order_status_select_btn').selectedIndex = 0
	
    cb(start, end)	
	  
	// 초기 검색 값
	order_list_default()	
})

/***************************** 주문목록 : 주문상세보기 버튼 클릭 *****************************/
$(document).on("click", ".trackinglist_table_detail_btn", function(e) {
	
	let order_no = e.currentTarget.value
	order_detail(order_no)
})


/***************************** 주문상세보기 모달 function *****************************/
function order_detail(order_no) {
	
	var data = {"order_no" : order_no}
	console.log(data)
	
	$.ajax({
		type : "POST",                              
		url : "/order/orderDetail",	
		data : JSON.stringify(data),   
		dataType : "text",
		contentType : "application/json",
		
		success : function(data) {	

			console.log(data)
			
			let result =  JSON.parse(data);
			let html = "";
			
			date = timestamp(result[0].ORDER_DATE);
			
			html += `<div class="tracking_detail_main">${date} | 주문번호 (${result[0].ORDER_NO})</div>
					 <hr>`
			
				
			for (let order of result)	{
				let status = switchCase(order.ORDER_STATUS) 				

			html += 	`<table class="tracking_detail_table">
							<tr>
								<td class="tracking_detail_table_col1"><a href="/getBook?book_no=${order.BOOK_NO}" target='_blank'>
									<img class="tracking_detail_table_img" alt="" src="${order.BOOK_IMG}"><a/>
								</td>
								<td class="tracking_detail_table_col2">${order.TITLE} <br> ${order.PRODUCT_COUNT}개</td>
								<td class="tracking_detail_table_col3">${order.BOOK_PRICE.toLocaleString()}원</td>
								<td class="tracking_detail_table_col4">${status}</td>
							</tr>
						</table>`
			}
			
			html += `<div class="tracking_detail_title">배송정보</div>
					<hr>
					<div class="tracking_detail_address">
						<div>${result[0].ORDER_RECEIVER} / ${result[0].ORDER_TEL} <br><br> ${result[0].ORDER_ADDRESS}</div>
					</div>
					<div class="tracking_detail_title">결제정보</div>
					<hr>	
					<div class="tracking_detail_price_col1">
						<span class="">주문금액</span> <span class="tracking_detail_price_right">${result[0].TOTAL_PRICE.toLocaleString()}원</span>
						<br><span class="tracking_detail_price_left">ㄴ배송료</span> <span class="tracking_detail_price_right">(+) ${result[0].PAY_FEE.toLocaleString()}원</span>
					</div>		
					<div class="tracking_detail_price_col2">
						할인/포인트 <span class="tracking_detail_price_right">(-) ${result[0].USE_POINT.toLocaleString()}원</span>
					</div>
					<div class="tracking_detail_price_col3">
						결제금액 <span class="tracking_detail_price_right"><span style="font-weight: bold; color:#5c5d99; font-size:16px;" >${result[0].FINAL_PRICE.toLocaleString()}</span>원</span>
					</div>
					<div class="tracking_detail_title">적립정보</div>
					<hr>	
					<div class="tracking_detail_price_col4">
						포인트적립 <div class="tracking_detail_price_right">${result[0].SAVE_POINT.toLocaleString()}P</div>
					</div>`
						
			ById('tracking_detail_list').innerHTML = html;
			console.log("주문상세 열림");
		},
		
		error: function(request, status, error) {
				        console.log("code: " + request.status)
				        console.log("message: " + request.responseText)
				        console.log("error: " + error);
		}
	});	
							
}


/***************************** 결제취소 버튼 클릭 *****************************/
$(document).on("click", "button.pay_cancel", function(e) {	
      
	let order_no = e.currentTarget.value
	let order_status = 10
	let title = '결제취소 요청'
	let text = '결제취소 요청을 하시겠습니까?'
		
	console.log(e.currentTarget.value)	
	
	alertSwal(title, text, order_no, order_status)
})

/***************************** 반품신청 버튼 클릭 *****************************/
$(document).on("click", "button.return_request", function(e) {	

	let order_no = e.currentTarget.value
	let order_status = 12
	let title = '반품 요청'
	let text = '반품 요청을 하시겠습니까?'
		
	console.log(e.currentTarget.value)
	
	alertSwal(title, text, order_no, order_status)	
})

function alertSwal(title, text, order_no, order_status) {
	
    Swal.fire({
        title: title ,
        text: text,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#6768ab',
        cancelButtonColor: '#d33',
        confirmButtonText: '승인',
        cancelButtonText: '취소',
        reverseButtons: true, // 버튼 순서 거꾸로
        
      }).then((result) => {
        if (result.isConfirmed) {
          Swal.fire(
            orderTrackingUpdate(order_no, order_status),  
        	'정상처리 되었습니다.',
            'success'
          )
        }
      })
}







/***************************** 배송상태 갱신 function *****************************/
function orderTrackingUpdate(order_no, status) {
	
	var data = { "order_no" : order_no,
				 "order_status" : status}

	console.log(data);
	
	$.ajax({
		type : "POST",                              
		url : "/order/update",	
		data : JSON.stringify(data),   
		dataType : "text",
		contentType : "application/json",
	
		success : function() {	
			
			// 세션 호출
			let pageNum = sessionStorage.getItem("pageNum")
			let status = sessionStorage.getItem("status")
			let start_date = sessionStorage.getItem("start_date")
			let end_date = sessionStorage.getItem("end_date")
			
			$('#offcanvas').offcanvas('hide')
			
			order_list(pageNum, status, start_date, end_date)	
	
		},
	
		error: function(request, status, error) {
			console.log("code: " + request.status)
			console.log("message: " + request.responseText)
			console.log("error: " + error);
		}
	})
}


