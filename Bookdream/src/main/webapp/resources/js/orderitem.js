/***************************** 페이지 로딩 *****************************/
$(function() {
	address_info("Y");	
})


/***************************** getElementById function *****************************/
function ById(id) {
	return document.getElementById(id);
}

/***************************** 주문 상품 토글 *****************************/
$(document).on("click", "#orderlist_table_toggle", function(e) {	
		

	var toggle = document.getElementsByClassName('orderlist_table_tr');
		
	if ($("#orderlist_table_tr").css("display") == "none") {
	
		for (var i=0; i<toggle.length; i++) {
			toggle[i].style.display = "table-row";
		}
		console.log("상품목록 열림");
		ById('orderlist_table_toggle').className = 'bi bi-chevron-up';	
	} else {
		for (var i=0; i<toggle.length; i++) {		
			toggle[i].style.display = "none";
		}	
		console.log("상품목록 닫힘");		
		ById("orderlist_table_toggle").className = "bi bi-chevron-down";		
	}

})


/***************************** 배송지 목록 모달 열림 *****************************/
$(document).on("click", "#address_search_btn", function(e) {
	
	console.log("배송지 목록 열림")
	$('#address_list_modal').modal('show');
	
	// 배송지 목록 호출
	address_list();
	
});

/***************************** 배송지 입력 모달 열림 *****************************/
$(document).on("click", "#address_insert_btn", function(e) {
	console.log("배송지 입력 열림")
	$('#address_insert_modal').modal('show');

	// INPUT 값 초기화
	ById('address_insert_alias').value = null;
	ById('address_insert_name').value = null;
	ById('address_insert_tel').value = null;
	ById('zonecode').value = null;
	ById('roadAddr').value = null;
	ById('detailAddress').value = null;

	ById('address_update_modal_btn').style.display = "none";
	ById('address_insert_modal_btn').style.display = "block";
});


/***************************** 배송지 수정 모달 열림 *****************************/
$(document).on("click", "#address_list_table_update", function(e) {
	
	console.log("배송지 수정 열림")
	$('#address_insert_modal').modal('show');

	ById('address_insert_modal_btn').style.display = "none";
	ById('address_update_modal_btn').style.display = "block";
	
	// 선택한 배송지의 value를 호출하여 input에 출력
	var address_no = e.currentTarget.value
	select_address_value(address_no);
});


/***************************** 배송지 입력모달 : 입력 버튼 클릭 *****************************/
$(document).on("click", "#address_insert_modal_btn", function(e) {
		
	
	address_insert('insert');
	console.log("배송지 추가 완료");	
});

/***************************** 배송지 입력모달 : 수정 버튼 클릭 *****************************/
$(document).on("click", "#address_update_modal_btn", function(e) {
		
	
	address_insert('update');
	console.log("배송지 수정 완료");	
});

/***************************** 배송지 목록 : 삭제 버튼 클릭 *****************************/
$(document).on("click", "#address_list_table_delete", function(e) {
	
	
	var address_no = e.currentTarget.value;
	address_delete(address_no);
	console.log("배송지 삭제 완료");
});

/***************************** 배송요청사항 버튼 클릭 *****************************/
$(document).on("click", "#delivery_request_btn", function(e) {
	
	console.log("배송요청사항 열림");
	$('#delivery_request').modal('show');
});

/***************************** 배송요청사항 : 직접입력하기 클릭 *****************************/
$(document).on("change", "#delrivery_reqeust_select", function(e) {
	
	
	var select = ById('delrivery_reqeust_select');
	var message = ById('delrivery_reqeust_message');

	if (select.value == 'message') {
		message.disabled = false;
	} else {
		message.disabled = true;
		message.value = null;
	}

})

/***************************** 배송요청사항 : 저장 클릭 *****************************/
$(document).on("click", "#delivery_request_change_btn", function(e) {
	
	
	var value = ById('delrivery_reqeust_select').value;
	var html = '';
	
	if (value == 'message') {
		value = ById('delrivery_reqeust_message').value;
		
		if (value == '') {
			alert("요청사항을 입력하세요.");
			return false;
		}
	} 
		html = `<span id="delivery_request_value">${value}</span><button class="btn btn-outline-secondary delivery_request_btn_two" id="delivery_request_btn"><i class="bi bi-pencil-square"></i> 수정</button></span>` 

		ById('address_table_col2').innerHTML = html;
		$('#delivery_request').modal('hide');	
	
})


