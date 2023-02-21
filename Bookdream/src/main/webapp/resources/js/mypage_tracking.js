$(function() {
	
	order_list()
})


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
function order_list(search_date, search_status) {

	// 기본 : 1개월 이내 조회	
	let date = search_date ===  undefined ? 30 : search_date
	// 기본 : 모든 배송상태 검색
	let status = search_status ===  undefined ? 100 : search_status
	
	let data = {"search_date" : date,
				"search_status" : status}
	
	console.log(data)
	$.ajax({
		type : "POST",                              
		url : "/order/orderList",
		data : JSON.stringify(data),   
		dataType : "text",
		contentType : "application/json",
		
		success : function(data) {
			
			var result =  JSON.parse(data);
			let html = "";
			
			if (result == "") {				
				html += `<div class="trackinglist_null"><i class="bi bi-exclamation-circle"> 데이터가 존재하지 않습니다! </i></div>`

			} else {
				
				for (let order of result) {

					let date = timestamp(order.order_date)
					let status = switchCase(order.order_status) 	
					
					let red = ((order.order_status == 10) || (order.order_status == 11)) ? `style="color: red"` : ''
					let	blue = ((order.order_status == 12) || (order.order_status == 13)) ? `style="color: blue"` : ''

					html += `<table class="trackinglist_table">
							 	<tr>
									<th class="trackinglist_table_th1" colspan="3">
										<span class="trackinglist_table_title">${date} (${order.order_no})</span>
										<br>
										<button type="button" class="btn btn-link trackinglist_table_detail_btn" 
												data-bs-toggle="modal" data-bs-target="#exampleModal" value="${order.order_no}">
												상세 조회<i class="bi bi-chevron-right"></i>
										</button>
									</th>
									
									<th class="trackinglist_table_th2" >`
									
									if(order.order_status == 0) {
					html +=				`<button type="button" class="btn btn-outline-secondary pay_cancel cancel_btn" 
											 	 data-bs-toggle="modal" data-bs-target="#pay_cancel" 
											 	 value="${order.order_no}">결제취소</button>`

									} else if(order.order_status == 2) {
					html +=				`<button type="button" class="btn btn-outline-secondary return_request cancel_btn" 
												data-bs-toggle="modal" data-bs-target="#return_reqeust" 
												value="${order.order_no}">반품신청</button>`							
									
									}
							 	
					html +=			`</th>
								</tr>
							 	
								<tr>
									<td class="trackinglist_table_col1">
										<img class="trackinglist_table_img" alt="img" src="${order.bookVO.book_img}">
									</td>				
											
									<td class="trackinglist_table_col2">${order.order_name}</td>						
									<td class="trackinglist_table_col3">
										${order.payVO.final_price} 원
									</td>				
							
								<td class="trackinglist_table_col4" ${red} ${blue} >${status}</td>	

								</tr>							 	
							 </table>`
							
					
				}
				
			}

			orderHistory()
			ById('trackinglist').innerHTML = html
			
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
	
	let search_date = ById('order_search_select_btn').value
	let search_status = ById('order_status_select_btn').value
	
	$('#offcanvas').offcanvas('hide');	
	order_list(search_date, search_status)
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

			
			
			let result =  JSON.parse(data);
			let html = "";
			
			date = timestamp(result[0].orderVO.order_date);
			
			html += `<div class="tracking_detail_main">${date} | 주문번호 (${result[0].orderVO.order_no})</div>
					 <hr>`
			
				
			for (let order of result)	{
				let status = switchCase(order.orderVO.order_status) 				

			html += 	`<table class="tracking_detail_table">
							<tr>
								<td class="tracking_detail_table_col1"><a href="/getBook?book_no=${order.bookVO.book_no}" target='_blank'>
									<img class="tracking_detail_table_img" alt="" src="${order.bookVO.book_img}"><a/>
								</td>
								<td class="tracking_detail_table_col2">${order.bookVO.title} <br> ${order.product_count}개</td>
								<td class="tracking_detail_table_col3">${order.bookVO.book_price.toLocaleString()}원</td>
								<td class="tracking_detail_table_col4">${status}</td>
							</tr>
						</table>`
			}
			
			html += `<div class="tracking_detail_title">배송정보</div>
					<hr>
					<div class="tracking_detail_address">
						<div>${result[0].orderVO.order_receiver} / ${result[0].orderVO.order_tel} <br><br> ${result[0].orderVO.order_address}</div>
					</div>
					<div class="tracking_detail_title">결제정보</div>
					<hr>	
					<div class="tracking_detail_price_col1">
						<span class="">주문금액</span> <span class="tracking_detail_price_right">${result[0].payVO.total_price.toLocaleString()}원</span>
						<br><span class="tracking_detail_price_left">ㄴ배송료</span> <span class="tracking_detail_price_right">(+) ${result[0].payVO.pay_fee.toLocaleString()}원</span>
					</div>		
					<div class="tracking_detail_price_col2">
						할인/포인트 <span class="tracking_detail_price_right">(-) ${result[0].payVO.use_point.toLocaleString()}원</span>
					</div>
					<div class="tracking_detail_price_col3">
						결제금액 <span class="tracking_detail_price_right"><span style="font-weight: bold; color:#5c5d99; font-size:16px;" >${result[0].payVO.final_price.toLocaleString()}</span>원</span>
					</div>
					<div class="tracking_detail_title">적립정보</div>
					<hr>	
					<div class="tracking_detail_price_col4">
						포인트적립 <div class="tracking_detail_price_right">${result[0].payVO.save_point.toLocaleString()}P</div>
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
	
	ById('modal_pay_cancel').value = e.currentTarget.value

})

/***************************** 반품신청 버튼 클릭 *****************************/
$(document).on("click", "button.return_request", function(e) {	
	
	ById('modal_return_request').value = e.currentTarget.value
	console.log(e.currentTarget.value)
})

/***************************** 결제취소 모달 취소버튼 클릭 *****************************/
$(document).on("click", "#modal_pay_cancel", function(e) {	
	
	var order_no = e.currentTarget.value
	orderTrackingUpdate(order_no, 10);
})

/***************************** 결제반품 모달 반품버튼 클릭 *****************************/
$(document).on("click", "#modal_return_request", function(e) {	
	
	var order_no = e.currentTarget.value
	orderTrackingUpdate(order_no, 12);

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
	
		success : function(data) {	
			console.log(data)
			let result =  JSON.parse(data);
			
			// 주문 목록 갱신 (검색값 유지하도록 설정)
			order_list(result.search_date, result.search_status)
	
		},
	
		error: function(request, status, error) {
			console.log("code: " + request.status)
			console.log("message: " + request.responseText)
			console.log("error: " + error);
		}
	})
}


