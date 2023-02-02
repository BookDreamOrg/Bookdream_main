$(function() {
	order_list();
})

// 주문 상세보기
function tracking_detail(no) {
	var no = $(no).val();
	order_detail(no);	
}


// 주문취소창 열림
function pay_cencel_open(no) {
    $("#pay_cencel_order_no").val(no);
}

// 반품신청창 열림
function return_request_open(no) {
    $("#return_request_order_no").val(no);	
}

// 주문취소창에서 취소선택
$('#modal_pay_cencel').click(function() {
	
	var order_no = $("#pay_cencel_order_no").val();	
	orderTrackingUpdate(order_no, 10);
})	

// 반품신청창에서 신청선택
$('#modal_return_request').click(function() {

	var order_no = $("#return_request_order_no").val();	
	orderTrackingUpdate(order_no, 11);
	
})

function orderTrackingUpdate(no, status) {
	
	var data = { "order_no" : no,
				 "order_status" : status}

	$.ajax({
		type : "POST",                              
		url : "/order/update",	
		data : JSON.stringify(data),   
		dataType : "text",
		contentType : "application/json",
	
		success : function() {	
		
			order_list();			
		},
	
		error: function(request, status, error) {
			console.log("code: " + request.status)
			console.log("message: " + request.responseText)
			console.log("error: " + error);
		}
	})
}


function order_list() {
	
	$.ajax({
		type : "POST",                              
		url : "/mypage/orderList",	
		dataType : "json",
		contentType : "application/json",
		
		success : function(result) {
			
			console.log(result)
			
			var html = "";
			
			if (result == "") {
				console.log("없음");
				
				html += `<div class="trackinglist_null"><i class="bi bi-exclamation-circle"> 주문내역이 없습니다.</i></div>`
			} 
			
			var cnt0 = 0;
			var cnt1 = 0;
			var cnt2 = 0;
			var cnt10= 0;
	
			for (i=0; i < result.length; i++) {
					
				switch (result[i].order_status) {
		            case  0: check = 0;
		            		 cnt0 += 1;
		            		 status = "결제 완료"
		                     break;
		            		
		            case  1: check = 1;
           		 			 cnt1 += 1;
		            		 status = "배송 중"
            				 break;		            
            				
		            case  2: check = 2;
           		 			 cnt2 += 1;		            
		            		 status = "배송 완료"
		            		 break;		            		
		           
		            case 10: check = 10;
		            		 cnt10 += 1;
            				 status = "결제 취소"
            				 break;
		           
		            case 11: check = 11;
           		 			 cnt10 += 1;		            
		            		 status = "반품 요청"
		            	     break;
		            		 
		            case 12: check = 12;
           		 			 cnt10 += 1;		            
		            		 status = "반품 완료"
		            		 break;
		        }

				// 날짜 변환
				date = timestamp(result[i].order_date);
				
				html += `<table class="trackinglist_table">` +	
							`<tr>` +
								`<td class="trackinglist_table_main" colspan="4">` +
									`<b>${date} (${result[i].order_no})</b><br>` +
									`<input type="hidden" name="trackinglist_order_no" value="${result[i].order_no}">` +
									`<button type="button" class="btn btn-link trackinglist_table_main_button" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="tracking_detail(this)" value="${result[i].order_no}">상세 조회<i class="bi bi-chevron-right"></i></button>` +
								`</td>` +
							`</tr>` +	
							
							`<tr>` +
								`<td class="trackinglist_table_col1"><img class="trackinglist_table_img" alt="" src="${result[i].bookVO.book_img}"></td>` +
								`<td class="trackinglist_table_col2">${result[i].order_name}</td>` +
								`<td class="trackinglist_table_col3"><b>${result[i].payVO.final_price.toLocaleString()}</b>원</td>` 
								if(check == 0) {
				html +=			`<td class="trackinglist_table_col4">${status}<br><button type="button" class="btn btn-link pay_cencel" id="pay_cencel_open" data-bs-toggle="modal" data-bs-target="#pay_cencel" onclick="pay_cencel_open(${result[i].order_no})">결제취소</button></td>` 								
								} else if(check == 10) {
				html +=			`<td class="trackinglist_table_col4" style="color:red"><b>${status}</b></td>` 								
								} else if(check == 2) {
				html +=			`<td class="trackinglist_table_col4">${status}<br><button type="button" class="btn btn-link pay_cencel" id="return_request_open" data-bs-toggle="modal" data-bs-target="#return_reqeust" onclick="return_request_open(${result[i].order_no})">반품신청</button></td>` 																
								} else if(check == 11) {
				html +=			`<td class="trackinglist_table_col4" style="color:blue"><b>${status}</b></td>` 								
								} else if(check == 12) {
				html +=			`<td class="trackinglist_table_col4" style="color:red"><b>${status}</b></td>` 												
								} else {
				html +=			`<td class="trackinglist_table_col4">${status}</td>` 									
								}
							`</tr>` +									
						`</table>` +
						`<hr class="trackinglist_table_hr">` 
			}			
			
			 document.getElementById('trackinglist').innerHTML = html;
			 document.getElementById('tracking_main_table_col2').innerHTML = cnt0;
			 document.getElementById('tracking_main_table_col3').innerHTML = cnt1;
			 document.getElementById('tracking_main_table_col4').innerHTML = cnt2;
			 document.getElementById('tracking_main_table_col5').innerHTML = cnt10;
		},
		
		error: function(request, status, error) {
				        console.log("code: " + request.status)
				        console.log("message: " + request.responseText)
				        console.log("error: " + error);
		}
	});	
							
}

