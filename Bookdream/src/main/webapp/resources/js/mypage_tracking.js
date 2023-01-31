$(function() {
	order_list();
})

function tracking_detail(no) {
	var no = $(no).val();
	order_detail(no);	
}



function order_list() {
	
	$.ajax({
		type : "POST",                              
		url : "/mypage/orderList",	
		dataType : "json",
		contentType : "application/json",
		
		success : function(result) {	
			
			var html = "";

			for (i=0; i < result.length; i++) {

				html += `<table class="trackinglist_table">` +	
							`<tr>` +
								`<td class="trackinglist_table_main" colspan="4">` +
									`<b>${result[i].order_date} (${result[i].order_no})</b><br>` +
									`<input type="hidden" name="trackinglist_order_no" value="${result[i].order_no}">` +
									`<button type="button" class="btn btn-link trackinglist_table_main_button" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="tracking_detail(this)" value="${result[i].order_no}">상세 조회<i class="bi bi-chevron-right"></i></button>` +
								`</td>` +
							`</tr>` +	
							
							`<tr>` +
								`<td class="trackinglist_table_col1"><img class="trackinglist_table_img" alt="" src="${result[i].bookVO.book_img}"></td>` +
								`<td class="trackinglist_table_col2">${result[i].order_name}</td>` +
								`<td class="trackinglist_table_col3"><b>${result[i].payVO.final_price.toLocaleString()}</b>원</td>` +
								`<td class="trackinglist_table_col4">결제완료</td>` +
							`</tr>` +									
						`</table>` +
						`<hr class="trackinglist_table_hr">` 
			}			
			
			 document.getElementById('trackinglist').innerHTML = html;
		},
		
		error: function(request, status, error) {
				        console.log("code: " + request.status)
				        console.log("message: " + request.responseText)
				        console.log("error: " + error);
		}
	});	
							
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
			
			html += `<div class="tracking_detail_main"><b>${result[0].orderVO.order_date} | 주문번호 (${result[0].orderVO.order_no})</b></div>` +
					`<hr>`
			for (i=0; i < result.length; i++) {
			
				html += `<table class="tracking_detail_table">` +
							`<tr>` +
								`<td class="tracking_detail_table_col1"><a href="/getBook?book_no=${result[i].bookVO.book_no}" target='_blank'><img class="tracking_detail_table_img" alt="" src="${result[i].bookVO.book_img}"><a/></td>`+
								`<td class="tracking_detail_table_col2">${result[i].bookVO.title} <br> ${result[i].product_count}개</td>`+
								`<td class="tracking_detail_table_col3"><b>${result[i].bookVO.book_price.toLocaleString()}</b>원</td>`+
								`<td class="tracking_detail_table_col4">배송중</td>`+
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
						`주문금액 <span class="tracking_detail_price_right"><b>${result[0].payVO.total_price.toLocaleString()}</b>원</span>` +
					`</div>` +			
					`<div class="tracking_detail_price_col2">` +
						`할인/포인트 <span class="tracking_detail_price_right"><b>${result[0].payVO.use_point.toLocaleString()}</b>원</span>` +
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