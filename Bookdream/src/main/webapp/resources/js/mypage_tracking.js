$(function() {
	
	order_list_default()

})

// 검색 초기값 FUCNTION
function order_list_default() {
	
	// 초기 값 
	let pageNum = 1
	let status = 100
	let start_date = '23.01.01'
	let end_date = '23.12.31'
		
	order_list(pageNum, status, start_date, end_date)		
	
}

// 검색 달력
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
						
			let html = "";
			let paging, cnt 
				
			if (data.list[0] == null) {				
				html += `<div class="trackinglist_null"><i class="bi bi-exclamation-circle"> 주문내역이 존재하지 않습니다 </i></div>`

			} else {
				
				for (let order of data.list) {

					let date = timestamp(order.ORDER_DATE)
					let status_text = switchCase(order.ORDER_STATUS) 
					let status = order.ORDER_STATUS
						
					// 결제취소신청, 결제취소는 글색상 RED
					let red = ((status == 10) || (status == 11)) ? `style="color: #FF6384"` : ''
					
					// 반품요청, 반품완료는 글색상 BLUE	
					let	blue = ((status == 12) || (status == 13)) ? `style="color: #4BC0C0"` : ''
					
					// 배송완료 : 배송완료시간 표시
					let	cmplt_date = status == 2 ? `<br><span style="font-size: 10px; font-weight: normal;">${order.CMPLT_DATE}</span>` : ''
						
					// 결제완료 : 결제취소 버튼	
					let pymntCmplt = status == 0 ? `<button type="button" class="btn btn-outline-danger btns pay_cancel"><i class="fas fa-times-circle"></i>&nbsp; 결제취소</button>` : ''
					
					// 배송완료 : 반품요청, 구매확정 버튼
					let cmpltDlvry = status == 2 ? `<button type="button" class="btn btn-outline-warning btns prchs_cnfrm"><i class="fas fa-check-circle"></i>&nbsp; 구매확정</button>						
						     									<button type="button" class="btn btn-outline-success btns return_request"><i class="fas fa-undo"></i>&nbsp; 반품신청</button>` : ''
					
					// 취소 / 반품 중인 상품에 대해서는 배송조회 불가
				    let dlvry_check = ((status == 10) || (status == 11) || (status == 12) || (status == 13)) ? '' : `<button type="button" class="btn btn-outline-primary-nb btns dlvry_check" value="${order.ORDER_NO}">
																										    			<i class="fas fa-truck"></i> 배송조회
																											      	 </button>`
	
						
					html += `<table class="trackinglist_table">
							 	<tr>
									<th class="trackinglist_table_th1" colspan="2">
										<span class="trackinglist_table_title">${date} (${order.ORDER_NO})</span>
										<br>
										<button type="button" class="btn btn-link trackinglist_table_detail_btn" value="${order.ORDER_NO}">
												<i class="fas fa-search"></i> 주문상세
										</button>
									</th>
									
									<th class="trackinglist_table_th2">
									
									${pymntCmplt}
									${cmpltDlvry}
					
									</th>
					
									<th class="trackinglist_table_th3">
									
									${dlvry_check}
									
							       </th>
								</tr>
							 	
								<tr>
									<td class="trackinglist_table_col1">
										<img class="trackinglist_table_img" alt="img" src="${order.BOOK_IMG}">
									</td>				
											
									<td class="trackinglist_table_col2">${order.ORDER_NAME}</td>						
									<td class="trackinglist_table_col3">
										${order.FINAL_PRICE.toLocaleString()} 원
									</td>				
							
								<td class="trackinglist_table_col4" ${red} ${blue}>${status_text} ${cmplt_date} </td>	
								</tr>							 
								<input type="hidden" value="${order.ORDER_NO}">	
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
					
				cnt = `<span style="font-size:24px; font-weight: bold; color:#3d3e66">${data.cnt}</span><span style="font-size:12px;"> 개</span>`
			}
			
			paging = paging === undefined ? '' : paging	
			cnt = cnt === undefined ? '' : cnt	
					
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
			
			let purchs = 0
			let cancels = 0
	
			for(order of data) {
				
				let status = order.ORDER_STATUS
				let count = order.STATUSCOUNT
					
				// 배송완료/구매확정 묶어서 처리
				if(status == 2 || status == 3) {
					status = 2
					purchs += Number(count)
				}
								
				// 취소/반품 묶어서 처리
				if (status == 10 || status == 11 ||
					status == 12 || status == 13 ) {
					
					status = 10
					cancels += Number(count)

				} 
				
				switch (status) {

		            case  0: ById('order_count0').innerHTML = count
		                     break;
		            	            
		            case  1: ById('order_count1').innerHTML = count
	        				 break;		            
	        				
		            case  2: ById('order_count2').innerHTML = purchs
		            		 break;		            		
		           
		            case 10: ById('order_count10').innerHTML = cancels
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
	
	//
	
	switch (data) {
	    case  0: return "결제완료"    
	    case  1: return "배송중"	
	    case  2: return "배송완료"
	    case  3: return "구매확정"
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
	
	toast('설정한 조건으로 검색되었습니다.')
	
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

	toast('검색 초기화 설정')
	
	// 초기 검색 값
	order_list_default()	
})

/***************************** 주문상세 버튼 클릭 *****************************/
$(document).on("click", ".trackinglist_table_detail_btn", function(e) {

	// 모달 열림
	$('#exampleModal').modal('show');	
	$('#dlvry_check').modal('hide');	
 	
    let order_no = e.currentTarget.value	
    
	order_detail(order_no)
})

/***************************** 배송조회 버튼 *****************************/
$(document).on("click", "button.dlvry_check", function(e) {	

	// 모달 열림
	$('#dlvry_check').modal('show');	
	$('#exampleModal').modal('hide');	
		
    let order_no = e.currentTarget.value	
    
    getDelivery(order_no)


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

			let result =  JSON.parse(data);
			let html = "";
			
			let date = timestamp(result[0].ORDER_DATE);
			
			//let cmplt_date = (result[0].ORDER_STATUS == 2 || result[0].ORDER_STATUS == 3) ? `<span style="float: right">${result[0].CMPLT_DATE}</span>` : ''
			
			html += `<div class="tracking_detail_main">${date} | 주문번호 (${result[0].ORDER_NO}) 
							
					</div>
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
			
			html += `<div class="tracking_detail_title">배송정보
						<button type="button" class="btn btn-outline-primary-nb btns dlvry_check" value="${result[0].ORDER_NO}">
							<i class="fas fa-truck"></i> 배송조회
						</button>					
					</div>
					
					<hr>
					
					<div class="tracking_detail_address">
						<div>${result[0].ORDER_RECEIVER} / ${result[0].ORDER_TEL} <br> ${result[0].ORDER_ADDRESS}</div>
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
	
    let order_no = e.target.closest("table").querySelector("input[type=hidden]").value
    
	let order_status = 10
	let title = '결제취소 요청'
	let icon = 'warning'		
	let text = '결제취소 요청을 하시겠습니까?'
	let msg = '반품 요청을 하였습니다.'		
		
	console.log(order_no)
	
	confirmed(title, text, icon, msg, function() {
		orderTrackingUpdate(order_no, order_status)
    })	
})

/***************************** 반품신청 버튼 클릭 *****************************/
$(document).on("click", "button.return_request", function(e) {	

    let order_no = e.target.closest("table").querySelector("input[type=hidden]").value
	
	let order_status = 12
	let title = '반품 요청'
	let icon = 'warning'
	let text = '반품 요청을 하시겠습니까?'
	let msg = '반품 요청을 하였습니다.'
		
	console.log(order_no)
	
	confirmed(title, text, icon, msg, function() {
		orderTrackingUpdate(order_no, order_status)
    })		
	
})

/***************************** 구매확정 버튼 클릭 *****************************/
$(document).on("click", "button.prchs_cnfrm", function(e) {	
    
    let order_no = e.target.closest("table").querySelector("input[type=hidden]").value

	let order_status = 3
	let title = '구매 확정'
	let icon = 'question'
	let text = '구매확정을 하면 해당 상품은 반품이 불가합니다.'
	let msg = '구매확정 + 1000P 적립되었습니다.'
		
	console.log(order_no)
	
	confirmed(title, text, icon, msg, function() {
		orderTrackingUpdate(order_no, order_status)
    })		
	
})



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




/***************************** 배송조회 FUNCTION *****************************/
function getDelivery(order_no) {

	var data = { "order_no" : order_no }
	
	$.ajax({
		type : "GET",                              
		url : "/getDelivery",	
		data : data,  
		dataType : "text",
		contentType : "application/json",
	
		success : function(result) {	
			
			let data =  JSON.parse(result);
							
			// 배송상태별 아이콘 색상
			let status = data.ORDER_STATUS
			
			// 구매확정도 배송완료와 동일하게 처리
			if (status == 3) {
				status = 2
			}			
			
			let box = iconColor(0)
			let truck = iconColor(1)
			let circle = iconColor(2)
				
			function iconColor(num) {
				return status == num ? `style="color: #5c5d99; opacity: 1;"` : ''
			}
			
			// 배송상태별 내용
			let startDate = time(data.START_DATE)
			let cmlitDate = time(data.CMPLT_DATE)
			
			let title = modalBody(status)	
			
			function modalBody(status) {

				if (status == 1) {
					
					var title = '배송중</span> 입니다.'
					var date = '도착예정시간'
				}
					
				 
				if (status == 2) {
					
					var title = '배송완료</span> 되었습니다.'
					var date = '도착시간'
						
					status = 1
					
				}
				
				switch(status) {
				
				case 0: return `<div style="font-size:24px; margin-top:50px;"><span style="color:#5c5d99; font-weight: bold;">상품 준비중</span> 입니다.</div> <br> 
							    빠른 시간내에 상품을 준비할수 있도록 하겠습니다. <br> 
							    고객님들의 양해 부탁드립니다. 감사합니다.`
						break;
				
				case 1: return `고객님의 주문하신 상품이 <span style="font-size:20px; color:#5c5d99; font-weight: bold;"> ${title}
								<table class="dlvry_info_table">
									<tr>
										<th>주문번호</td>
										<td>
											${data.ORDER_NO}
											<button type="button" style="float:right; margin-right:10px;" class="btn btn-outline-primary-nb btns trackinglist_table_detail_btn" data-bs-dismiss="modal" value="${data.ORDER_NO}">
												<i class="fas fa-search"></i> 주문상세
											</button>											
										</td>
										
										<th>송장번호</th>
										<td>${data.INVOICE_NO}</td>
									</tr>
									
									<tr>
										<th>배송번호</td>
										<td>${data.DELIVERY_NO}</td>
										<th>택배사</th>
										<td>${data.COURIER}</td>
									</tr>
									
									<tr>
										<th>출발시간</td>
										<td>${startDate}</td>
										<th>${date}</th>
										<td style="color:#5c5d99; font-weight:bold;">${cmlitDate}</td>
									</tr>
								</table>`
						break;
			
				}	
			}
				
			let html = `<div class="dlvry_icon_box">
					    	<div class="dlvry_icon_text">
					    		<i class="bi bi-box dlvry_icon" ${box}></i>
					   			<span ${box}>상품준비중</span>
							</div>
					  
					  		<div class="dlvry_icon_text">
					    		<i class="bi bi-truck dlvry_icon" ${truck}></i>
					    		<span ${truck}>배송중</span>
						  	</div>
						  
					  		<div class="dlvry_icon_text">
					    		<i class="bi bi-check2-circle dlvry_icon" ${circle}></i>
					    		<span ${circle}>배송완료</span>
					  		</div>
						</div>
				
						<div class="dlvry_content">
							
							<div style="text-align: center; width:80%; height:100%;">
								${title}
								

								
							</div>
						</div>`
				
				ById('dlvry_check_body').innerHTML = html
	
		},
	
		error: function(request, status, error) {
			console.log("code: " + request.status)
			console.log("message: " + request.responseText)
			console.log("error: " + error);
		}
	})
}