/***************************** 포인트 테이블 토글 *****************************/
$(document).on("click", "#point_table_toggle", function(e) {
	
	
	var table = ById('point_table_none');
	var btn = ById('point_table_toggle');
		
	if ($("#point_table_none").css("display") == "none") {
		table.style.display = "table-row";
		console.log("포인트 뷰 열림");
		btn.className = 'bi bi-chevron-up';	
	} else {
		table.style.display = "none";
		console.log("포인트 뷰 닫힘");
		btn.className = 'bi bi-chevron-down';		
	}

})

/***************************** 포인트 전액사용 버튼 클릭 *****************************/
$(document).on("click", "#point_table_full_use_btn", function(e) {
	
	
	var btn = ById('point_table_full_use_btn');

	if (btn.classList[3] == 'active' ) {
		btn.classList.toggle('active')		
		btn.innerHTML = '전액사용';
		
		console.log("사용취소 완료");
		
	} else {
		btn.classList.toggle('active')		
		btn.innerHTML = '사용취소';
	
		console.log("전액사용 완료");			
	}
	
	max_point_toggle(btn);	
})



/***************************** 포인트 수동 입력 *****************************/
$(document).on("keyup", "#point_table_use_point_input", function(e) {
	
	// 정규식 변환 (숫자만 기입)
	var point = ById('point_table_use_point_input');
    point.value = point.value.replace(/[^0-9]/g,'');
    
})

/***************************** 포인트 수동입력후 포커스 아웃 *****************************/
$(document).on("focusout", "#point_table_use_point_input", function(e) {
	
	var this_point = Number(ById('point_table_use_point_input').value)
	var final_price = Number(ById('final_price_value').value)
	var max_point = Number(ById('max_point_value').value)

	// side바 표시
	var use_point = ById('use_point_value');
	// input 표시
	var use_point_input = ById('point_table_use_point_input');	
	
	// 입력한 포인트가 최종금액, 최대 포인트보다 많음
	if (this_point >= final_price && this_point >= max_point) {
		
		// 최대 포인트가 최종금액 보다 많음
		if (max_point > final_price) {
			use_point.innerHTML = comma(final_price);
			use_point_input.value = comma(final_price);
		// 최대 포인트가 최종금액 보다 적음
		} else {
			use_point.innerHTML = comma(max_point);
			use_point_input.value = comma(max_point);			
		}

	// 입력한 포인트가 최종금액보다 많고, 최대 포인트가 최종금액보다 많음
	} else if (this_point >= final_price && max_point > final_price) {
		use_point.innerHTML = comma(final_price);
		use_point_input.value = comma(final_price);	
	// 입력한 포인트가 최종금액보다 많고, 최대 포인트가 최종금액보다 적음		
	} else if (this_point >= final_price && max_point < final_price) {
		use_point.innerHTML = comma(max_point);
		use_point_input.value = comma(max_point);		
	// 입력한 포인트가 최종금액, 최대 포인트 보다 적음
	} else {
		use_point.innerHTML = comma(this_point);
		use_point_input.value = comma(this_point);			
	}

	var btn = ById('point_table_full_use_btn');
	
	if (btn.classList[3] == 'active' ) {
		btn.classList.toggle('active')		
		btn.innerHTML = '전액사용';
	}
	
	calculation(use_point);	
	
})

