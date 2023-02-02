
// 페이지 로딩 
$(function() {
	$('#pay_labels').hide();
	$('#user_info_message').hide();
	user_address_info();
	sidebar();
})

//사이드바 스크롤따라 이동
$(document).ready(function(){
	  var currentPosition = parseInt($(".sidebar").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".sidebar").stop().animate({"top":position+currentPosition+"px"},2000);
	  });
	});


////////////////////////////////////////////////// Modal //////////////////////////////////////////////////

// 주소 목록 열기
function modal_open() {
	address_list();
    $('#modal').fadeIn();		
}

// 주소 목록 닫기
$("#modal_close").click(function() {
	user_address_info();
	$('#modal').fadeOut();		  
})

// 주소 입력창 열기
$("#modal2_open").click(function() {
	
	// 주소 입력창 초기화
	$('#moadl2_address_alias').val('');
	$('#moadl2_address_name').val('');
	$('#moadl2_address_tel').val('');
	$('#zonecode').val('');
	$('#roadAddr').val('');
	$('#detailAddress').val('');

	$('#modal2_address_update').hide();
	$('#modal2_address_insert').show();
	$('#modal2').fadeIn();	
})

// 주소 입력창 닫기
$("#modal2_close").click(function() {
	$('#modal2').fadeOut();		  
})

// 배송요청사항 열기
function modal3_open() {
	$('#modal3').fadeIn();		  
}


// 베송요청사항 닫기
$('#modal3_close').click(function() {
	$('#modal3').fadeOut();	
}) 
		  

// 배송요청사항 선택
function select_message(value) {
	
	if (value == 'message') {
		$('#message').attr('disabled', false);
	} else {
		$('#message').attr('disabled', true);
		$('#message').val("");
	}
}

$('#message_save').click(function() {

	var value = document.getElementById('message_select').value;
	var html = '';
	
	if (value == 'message') {
		value = document.getElementById('message').value;
		
		if (value == '') {
			alert("요청사항을 입력하세요.");
			return false;
		}
	} 
	
	html =	`${value}`

	$('#user_info_button').hide();
	$('#user_info_message').show();
	document.getElementById('user_info_message_text').innerHTML = html;
	$('#modal3').fadeOut();		
	
})


