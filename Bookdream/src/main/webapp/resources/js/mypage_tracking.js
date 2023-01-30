$(function() {
		order_list();
})

function order_list() {
	
	$.ajax({
		type : "POST",                              
		url : "/mypage/orderList",	
		dataType : "json",
		contentType : "application/json",
		
		success : function(result) {	
			console.log(result);
			
			var html = "";

			for (i=0; i < result.length; i++) {

				// 결제금액에 , 추가
				var total_price = result[i].total_price.toLocaleString();	
				
				html += `<table class="trackinglist_table">` +	
							`<tr>` +
								`<td class="trackinglist_table_main" colspan="4">` +
									`${result[i].order_enroll} (${result[i].order_no})` +
									`<button type="button" class="btn btn-light trackinglist_table_main_button" data-bs-toggle="modal" data-bs-target="#exampleModal">상세 조회</button>` +
								`</td>` +
							`</tr>` +	
							
							`<tr>` +
								`<td class="trackinglist_table_col1"><img class="trackinglist_table_img" alt="" src="${result[i].bookVO.book_img}"></td>` +
								`<td class="trackinglist_table_col2">${result[i].order_name}</td>` +
								`<td class="trackinglist_table_col3">${total_price}</td>` +
								`<td class="trackinglist_table_col4">배송상태</td>` +
							`</tr>` +									
						`</table>`
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

function order_detail() {
	
	$.ajax({
		type : "POST",                              
		url : "/mypage/orderDetail",	
		dataType : "json",
		contentType : "application/json",
		
		success : function(result) {	
			console.log(result);
			
			var html = "";

			for (i=0; i < result.length; i++) {

				// 결제금액에 , 추가
				var total_price = result[i].total_price.toLocaleString();	
				
				html += `<table class="trackinglist_table">` +	
							`<tr>` +
								`<td class="trackinglist_table_main" colspan="4">` +
									`${result[i].order_enroll} (${result[i].order_no})` +
									`<button type="button" class="btn btn-light trackinglist_table_main_button" data-bs-toggle="modal" data-bs-target="#exampleModal">상세 조회</button>` +
								`</td>` +
							`</tr>` +	
							
							`<tr>` +
								`<td class="trackinglist_table_col1"><img class="trackinglist_table_img" alt="" src="${result[i].bookVO.book_img}"></td>` +
								`<td class="trackinglist_table_col2">${result[i].order_name}</td>` +
								`<td class="trackinglist_table_col3">${total_price}</td>` +
								`<td class="trackinglist_table_col4">배송상태</td>` +
							`</tr>` +									
						`</table>`
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