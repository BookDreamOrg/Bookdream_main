$(function() {
	
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
function order_list() {
	
	$.ajax({
		type : "GET",                              
		url : "/mypage/orderList",	
		dataType : "json",
		contentType : "application/json",
		
		success : function(result) {
			
			var html = "";
			
			if (result == "") {
				
				html += `<div class="trackinglist_null"><i class="bi bi-exclamation-circle"> 주문내역이 없습니다.</i></div>`
			} 
			
			var cnt0 = 0;
			var cnt1 = 0;
			var cnt2 = 0;
			var cnt10= 0;
	
			for (i=0; i < result.length; i++) {		
				
				
				console.log(result.length)	
				
				
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
		            		 status = "반품 요청 중"
		            	     break;
		            		 
		            case 12: check = 12;
           		 			 cnt10 += 1;		            
		            		 status = "반품 완료"
		            		 break;
		        }
				
				if (check == 0) {
					html = `${status}<br><button type="button" class="btn btn-link pay_cencel" 
									  		     id="pay_cencel_open" data-bs-toggle="modal" 
												 data-bs-target="#pay_cencel" value="${result[i].order_no}">결제취소</button>`	
				} else if (check == 2) {
					html = `${status}<br><button type="button" class="btn btn-link pay_cencel" 
											     id="return_request_open" data-bs-toggle="modal" 
											     data-bs-target="#return_reqeust" value="${result[i].order_no}">반품신청</button>`
				} else {
					html = `${status}`
				}
				
				console.log(html)
				ById('trackinglist_status' + i).innerHTML = html;
			}			
			

			 ById('tracking_main_table_col2').innerHTML = cnt0;
			 ById('tracking_main_table_col3').innerHTML = cnt1;
			 ById('tracking_main_table_col4').innerHTML = cnt2;
			 ById('tracking_main_table_col5').innerHTML = cnt10;
			 
			 console.log("주문 목록 로딩 완료");
		},
		
		error: function(request, status, error) {
				        console.log("code: " + request.status)
				        console.log("message: " + request.responseText)
				        console.log("error: " + error);
		}
	});	
							
}


/***************************** 주문상세보기 버튼 클릭 *****************************/
$(document).on("click", ".trackinglist_table_detail_btn", function(e) {
	
	let order_no = e.currentTarget.value
	order_detail(order_no)
})


/***************************** 주문 상세 보기 모달 function *****************************/
function order_detail(order_no) {
	
	var data = {"order_no" : order_no}
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
			
			html += `<div class="tracking_detail_main">${date} | 주문번호 (${result[0].orderVO.order_no})</div>` +
					`<hr>`
			
			for (i=0; i < result.length; i++) {

				switch (result[i].orderVO.order_status) {
				
	            case  0: status = "결제 완료"
	                     break;
	            	            
	            case  1: status = "배송 중"
        				 break;		            
        				
	            case  2: status = "배송 완료"
	            		 break;		            		
	           
	            case 10: status = "결제 취소"
        				 break;
	           
	            case 11: status = "반품 요청"
	            	     break;
	            		 
	            case 12: status = "반품 완료"
	            		 break;
	        }				
				
				
				
				html += `<table class="tracking_detail_table">` +
							`<tr>` +
								`<td class="tracking_detail_table_col1"><a href="/getBook?book_no=${result[i].bookVO.book_no}" target='_blank'><img class="tracking_detail_table_img" alt="" src="${result[i].bookVO.book_img}"><a/></td>`+
								`<td class="tracking_detail_table_col2">${result[i].bookVO.title} <br> ${result[i].product_count}개</td>`+
								`<td class="tracking_detail_table_col3">${result[i].bookVO.book_price.toLocaleString()}원</td>`+
								`<td class="tracking_detail_table_col4">${status}</td>`+
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
						`<span class="">주문금액</span> <span class="tracking_detail_price_right">${result[0].payVO.total_price.toLocaleString()}원</span>` +
						`<br><span class="tracking_detail_price_left">ㄴ배송료</span> <span class="tracking_detail_price_right">(+) ${result[0].payVO.pay_fee.toLocaleString()}원</span>` +
					`</div>` +			
					`<div class="tracking_detail_price_col2">` +
						`할인/포인트 <span class="tracking_detail_price_right">(-) ${result[0].payVO.use_point.toLocaleString()}원</span>` +
					`</div>` +
					`<div class="tracking_detail_price_col3">` +
						`결제금액 <span class="tracking_detail_price_right"><span style="font-weight: bold; color:#5c5d99; font-size:16px;" >${result[0].payVO.final_price.toLocaleString()}</span>원</span>` +
					`</div>` +
					`<div class="tracking_detail_title">적립정보</div>` +
					`<hr>` +					
					`<div class="tracking_detail_price_col4">` +
						`포인트적립 <div class="tracking_detail_price_right">${result[0].payVO.save_point.toLocaleString()}P</div>` +
					`</div>`
						
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


/***************************** 결제취소신청 버튼 클릭 *****************************/
$(document).on("click", "button.pay_cencel", function(e) {	
	
	ById('modal_pay_cencel').value = e.currentTarget.value
	//	console.log(e.currentTarget.value)
	

})

/***************************** 반품문의신청 버튼 클릭 *****************************/
$(document).on("click", "button.return_request", function(e) {	
	
	ById('modal_return_request').value = e.currentTarget.value
	console.log(e.currentTarget.value)
})

/***************************** 결제취소 모달 취소버튼 클릭 *****************************/
$(document).on("click", "#modal_pay_cencel", function(e) {	
	
	var order_no = e.currentTarget.value
	orderTrackingUpdate(order_no, 10);
})

/***************************** 결제반품 모달 반품버튼 클릭 *****************************/
$(document).on("click", "#modal_return_request", function(e) {	
	
	var order_no = e.currentTarget.value
	orderTrackingUpdate(order_no, 11);

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
			
				var result =  JSON.parse(data)
			
				let order_no = result.order_no;
				let status = result.order_status;
				
				if(status == 10) {
					status = `<span style="color:red">결제 취소</span>`
				} else if (status == 11) {
					status = `<span style="color:blue">반품 요청 중</span>`					
				}
				 
				let cencel = document.querySelectorAll('.cencel_btn');
				
				ById('order_status_text'+ order_no).innerHTML = status
				
				for (i=0; i<cencel.length; i++) {
					if(cencel[i].value == order_no) {
						cencel[i].style.display = "none";
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