/***************************** 결제하기 버튼 클릭 *****************************/
$(document).on("click", "#side_pay_now_btn", function(e) {
		
	
	// 결제 정보
	var pay_method = document.querySelector('input[name="pay_radio"]:checked');
	var total_price = ById('total_price_value').value;
	var pay_fee = ById('delivery_value').value;
	var use_point = uncomma(ById ('use_point_value').innerText);		
	var save_point = uncomma(ById('save_point_value').innerText);
	var final_price = uncomma(ById('final_price').innerText);
	var discount_price = 0;
	
	if(ById('user_info_name') == null || ById('user_info_tel') == null || ById('user_info_zone_code') == null ||
	   ById('user_info_road_add') == null || ById('user_info_detail_add') == null) {
		
		alert("배송지정보를 입력하세요.");
		return false;	
		
	} else if (pay_method == null) {
		alert("결제수단을 선택하세요.");
		return false;		
	} 
	
	
	// 사용자 정보
	var order_name = ById('order_name').value;
	var order_comment = ById('delivery_request_value').innerText;
	var order_receiver = ById('user_info_name').innerText;
	var order_tel = ById('user_info_tel').innerText;
	var add1 = ById('user_info_zone_code').innerText;
	var add2 = ById('user_info_road_add').innerText;
	var add3 = ById('user_info_detail_add').innerText;
	var order_address = "[" + add1 + "]" + " " + add2 + " " + add3
	



	var data = {
			"order_name" : order_name,
			"pay_method" : pay_method.value,
			"order_comment" : order_comment,
			"order_receiver" : order_receiver,
			"order_address" : order_address,
			"order_tel" : order_tel,
			"final_price" : final_price,					
			"total_price" : total_price,	
			"discount_price" : discount_price,					
			"pay_fee" : pay_fee,					
			"use_point" : use_point,
			"save_point" : save_point					
			};
	
	
	console.log(data);
	

	
	$.ajax({
		
		type : 'POST',
		url : '/detail/cart/orderitem/save',
		data : JSON.stringify(data),
		dataType : 'text',
		contentType : "application/json",	
		
		success : function() {	
			
			console.log("세션 저장 완료")
			const clientKey = 'test_ck_OALnQvDd2VJn771bMENVMj7X41mN';
			var tossPayments = TossPayments(clientKey);		
			
			// 랜덤 OrderId 생성
			// 한번 결제된 OrderId는 사용불가
			var random = "";
			var possible = "abcdefghijklmnopqrstuvwxyz0123456789";
			    
			for( var i=0; i < 13; i++ ) {
				random += possible.charAt(Math.floor(Math.random() * possible.length));
			}
				tossPayments.requestPayment(pay_method.value, {
					  amount: 500,
					  orderId: random,
					  orderName: "test",
					  customerName: "test",
					  successUrl: 'http://localhost:8000/detail/cart/orderitem/pay',
					  failUrl: 'http://localhost:8000/main',
				})
				.catch(function (error) {
					if (error.code === 'USER_CANCEL') {
						alert("결제가 취소되었습니다.");
					} else if (error.code === 'INVALID_CARD_COMPANY') {
						alert("유효하지 않은 카드입니다. 다시 입력해주세요.");
					}
				})			

		},
		error: function(request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}				
	});

})

/***************************** 포인트 전액사용 버튼 클릭 function *****************************/
function max_point_toggle(btn) {
		
	var final_price = Number(ById('total_price_value').value);
	var max_point = Number(ById('max_point_value').value);

	// side바 표시
	var use_point = ById('use_point_value');
	// input 표시	
	var use_point_input = ById('point_table_use_point_input');	
	
	// 전액 사용 버튼 선택
	if (btn.classList[3] == 'active') {
		
		// value 초기화
		use_point.innerHTML = 0;	

		// 상품금액보다 포인트가 더 많다면, 상품금액만큼 포인트가 사용됩니다.
		if (final_price < max_point) {
			use_point.innerHTML = comma(final_price);	
			use_point_input.value = comma(final_price);
		// 아닐경우 전액사용 됩니다.
		} else {
			use_point.innerHTML = comma(max_point);	
			use_point_input.value = comma(max_point);				
		}
	// 사용 취소를 누를경우 0으로 변경됩니다.
	} else {
		use_point.innerHTML = 0;
		use_point_input.value = 0;			
		
	}
	

	calculation(use_point);
}

/***************************** 최종금액 계산 function *****************************/
function calculation(use_point) {
	
	var delivery = Number(ById('delivery_value').value);
	var total_price = Number(ById('total_price_value').value);
	var use_point = uncomma(use_point.innerText);
	
	var final_price = (total_price + delivery) - use_point;
	
	console.log("상품금액 : " + total_price);
	console.log("배송료 : " + delivery);
	console.log("사용 포인트 : " + use_point);
	console.log("결제금액 : " + final_price);
	
	ById('save_point_value').innerHTML = comma((Math.floor(final_price * 0.05)));
	ById('final_price').innerHTML = comma(final_price);
}


