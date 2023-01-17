////////////////////////////////////////////////////////////////////////////


// 최초 로딩 시
$(function() {
	$('#pay_labels').hide();
})

// 사이드바 스크롤따라 이동
$(document).ready(function(){
	  var currentPosition = parseInt($(".sidebar").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".sidebar").stop().animate({"top":position+currentPosition+"px"},1500);
	  });
	});

///////////////////////////////// Modal /////////////////////////////////

// 주소 목록 열기
$('#modal_open').click(function() {
	address_list();
    $('#modal').fadeIn();	
}); 

// 주소 목록 닫기
$("#modal_close").click(function() {
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
				var no = i;
				
				html += '<div class="modal_address_list_col">' +
						'<div class="modal_address_list_check">' +
							'<input type="radio" id="address_radio" name="address_radio" ' + 'value=' + no + '>' +
							'<input type="hidden" '+' name= '+ 'n'+ no +' value=" '+ result[i].address_no +' ">' +
							'<input type="hidden" '+' name= '+ 'a'+ no +' value=" '+ result[i].address_alias +' ">' +
							'<input type="hidden" '+' name= '+ 't'+ no +' value=" '+ result[i].address_tel +' ">' +
							'<input type="hidden" '+' name= '+ 'm'+ no +' value=" '+ result[i].address_name +' ">' +
							'<input type="hidden" '+' name= '+ 'z'+ no +' value=" '+ result[i].zone_code +' ">' +
							'<input type="hidden" '+' name= '+ 'r'+ no +' value=" '+ result[i].road_add +' " >' +
							'<input type="hidden" '+' name= '+ 'd'+ no +' value=" '+ result[i].detail_add +' ">' +
						'</div>' +
						
						'<div class="modal_address_list_main">' +
							'<div>' + result[i].address_alias + '</div>' +
							'<span>' + result[i].address_tel + '&nbsp;/&nbsp;</span>' +
							'<span>' + result[i].address_name + '</span>' +
							'<br>' +
							'<span>' + result[i].zone_code + '</span>' +
							'<span>' + result[i].road_add + '</span>' +
							'<span>' + result[i].detail_add + '</span></div>' +
						
							'<div class="modal_address_list_update">' +
								'<div><button onclick="moadl_address_get(this)" ' + 'value=" '+ result[i].address_no +' ">수정 </div>' +
								'<div><button onclick="modal_address_delete(this)" ' + 'value=" '+ result[i].address_no +' ">삭제</button></div>' +
							'</div>' +
						'</div>'

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


// 기본 배송지 표시
function user_address_info(no) {
	
	var num = no;
	
	
}


	
// 주소 등록
$('#modal2_address_insert').click(function() {
	
	address_insert();
})

// 주소 수정
$('#modal2_address_update').click(function() {
	
	address_insert();
})

function address_insert() {
	
	// INPUT VALUE 값 저장
	var address_alias = $('input[name="moadl2_address_alias"]').val();
	var address_name = $('input[name="moadl2_address_name"]').val();
	var address_tel = $('input[name="moadl2_address_tel"]').val();
	var zone_code = $('input[name="moadl2_address_zonecode"]').val();
	var road_add = $('input[name="moadl2_address_roadAddr"]').val();
	var detail_add = $('input[name="moadl2_address_detailAddress"]').val();
	var address_no = $('input[name="modal2_address_no"]').val();
	
	var addr_json = {
					 "address_alias" : address_alias,
					 "address_name" : address_name,
					 "address_tel" : address_tel,
					 "zone_code" : zone_code,
					 "road_add" : road_add,
					 "detail_add" : detail_add,
					 "address_no" : address_no
					};
	
	// 주소 입력시
	if($('#modal2_address_insert').is(':visible') == true) {

		$.ajax({
			type : "POST",                              
			url : "/address/insert",         
			data : JSON.stringify(addr_json),   
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
		
	// 주소 수정시
	} else {
		
		$.ajax({
			type : "POST",                              
			url : "/address/update",         
			data : JSON.stringify(addr_json),   
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

// 주소수정시 해당 주소의 값 가져옴
function moadl_address_get(no) {

	$('#modal2_address_update').show();
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

			$('#moadl2_address_alias').val(result.address_alias);
			$('#moadl2_address_name').val(result.address_name);
			$('#moadl2_address_tel').val(result.address_tel);
			$('#zonecode').val(result.zone_code);
			$('#roadAddr').val(result.road_add);
			$('#detailAddress').val(result.detail_add);
			$('#modal2_address_no').val(result.address_no);
			
			alert("add : " + result.address_no);
			
		},
		
		error: function(request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}	
	})
}

// 주소 목록 창에서 저장
$('#modal_reg_check').click(function() {

	// 선택한 주소의 값 저장
	var address_select = $('input[name=address_radio]:checked').val();
	var length = $('input[name=address_radio]').length
	var no, alias, tel, name, code, road, detail;
	
	for (i=0; i<length; i++) {
		if (address_select == i) {
			no = $('input[name= '+ 'n'+ i +' ]').val();
			alias = $('input[name= '+ 'a'+ i +' ]').val();
			tel = $('input[name= '+  't'+ i +' ]').val();
			name = $('input[name= '+ 'm'+ i +' ]').val();
			code = $('input[name= '+ 'z'+ i +' ]').val();
			road = $('input[name= '+ 'r' + i +' ]').val();
			detail = $('input[name= '+ 'd'+ i +' ]').val();
		}
	} 
	
	// 기본 배송지 설정
	// 기본 배송지 설정 버튼을 누른 상태로 저장을 한다면 기본배송
	if ($('input[id=default_address_check]').is(':checked')) {
		
		alert("기본 배송지로 설정 합니다");

		var address_no = no;
		alert("address_no : " + address_no);
		var data = {"address_no" : address_no};
		
		$.ajax ({
			type : 'POST',
			url : '/address/default',
			data : JSON.stringify(data),   
			dataType : 'text',
			contentType : "application/json",		
			
			success : function() {	

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

		$('#modal').fadeOut();	
	}
	
	// 배송지 정보에 값을 표기 함
	document.getElementById('user_info_alias').textContent  = alias;
	document.getElementById('user_info_tel').textContent  = tel;
	document.getElementById('user_info_name').textContent  = name;
	document.getElementById('user_info_zone_code').textContent  = '['+code+']';
	document.getElementById('user_info_road_add').textContent  = road;
	document.getElementById('user_info_detail_add').textContent  = detail;
	
})

//////////////////////////// 주소입력  ///////////////////////////

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

////////////////////////////////////////결제 //////////////////////////////

//드림페이 = Iamport // 그 외 결제 = Tosspay 
	
	$("#pay_button").click(function() {
		alert("사용자 정보를 세션에 저장");

		
		var order_address =         document.getElementById('user_info_zone_code').innerHTML 
		  					+ " " + document.getElementById('user_info_road_add').innerHTML
						    + " " + document.getElementById('user_info_detail_add').innerHTML;
		
		var order_receiver = document.getElementById('user_info_alias').innerHTML; 
		var order_tel = document.getElementById('user_info_tel').innerHTML;
		
		var first_title = $('input[name="first_title"]').val();
		
		$.ajax({
			
			type : 'POST',
			url : '/cart/orderitem/save',
			data : 
			{"save_point" : 5000, 
			 "discount_price" : 3000,
			 "order_fee" : 0,
			 "order_comment" : '문앞에 두슈',
			 "order_receiver" : order_receiver,
			 "order_address" : order_address,
			 "order_tel" : order_tel
			},	
			dataType : 'text',
			
		  }).done(function() {
			  
				if ($('input[id="pay_hide"]:checked').is(":checked")) {
					
					alert("드림페이로 결제합니다.");
					  IMP.init('iamport'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
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
					alert("토스페이로 API 를 사용하여 결제합니다.");
					
					// radio에서 선택한 방식으로 결제			
				    var radio_val = $('input[name="pay_radio"]:checked').val();
					tossPayments.requestPayment(radio_val, {
						  amount: 500,
						  orderId: 'udUZEztqFae7yk3e90LwW',
						  orderName: first_title,
						  customerName: order_receiver,
						  successUrl: 'http://localhost:8000/cart/orderitem/success',
						  failUrl: 'http://localhost:8000/fail',
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
	