// date 형식 변환
function timestamp(date){
    var today = new Date(date);
    today.setHours(today.getHours() + 9);
    return today.toISOString().replace('T', ' ').substring(0, 16);
}


function order_detail(no) {
	
	var data = {"order_no" : no}
	console.log(data)
	
	$.ajax({
		type : "POST",                              
		url : "/mypage/orderDetail",	
		data : JSON.stringify(data),   
		dataType : "text",
		contentType : "application/json",
		
		success : function(result) {	
			var result =  JSON.parse(result);
			var html = "";
			
			date = timestamp(result[0].orderVO.order_date);
			
			html += `<div class="tracking_detail_main"><b>${date} | 주문번호 (${result[0].orderVO.order_no})</b></div>` +
					`<hr>`
			
			for (i=0; i < result.length; i++) {
			
				html += `<table class="tracking_detail_table">` +
							`<tr>` +
								`<td class="tracking_detail_table_col1"><a href="/getBook?book_no=${result[i].bookVO.book_no}" target='_blank'><img class="tracking_detail_table_img" alt="" src="${result[i].bookVO.book_img}"><a/></td>`+
								`<td class="tracking_detail_table_col2">${result[i].bookVO.title} <br> ${result[i].product_count}개</td>`+
								`<td class="tracking_detail_table_col3"><b>${result[i].bookVO.book_price.toLocaleString()}</b>원</td>`+
								`<td class="tracking_detail_table_col4">배송상태</td>`+
							`</tr>` +
						`</table>`
			}
			
			html += `<div class="tracking_detail_title">배송정보</div>` +
					`<hr>` +
					`<div class="tracking_detail_address">` +
						`<div>${result[0].orderVO.order_receiver} / ${result[0].orderVO.order_tel} <br><br> ${result[0].orderVO.order_address}</div>` +
					`</div>` +
					`<div class="tracking_detail_title">결제정보</div>` +
					`<hr>` +					
					`<div class="tracking_detail_price_col1">` +
						`<span class="">주문금액</span> <span class="tracking_detail_price_right"><b>${result[0].payVO.total_price.toLocaleString()}</b>원</span>` +
						`<br><span class="tracking_detail_price_left">ㄴ배송료</span> <span class="tracking_detail_price_right">(+) <b>${result[0].payVO.pay_fee.toLocaleString()}</b>원</span>` +
					`</div>` +			
					`<div class="tracking_detail_price_col2">` +
						`할인/포인트 <span class="tracking_detail_price_right">(-) <b>${result[0].payVO.use_point.toLocaleString()}</b>원</span>` +
					`</div>` +
					`<div class="tracking_detail_price_col3">` +
						`결제금액 <span class="tracking_detail_price_right"><b>${result[0].payVO.final_price.toLocaleString()}</b>원</span>` +
					`</div>` +
					`<div class="tracking_detail_title">적립정보</div>` +
					`<hr>` +					
					`<div class="tracking_detail_price_col4">` +
						`포인트적립 <div class="tracking_detail_price_right"><b>${result[0].payVO.save_point.toLocaleString()}</b>P</div>` +
					`</div>`
			 document.getElementById('tracking_detail_list').innerHTML = html;
		},
		
		error: function(request, status, error) {
				        console.log("code: " + request.status)
				        console.log("message: " + request.responseText)
				        console.log("error: " + error);
		}
	});	
							
}

