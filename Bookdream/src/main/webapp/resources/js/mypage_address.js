$(function() {
		load_default();
		address_list();
})

// 배송지 입력하기 누르면 초기화됨
$('#modal_open').click(function() {
	$('#address_alias').val('');
	$('#address_name').val('');
	$('#address_tel').val('');
	$('#zonecode').val('');
	$('#roadAddr').val('');
	$('#detailAddress').val('');

	$('#modal_address_update').hide();
	$('#modal_address_insert').show();

})
	
// 주소 등록
$('#modal_address_insert').click(function() {
	
	address_insert(0);
})

// 주소 수정
$('#modal_address_update').click(function() {
	
	address_insert(1);
})


// 주소 입력 및 수정란
function address_insert(no) {
	
	// INPUT VALUE 값 저장
	var address_alias = $('input[name="address_alias"]').val();
	var address_name = $('input[name="address_name"]').val();
	var address_tel = $('input[name="address_tel"]').val();
	var zone_code = $('input[name="address_zonecode"]').val();
	var road_add = $('input[name="address_roadAddr"]').val();
	var detail_add = $('input[name="address_detailAddress"]').val();
	var address_no = $('input[name="address_no"]').val();
	
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
							$('#exampleModal').modal('hide');
							$('#modal-backdrop').modal('hide');
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

			},
			error: function(request, status, error) {
		        console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
			}				
		});			
		
	}
	
}




// 기본 배송지 표시
function load_default() {
		
			
		url = "/address/getDefault"
		data = {"default_add" : 'Y'}	
			
			$.ajax({
				type : "POST",                              
				url : url,
				data : JSON.stringify(data),  	
				dataType : "text",
				contentType : "application/json",		
				
				success : function(result) {
					
					var html = "";

					if (result == "") {
						html += `! 기본 배송지가 없습니다.`		
					} else {

						var result =  JSON.parse(result);

						html +=	`<div>`
						
									if(`${result.default_add}` == `Y`) {
						html +=			`<div style="color: purple; font-weight: bold;">${result.address_alias}&nbsp;<i class="bi bi-geo-alt-fill"></i>&nbsp;[기본배송지]</div>` 	
									} else {
						html +=			`<div>${result.address_alias}</div>`
									}			
						html +=			`<span> ${result.address_tel}</span>&nbsp;/&nbsp;` +
										`<span>${result.address_name}</span>` +
										`<br>[` +
										`<span>${result.zone_code}</span>]&nbsp;` +
										`<span>${result.road_add}</span>&nbsp;` +
										`<span>${result.detail_add}</span>&nbsp;` +
								`</div>` 							
									
					}
				      document.getElementById('address_main').innerHTML = html;		
				},
				
				error: function(request, status, error) {
			        console.log("code: " + request.status)
			        console.log("message: " + request.responseText)
			        console.log("error: " + error);
			        
				}	
			
			
		})
	}



// 기본배송지를 포함한 사용자의 주소 목록 표시
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
				
				html += `<table class="addresslist_table">` +	
							`<tr>` +
								`<td class="addresslist_table_col1">` +
									`<input class="form-check-input" type="radio" name="address_radio" id="address_radio+${no}" value=${result[i].address_no} ${checked}></td>` +
									`<input type="hidden" value=${result[i].address_no}>` +
									`<input type="hidden" value=${result[i].address_alias}>` +
									`<input type="hidden" value=${result[i].address_tel}>` +
									`<input type="hidden" value=${result[i].address_name}>` +
									`<input type="hidden" value=${result[i].zone_code}>` +
									`<input type="hidden" value=${result[i].road_add}>` +
									`<input type="hidden" value=${result[i].detail_add}>` +
								
								`<td class="addresslist_table_col2">`
								
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
								
								`<td class="addresslist_table_col3">` + 
									`<div><button class="btn btn-light" onclick="modal_address_get(this)" value=${result[i].address_no}><i class="bi bi-pen"></i></button></div>` +
									`<div><button class="btn btn-light" onclick="modal_address_delete(this)" value=${result[i].address_no}><i class="bi bi-trash"></i></button></div>` +
								`</td>` +
							`</tr>` +
						`</table>`			

			}	

		      document.getElementById('addresslist_main').innerHTML = html;

		},
		error: function(request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}				
			
	}) 
	
};

// 주소 삭제
function modal_address_delete(no) {
	 
	var address_no = $(no).val();
	var data = {"address_no" : address_no};
	console.log(data);
	
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
function modal_address_get(no) {


	$('#exampleModal').modal('show');
	$('#modal_address_insert').hide();
	$('#modal_address_update').show();
	
	
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
			$('#address_alias').val(result.address_alias);
			$('#address_name').val(result.address_name);
			$('#address_tel').val(result.address_tel);
			$('#zonecode').val(result.zone_code);
			$('#roadAddr').val(result.road_add);
			$('#detailAddress').val(result.detail_add);
			$('#address_no').val(result.address_no);
			
		} ,
		
		error: function(request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}	
	})
}

// 기본배송지 설정을 눌려야 버튼이 활성화 
$('#address_default_check').click(function() {
	var check = $("#address_default_check").prop("checked");
	
	if (check) {
		$('#address_change_button').attr('disabled', false);
	} else {
		$('#address_change_button').attr('disabled', true);
	}
	
})



//주소 목록 창에서 저장
$('#address_change_button').click(function() {

	// 선택한 주소의 address_no 저장
	var address_no = $('input[name=address_radio]:checked').val();

	// 기본 배송지 설정
	// 기본 배송지 설정을 누르고 저장
	if ($('input[id=address_default_check]').is(':checked')) {
		
		alert("기본 배송지를 변경합니다.");

		var data = {"address_no" : address_no};
		
		$.ajax ({
			type : 'POST',
			url : '/address/default',
			data : JSON.stringify(data),   
			dataType : 'text',
			contentType : "application/json",		
			
			success : function() {	
				load_default();
				address_list();
			},
			
			error: function(request, status, error) {
		        console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
			}	
		})

	} 
		
})




//////////////////////////////////////////////////다음 우편번호 API //////////////////////////////////////////////////

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