/***************************** uncomma function *****************************/
function uncomma(value) {
	
	var comma = value.replace(/[^\d]+/g, '');
	
	return comma;	

}

/***************************** comma function *****************************/
function comma(value) {
	
	var comma = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

	return comma;
}


/***************************** 배송지 수정 버튼 클릭시 value 리턴 function *****************************/
function select_address_value(address_no) {

	var data = {"address_no" : address_no};
	
	$.ajax ({
		type : 'POST',
		url : '/address/get',
		data : JSON.stringify(data),   
		dataType : 'text',
		contentType : "application/json",		
		
		success : function(data) {	
			
			var result =  JSON.parse(data)
			// - 제거
			var address_tel = result.address_tel.replace(/-/g, "");
			
			ById('address_insert_alias').value = result.address_alias;
			ById('address_insert_name').value = result.address_name ;
			ById('address_insert_tel').value = address_tel;
			ById('zonecode').value = result.zone_code;
			ById('roadAddr').value = result.road_add;
			ById('detailAddress').value = result.detail_add;
			ById('address_insert_address_no').value = result.address_no;
			
		} ,
		
		error: function(request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}	
	})
}
/***************************** 전화번호 입력 *****************************/
$(document).on("keyup", "#address_insert_tel", function(e) { 
	
	var tel = e.currentTarget.value
	e.currentTarget.value = tel.replace(/[^0-9]/g,'');
})