// 주소 목록 조회 갱신 (CRUD 시)
function address_list() {

	$.ajax({
		type : "POST",                              
		url : "/address/allList",
		data : "",		
		dataType : "json",
		contentType : "application/json",
		
		success : function(result) {	
			
			var html = "";
			
			for (i=0; i < result.length; i++) {
				let checked = (i==0) ? "checked" : "";
				let address = (i==0) ? "&nbsp;[기본배송지]" : "";
				let no = i;
				
				html += `<table>` +	
							`<tr>` +
								`<td class="address_col1">` +
									`<input class="form-check-input" type="radio" name="address_radio" id="address_radio+${no}" value=${result[i].address_no} ${checked}></td>` +
									`<input type="hidden" value=${result[i].address_no}>` +
									`<input type="hidden" value=${result[i].address_alias}>` +
									`<input type="hidden" value=${result[i].address_tel}>` +
									`<input type="hidden" value=${result[i].address_name}>` +
									`<input type="hidden" value=${result[i].zone_code}>` +
									`<input type="hidden" value=${result[i].road_add}>` +
									`<input type="hidden" value=${result[i].detail_add}>` +
								
								`<td class="address_col2">`
								
									if (i==0) {
				html +=				` <label for="address_radio+${no}"><div style="color: purple; font-weight: bold;"> ${result[i].address_alias}&nbsp;<i class="bi bi-geo-alt-fill"></i>${address}</div>` 										
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
								
								`<td class="address_col3">` + 
									`<div><button class="btn btn-light" onclick="moadl_address_get(this)" value=${result[i].address_no}><i class="bi bi-pen"></i></button></div>` +
									`<div><button class="btn btn-light" onclick="modal_address_delete(this)" value=${result[i].address_no}><i class="bi bi-trash"></i></button></div>` +
								`</td>` +
							`</tr>` +
						`</table>`			

			}	

		      document.getElementById('root').innerHTML = html;

		},
		error: function(request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}				
			
	}) 
	
};

//주소 목록 창에서 저장
$('#modal_reg_check').click(function() {

	// 선택한 주소의 address_no 저장
	var address_no = $('input[name=address_radio]:checked').val();

	// 기본 배송지 설정
	// 기본 배송지 설정을 누르고 저장
	if ($('input[id=default_address_check]').is(':checked')) {
		
		alert("기본 배송지로 설정 합니다");

		var data = {"address_no" : address_no};
		
		$.ajax ({
			type : 'POST',
			url : '/address/default',
			data : JSON.stringify(data),   
			dataType : 'text',
			contentType : "application/json",		
			
			success : function() {	
				
				// 기본 배송지로 갱신함
				user_address_info(0, address_no);
				$('#modal').fadeOut();	
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
		user_address_info(1, address_no);
		$('#modal').fadeOut();	
	}
		
})

// 배송지 표시
function user_address_info(no, address_no) {
	
	// 기본 배송지 표시
	if (no == 1) {
		url = "/address/get"
		data = {"address_no" : address_no}	
	// 선택한 배송지 표시
	} else {
		url = "/address/getDefault"
		data = {"default_add" : 'Y'}			
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
				html += `<button class="user_info_button insert" id="modal_open" onclick="modal_open()">` +
							`<span>배송지 입력하기</span>` + 
						`</button>` 		
			} else {

				var result =  JSON.parse(result);
				
				html +=	`<div>`
				
							if(`${result.default_add}` == `Y`) {
				html +=			`<div style="color: purple; font-weight: bold;" id="user_info_alias">${result.address_alias}&nbsp;<i class="bi bi-geo-alt-fill"></i>&nbsp;[기본배송지]</div>` 	
							} else {
				html +=			`<div id="user_info_alias">${result.address_alias}</div>`
							}			
				html +=		`<span id="user_info_tel"> ${result.address_tel}</span>&nbsp;/&nbsp;` +
							`<span id="user_info_name">${result.address_name}</span>` +
							`<br>[` +
							`<span id="user_info_zone_code">${result.zone_code}</span>]&nbsp;` +
							`<span id="user_info_road_add">${result.road_add}</span>&nbsp;` +
							`<span id="user_info_detail_add">${result.detail_add}</span>&nbsp;` +
							`<span class="modal_update"><button class="btn btn-outline-dark" id="modal_open" onclick="modal_open()"><i class="bi bi-pencil-square"></i></button></span>` +
						`</div>` 							
							
			}
		      document.getElementById('user_info_address').innerHTML = html;		
		},
		
		error: function(request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
	        
		}	
	})
}


// 주소 등록
$('#modal2_address_insert').click(function() {
	
	address_insert(0);
})

// 주소 수정
$('#modal2_address_update').click(function() {
	
	address_insert(1);
})


function address_insert(no) {
	
	// INPUT VALUE 값 저장
	var address_alias = $('input[name="moadl2_address_alias"]').val();
	var address_name = $('input[name="moadl2_address_name"]').val();
	var address_tel = $('input[name="moadl2_address_tel"]').val();
	var zone_code = $('input[name="moadl2_address_zonecode"]').val();
	var road_add = $('input[name="moadl2_address_roadAddr"]').val();
	var detail_add = $('input[name="moadl2_address_detailAddress"]').val();
	var address_no = $('input[name="modal2_address_no"]').val();
	
	if (address_alias == '') {
		alert("배송지 이름을 입력하세요.");
	} else if (address_name == '') {
		alert("받는사람 이름을 입력하세요.");
	} else if (address_tel == '') {
		alert("받는사람 전화번호를 입력하세요.");
	} else if (zone_code == '' || road_add == '' || detail_add == '') {
		alert("주소를 입력하세요.");
		
		// 주소 입력하기를 누르면 사용자의 주소 목록을 조회함
	} else if(no == 0) {
		$.ajax({
			type : "POST",                              
			url : "/address/allList",	
			dataType : "json",
			contentType : "application/json",
			
			success : function(result) {	
				
				// 등록된 주소가 없다면 생성한 주소는 기본 배송지로 설정됨		
				var checked = (result=="") ? "Y" : "N";

				var data = {
						 "address_alias" : address_alias,
						 "address_name" : address_name,
						 "address_tel" : address_tel,
						 "zone_code" : zone_code,
						 "road_add" : road_add,
						 "detail_add" : detail_add,
						 "address_no" : address_no,
						 "default_add" : checked
					};				
									
					$.ajax({
						type : "POST",                              
						url : "/address/insert",         
						data : JSON.stringify(data),   
						dataType : "text",
						contentType : "application/json",
						
						success : function() {	

							if(checked == 'Y') {
								alert("처음 생성한 배송지는 기본 배송지로 설정됩니다.");
							}
							// 주소 갱신
							address_list();
							$('#modal2').hide();

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
				// 주소 갱신
				address_list();
				$('#modal2').hide();

			},
			error: function(request, status, error) {
		        console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
			}				
		});			
		
	}
	
}


// 주소 삭제
function modal_address_delete(no) {
	 
	var address_no = $(no).val();
	var data = {"address_no" : address_no};

	$.ajax({
		type : "POST",                              
		url : "/address/get",
		data : JSON.stringify(data),  	
		dataType : "text",
		contentType : "application/json",
		
		success : function(result) {
					
			var result =  JSON.parse(result);
			
			if (result.default_add == 'Y') {
				
				alert("기본배송지는 삭제할 수 없습니다.");
				
			} else {
				
				$.ajax ({
					type : 'POST',
					url : '/address/delete',
					data : JSON.stringify(data),   
					dataType : 'text',
					contentType : "application/json",		
					
					success : function() {	
						// 주소 갱신
						address_list();	
					},
					
					error: function(request, status, error) {
				        console.log("code: " + request.status)
				        console.log("message: " + request.responseText)
				        console.log("error: " + error);
					}	
				})
				
			}
		},
		
		error: function(request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}	
		
		
	})
		
	
	
}

// 주소 수정시 해당 주소의 값 가져옴
function moadl_address_get(no) {

	// 수정 버튼 생성
	$('#modal2_address_update').show();
	// 저장 버튼 숨김
	$('#modal2_address_insert').hide();	
	$('#modal2').fadeIn();
	
	var address_no = $(no).val();
	var data = {"address_no" : address_no};
	
	$.ajax ({
		type : 'POST',
		url : '/address/get',
		data : JSON.stringify(data),   
		dataType : 'text',
		contentType : "application/json",		
		
		success : function(data) {	
			
			var result =  JSON.parse(data)

			// 해당 주소의 값 자동 입력
			$('#moadl2_address_alias').val(result.address_alias);
			$('#moadl2_address_name').val(result.address_name);
			$('#moadl2_address_tel').val(result.address_tel);
			$('#zonecode').val(result.zone_code);
			$('#roadAddr').val(result.road_add);
			$('#detailAddress').val(result.detail_add);
			$('#modal2_address_no').val(result.address_no);
			
		} ,
		
		error: function(request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}	
	})
}



////////////////////////////////////////////////// 할인관련  //////////////////////////////////////////////////


// , 제거 함수
function uncomma(id, value) {
	
	if (value == null) {
		var uncomma = parseInt(($(id).text().replace(/,/g , '')));			
	} else if (id == ''){
		var uncomma = parseInt($(value).val());
	} else if (id == '#use_point'){
		var uncomma = parseInt($(id).val().replace(/,/g , ''));	
	}
	return uncomma;
	
}

// , 추가 함수
function comma(id, value) {
	
	if (value == null) {
		var comma = id.toLocaleString();	
	} else {
		var comma = $(id).val(value.toLocaleString());		
	}

	return comma;
}


// 최대 포인트 사용
$('#max_point').click(function() {
	var final_price = uncomma('#sidebar_final_price');
	var point = uncomma('', '#max_point');	
	var value = uncomma('', '#use_point	');

	// 체크 누름
	if ($('input[id="max_point"]:checked').is(":checked")) {
		
		// 이전에 입력된 포인트가 있다면 0 
		if (value != 0){
			$('#use_point').val(0);	

			sidebar();
			value = uncomma('', '#use_point	');		
			final_price = uncomma('#sidebar_final_price');
		} 
		
		// 포인트가 상품금액보다 많다면, 입력된 포인트가 0 일 경우에만
		if ((final_price < point) && (value == 0)) {
			comma('#use_point', final_price);	
		} else {
			comma('#use_point', point);			
		}
		
	} else {
		$('#use_point').val(0);
	}
	
	sidebar();
})

// 포인트 수동 입력
$('#use_point').on('keyup', function() {

    // 최대 사용가능한 포인트
	var final_price = uncomma('#sidebar_final_price');	
	var point = uncomma('', '#max_point');			
	var value = this.value;
	
	// 직접 입력하면 최대 사용 포인트 체크박스 해제
	$("input[id=max_point]").prop("checked", false);
	
	// 숫자만 기입함
    this.value = value.replace(/\D/g, '');	

    // 사용할 포인트보다 많이 입력되면 최대 포인트로 변경

	if ((value >= point) && (final_price > point)) {
		comma('#use_point', point);			
		
	} else if ((value >= point) && (final_price < point)) {
		comma('#use_point', final_price);					
	}
	
})

// 다시 입력하려고 할 경우 0으로 됨
$('#use_point').click(function() {
	$('#use_point').val(0);
	sidebar();
})

// 공백이면 0으로 변경됨, 사용할 수 있는 포인트만큼 계산되어 적용
$('#use_point').focusout(function() {

	var final_price = uncomma('#sidebar_final_price');	
	var point =  uncomma('', '#max_point');		
	var value = this.value;
	
	if (value == '') {
		$('#use_point').val(0);	
	} 
	
	if ((value >= point) && (final_price > point)) {
		comma('#use_point', point);							
		
	} else if ((value >= point) && (final_price < point)) {
		comma('#use_point', final_price);			
	} else {
		$('#use_point').val(value);
	}
	
	sidebar();
});



function sidebar() {

	// , 제거
	var total_price = uncomma('#sidebar_total_price');	
	var delivery = uncomma('#sidebar_delivery');	
	var use_point = uncomma('#use_point','');
	


	// 계산
	var str_final_price = (total_price + delivery) - use_point
	
	var str_save_point = Math.round(str_final_price * 0.05);
	
	// , 추가 	
	var final_price = comma(str_final_price);
	var save_point = comma(str_save_point);
	var use_point = comma(use_point);


	console.log("use_point : " + use_point);
	
	let html = '';
	
	html = `<div class="sidebar_col">` +
			 `<span>쿠폰할인</span>` +
			 `<span class="sidebar_col_price">(-) <b id="sidebar_discount">0</b> 원</span>` +
			`</div>` +

			`<div class="sidebar_col">` +
				`<span>포인트사용</span>` +
				`<span class="sidebar_col_point">(-) <b id="sidebar_use_point">${use_point}</b> 원</span>` +
			`</div>` +
									
			`<hr>` +
			
			`<div class="sidebar_col_last" id="sidebar_col_last">` +
				`<span class="sidebar_col_title">최종결제금액</span>` +
				`<span class="sidebar_col_price final_price"><b id="sidebar_final_price">${final_price}</b> 원</span>` +
	
			`</div>` +
			
			`<div class="sidebar_save_point">(포인트 적립 : <b id="sidebar_save_point">${save_point}</b> 원)</div>`
			
			 document.getElementById('sidebar').innerHTML = html;
			
}



////////////////////////////////////////////////// 다음 우편번호 API //////////////////////////////////////////////////

	// 다음 우편번호 찾기 서비스
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

////////////////////////////////////////////////// 결제 API //////////////////////////////////////////////////

//드림페이 = Iamport // 그 외 결제 = Tosspay 
	
function innerHTML(id, int) {
	
	if (id == '') {
		var html = parseInt(document.getElementById(int).innerHTML.replace(/,/g , ''));
	} else {
		var html = document.getElementById(id).innerHTML;		
	}

	return html;
}	
	

	$("#pay_button").click(function() {

		// 주문 부문
		var order_name = $('input[name="first_title"]').val();
		var order_comment = innerHTML('user_info_message_text');			
		var order_receiver = innerHTML('user_info_name');			
		var order_address = "[" + innerHTML('user_info_zone_code') + "]"+ " " + 
							innerHTML('user_info_road_add')  + " " + 
							innerHTML('user_info_detail_add');
		var order_tel = innerHTML('user_info_tel');
		
		// 결제 부문
		var pay_method = $('input[name="pay_radio"]:checked').val();			
		var pay_fee = innerHTML('', 'sidebar_delivery');
		var discount_price = 0;
		var save_point = innerHTML('', 'sidebar_save_point');
		var use_point = innerHTML('', 'sidebar_use_point');
		var final_price = innerHTML('', 'sidebar_final_price');
		var total_price = innerHTML('', 'sidebar_total_price');
		
		if ((order_name == '') || (order_receiver == '') || (order_address == '') || (order_tel == '')	) {
			alert("배송인 정보를 입력하세요.");
			return false;
		}
		
		var data = {
					"order_name" : order_name,
					"pay_method" : pay_method,
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

		  }).done(function() {
			  
				if ($('input[id="pay_hide"]:checked').is(":checked")) {
					
					alert("드림페이로 결제합니다.");
					  IMP.init('iamport'); 
					  IMP.request_pay({
					    pg: "inicis",
					    pay_method: "card",
					    merchant_uid : 'merchant_'+new Date().getTime(),
					    name : '${first_title}',
					    amount : 14000,
					    buyer_email : 'iamport@siot.do',
					    buyer_name : '구매자',
					    buyer_tel : '010-1234-5678',
					    buyer_addr : '서울특별시 강남구 삼성동',
					    buyer_postcode : '123-456'
					    	
				            //m_redirect_url : 'http://www.naver.com'
				      }, function (rsp) { // callback
				          if (rsp.success) {
					
				          } else {
							alert("결제를 취소합니다.");
				          }
				      });		
				}   
				
				const clientKey = 'test_ck_OALnQvDd2VJn771bMENVMj7X41mN';
				var tossPayments = TossPayments(clientKey);		
				
				// 다른결제수단 버튼을 눌렀을 경우
				if ($('input[id="pay_show"]:checked').is(":checked")) {
					
					alert("다른 결제 수단으로 결제합니다.");

					// 랜덤 OrderId 생성
					// 한번 결제된 OrderId는 사용불가
					var random = "";
				    var possible = "abcdefghijklmnopqrstuvwxyz0123456789";
				    
				    for( var i=0; i < 13; i++ ) {
				    	random += possible.charAt(Math.floor(Math.random() * possible.length));
				    }
			       			
					// radio에서 선택한 방식으로 결제			

					tossPayments.requestPayment(pay_method, {
						  amount: 500,
						  orderId: random,
						  orderName: order_name,
						  customerName: order_receiver,
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
				}				
				
		  }).fail(function(data, textStatus, errorThrown) {
			  
			  console.log(data)

		  })
	})
	
	
	
// 다른 결제 수단 목록 숨김
function pay_hide() {
	   if($('input:radio[id=pay_hide]').is(':checked')){
	        $('#pay_labels').hide();
	   }
}


// 다른 결제 수단 목록 보임
function pay_show() {
	   if($('input:radio[id=pay_show]').is(':checked')){
	        $('#pay_labels').show();
	   }
}
	