/***************************** 배송지 추가/수정 전송 function *****************************/
function address_insert(check) {
	
	// INPUT VALUE 값 저장
	var address_alias = ById('address_insert_alias').value;
	var address_name = ById('address_insert_name').value;
	var address_tel = ById('address_insert_tel').value.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`); // - 추가
	var zone_code = ById('zonecode').value;
	var road_add = ById('roadAddr').value;
	var detail_add = ById('detailAddress').value;
	var address_no = ById('address_insert_address_no').value;
	
	console.log(address_tel.length)
	
	if (address_alias == '') {
		alert("배송지 이름을 입력하세요.");
	} else if (address_name == '') {
		alert("받는사람 이름을 입력하세요.");
	} else if (address_tel == '') {
		alert("받는사람 전화번호를 입력하세요.");
	} else if (address_tel.length != 13) { // - 포함 13자리
		alert("전화번호를 11자리 기입하세요.");
	} else if (zone_code == '' || road_add == '' || detail_add == '') {
		alert("주소를 입력하세요.");
		
		// 주소 입력하기를 누르면 사용자의 주소 목록을 조회함
	} else if(check == 'insert') {
		$.ajax({
			type : "POST",                              
			url : "/address/allList",	
			dataType : "json",
			contentType : "application/json",
			
			success : function(result) {	
				
				// 등록된 주소가 없다면 생성한 주소는 기본 배송지로 설정됨		
				var default_add = (result=="") ? "Y" : "N";

				var data = {
						 "address_alias" : address_alias,
						 "address_name" : address_name,
						 "address_tel" : address_tel,
						 "zone_code" : zone_code,
						 "road_add" : road_add,
						 "detail_add" : detail_add,
						 "address_no" : address_no,
						 "default_add" : default_add
					};				
									
					$.ajax({
						type : "POST",                              
						url : "/address/insert",         
						data : JSON.stringify(data),   
						dataType : "text",
						contentType : "application/json",
						
						success : function() {	

							if(default_add == 'Y') {
								alert("처음 생성한 배송지는 기본 배송지로 설정됩니다.");
							}
							
							// 배송지 갱신
							address_list();
							$('#address_insert_modal').modal('hide');
							
						},
						error: function(request, status, error) {
					        console.log("code: " + request.status)
					        console.log("message: " + request.responseText)
					        console.log("error: " + error);
						}
					});	
								
			},
					
		})		
		
	// 주소수정	
	} else {
		
		var data = {
				 "address_alias" : address_alias,
				 "address_name" : address_name,
				 "address_tel" : address_tel,
				 "zone_code" : zone_code,
				 "road_add" : road_add,
				 "detail_add" : detail_add,
				 "address_no" : address_no
			};			
		
		$.ajax({
			type : "POST",                              
			url : "/address/update",         
			data : JSON.stringify(data),   
			dataType : "text",
			contentType : "application/json",
			
			success : function() {	
				
				// 배송지 갱신
				address_list();
				$('#address_insert_modal').modal('hide');

			},
			error: function(request, status, error) {
		        console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
			}				
		});			
		
	}
	
}


/***************************** 배송지 삭제 function *****************************/
function address_delete(address_no) {
	
	var data = {"address_no" : address_no};

		$.ajax ({
			type : 'POST',
			url : '/address/delete',
			data : JSON.stringify(data),   
			dataType : 'text',		
			contentType : "application/json",		
					
			success : function() {	
				address_list();	
			},
					
			error: function(request, status, error) {
		        console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
			}	
		})
}

/***************************** 배송지 목록에서 등록 버튼 클릭 *****************************/
$(document).on("click", "#address_list_change_btn", function(e) {
		
    
	var value = document.getElementsByName('address_radio')
	var address_no = Array.from(value).find(radio => radio.checked).value;
	
	change_view_address(address_no);
	
	console.log("배송지 선택 완료");

})

	
/***************************** 배송지 표시 변경 (modal -> view) function *****************************/
function change_view_address(address_no) {
	
	if (ById('address_list_default_set').checked == true) {	
		alert("기본 배송지로 설정 됩니다.");
		
		var data = {"address_no" : address_no}
		
		$.ajax ({
			type : 'POST',
			url : '/address/default',
			data : JSON.stringify(data),   
			dataType : 'text',
			contentType : "application/json",		
			
			success : function() {	
				
				// 기본 배송지로 갱신함
				address_info("Y", address_no);
				$('#address_list_modal').modal('hide');	
				console.log("기본 배송지로 설정 콜백");
			},
			
			error: function(request, status, error) {
		        console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
			}	
		})
	
	// 바로 저장을 한다면
	} else {
		
		// 선택한 배송지로 갱신함
		address_info("N", address_no);
		$('#address_list_modal').modal('hide');			
	}
}
	
/***************************** 배송지 정보 표시 (view) function *****************************/
function address_info(check, address_no) {
	
	// 일반 배송지를 표시함
	if (check == "N") {
		url = "/address/get"
		data = {"address_no" : address_no}
		
	// 기본 배송지를 표시함
	} else {
		url = "/address/getDefault"
		data = {"default_add" : "Y"}			
	}
	
	$.ajax({
		type : "POST",                              
		url : url,
		data : JSON.stringify(data),  	
		dataType : "text",
		contentType : "application/json",		
		
		success : function(result) {
			console.log(result);
			
			var html = "";

			if (result == "") {
				html += `<button class="btn btn-outline-secondary address_search_btn" id="address_search_btn" ><i class="bi bi-house"></i> 배송지 입력하기</button>`  
			} else {

				var result =  JSON.parse(result);
				
				html +=	`<table class="address_info_table">` +
							`<tr>` +
								`<td class="address_info_table_col1">` 
								if(`${result.default_add}` == `Y`) {
				html +=				`<div style="color: #6768ab; font-weight: bold;" id="user_info_alias"><i class="bi bi-geo-alt-fill"></i>&nbsp;${result.address_alias}&nbsp;[기본배송지]</div>` 	
								} else {
				html +=				`<div id="user_info_alias">${result.address_alias}</div>`
								}			
				html +=				`<span id="user_info_tel"> ${result.address_tel}</span>&nbsp;/&nbsp;` +
									`<span id="user_info_name">${result.address_name}</span>` +
									`<br>[` +
									`<span id="user_info_zone_code">${result.zone_code}</span>]&nbsp;` +
									`<span id="user_info_road_add">${result.road_add}</span>&nbsp;` +
									`<span id="user_info_detail_add">${result.detail_add}</span>&nbsp;` +
								`</td>` +	
								`<td class="address_info_table_col2">` +	
									`<span class="modal_update"><button class="btn btn-outline-secondary address_search_btn_two" id="address_search_btn"><i class="bi bi-pencil-square"></i> 수정</button></span>` +
								`</td>` +
							`</tr>` +
						`</table>` 							
							
			}
			ById('address_table_col1').innerHTML = html;		
		},
		
		error: function(request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
	        
		}	
	})
}

/***************************** 배송지 목록 (modal) 모달 표시 function *****************************/
function address_list() {

	$.ajax({
		type : "POST",                              
		url : "/address/allList",
		dataType : "json",
		contentType : "application/json",
		
		success : function(result) {	
			
			var html = "";
			
			for (i=0; i < result.length; i++) {
				let checked = (i==0) ? "checked" : "";
				let address = (i==0) ? " [기본배송지]" : "";
				let no = i;
				
				html +=			`<tr>` +
								`<td class="address_list_table_col1">` +
									`<input class="form-check-input" type="radio" name="address_radio" id="address_radio+${no}" value=${result[i].address_no} ${checked}></td>` +
									`<input type="hidden" value=${result[i].address_no}>` +
									`<input type="hidden" value=${result[i].address_alias}>` +
									`<input type="hidden" value=${result[i].address_tel}>` +
									`<input type="hidden" value=${result[i].address_name}>` +
									`<input type="hidden" value=${result[i].zone_code}>` +
									`<input type="hidden" value=${result[i].road_add}>` +
									`<input type="hidden" value=${result[i].detail_add}>` +								
								`<td class="address_list_table_col2">`
								
									if (i==0) {
				html +=				` <label for="address_radio+${no}"><div style="color: #6768ab; font-weight: bold;"><i class="bi bi-geo-alt-fill"></i>&nbsp;${result[i].address_alias}&nbsp;${address}</div>` 										
									} else {
				html +=			  	` <label for="address_radio+${no}"><div> ${result[i].address_alias}${address}</div>` 									
									}
				html +=				 `<span>${result[i].address_tel}</span>&nbsp;/&nbsp;` + 
								     `<span>${result[i].address_name}</span>` +
								     `<br>[` +
								     `<span>${result[i].zone_code}</span>]&nbsp;` +
								     `<span>${result[i].road_add}</span>&nbsp;` +
								     `<span>${result[i].detail_add}</span><label>` +
								`</td>` +
								
								`<td class="address_list_table_col3">` + 
									`<div><button class="btn btn-outline-primary address_list_table_update" id="address_list_table_update" value=${result[i].address_no}><i class="bi bi-pen"></i></button></div>` 
								
									if(i!=0) {
				html +=				`<div><button class="btn btn-outline-primary address_list_table_delete" id="address_list_table_delete" value=${result[i].address_no}><i class="bi bi-trash"></i></button></div>` 										
									}
				html +=			`</td>` +
							`</tr>` 

			}	

			ById('address_list_table').innerHTML = html;

		},
		error: function(request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}				
			
	}) 
	
};



/***************************** 다음 우편번호 찾기 서비스 *****************************/

//다음 우편번호 찾기 서비스
function execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraroadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraroadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraroadAddr += (extraroadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraroadAddr !== '') {
						extraroadAddr = ' (' + extraroadAddr + ')';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('zonecode').value = data.zonecode;
					document.getElementById("roadAddr").value = roadAddr;
					// document.getElementById("jibunAddress").value = data.jibunAddress;

					// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
					if (roadAddr !== '') {
						document.getElementById("extraAddress").value = extraroadAddr;
					} else {
						document.getElementById("extraAddress").value = '';
					}

					var guideTextBox = document.getElementById("guide");
					// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					if (data.autoroadAddress) {
						var exproadAddr = data.autoroadAddress
								+ extraroadAddr;
						guideTextBox.innerHTML = '(예상 도로명 주소 : '
								+ exproadAddr + ')';
						guideTextBox.style.display = 'block';

					} else if (data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;
						guideTextBox.innerHTML = '(예상 지번 주소 : '
								+ expJibunAddr + ')';
						guideTextBox.style.display = 'block';
					} else {
						guideTextBox.innerHTML = '';
						guideTextBox.style.display = 'none';
					}

				}

			// 주소 창을 닫거나, 입력하였을 경우 실행되는 부분	
			, onclose: function(state) {

		        if(state === 'FORCE_CLOSE'){
					alert("주소를 입력하지 않고 종료합니다."); 
		        	
		        } else if(state === 'COMPLETE_CLOSE'){
		        	
		        }
		    }
			
			}).open();
}
