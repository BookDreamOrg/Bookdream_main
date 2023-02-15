/*  */
$(function() {
	// 주문차트
	orderDateChart()
	// 결제차트
	payWekDateChart()
	// 결제 총 금액
	totalPaymentAmount()
	// 금주 취소/반품 처리
	workTable(1)
	// 주문 총 카운트
	orderStatusCount()
})

/***************************** getElementById function *****************************/
function ById(id) {
	return document.getElementById(id);
}

/***************************** comma function *****************************/
function comma(value) {
	
	var comma = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

	return comma;
}

/***************************** switch case function *****************************/
function switchCase(data) {
	
	switch (data) {
	    case 10: return "결제취소요청"
	    case 12: return "반품요청"	 
	}

}

/***************************** 주문 현황 총 카운트 function *****************************/
function orderStatusCount() {
	
	$.ajax({
		type : "POST",                              
		url : "/admin/orderStatusCount",
		dataType : "json",
		contentType : "application/json",		
			
		success : function(data) {
		
			let html = ''
			let pymntCmplt
			let delivery
			let cmpltDlvry
			let test
			let pymcnRqst
			let cnclPymnt
			let rqstRtrn
			let cmpltRtrn
				
			for(order of data) {
				
				if(order.ORDER_STATUS == 0) {
					pymntCmplt = order.STATUSCOUNT
				} 
				if(order.ORDER_STATUS == 1) {
					delivery = order.STATUSCOUNT
				} 
				if(order.ORDER_STATUS == 2) {
					cmpltDlvry = order.STATUSCOUNT
				} 
				if(order.ORDER_STATUS == 3) {
					test = order.STATUSCOUNT
				} 
				if(order.ORDER_STATUS == 10) {
					pymcnRqst = order.STATUSCOUNT
				} 
				if(order.ORDER_STATUS == 11) {
					cnclPymnt = order.STATUSCOUNT
				} 
				if(order.ORDER_STATUS == 12) {
					rqstRtrn = order.STATUSCOUNT
				} 
				if(order.ORDER_STATUS == 13) {
					cmpltRtrn = order.STATUSCOUNT
				} 
			
			}
					pymntCmplt = pymntCmplt === undefined ? 0 : pymntCmplt
					delivery = delivery === undefined ? 0 : delivery
					cmpltDlvry = cmpltDlvry === undefined ? 0 : cmpltDlvry
					test = test === undefined ? 0 : test
					pymcnRqst = pymcnRqst === undefined ? 0 : pymcnRqst	
					cnclPymnt = cnclPymnt === undefined ? 0 : cnclPymnt
					rqstRtrn = rqstRtrn === undefined ? 0 : rqstRtrn	
					cmpltRtrn = cmpltRtrn === undefined ? 0 : cmpltRtrn	
							
			  html += `<p class="card-text">결제완료 ${pymntCmplt} 배송중 ${delivery} 배송완료 ${cmpltDlvry} </p>
		    		<p class="card-text">결제취소신청 ${pymcnRqst} 결제취소 ${cnclPymnt} 반품신청 ${rqstRtrn} 반품완료 ${cmpltRtrn} </p>`
			
				  ById('card-body').innerHTML = html
		},
			
		
		
		
		
		
		error: function(request, status, error) {
		       console.log("code: " + request.status)
		       console.log("message: " + request.responseText)
		       console.log("error: " + error);
		        
		}	
				
})	
} 


/***************************** 주문/주문취소/반품 차트 카운트 function *****************************/
function countChart(data) {

	let date = []
	let cnt = []
	let ccnt = []
	
	for(order of data) {
		date.push(order.ORDER_DATE)
		cnt.push(order.CNT)
		ccnt.push(order.CNT2)
	}
	
	console.log(data)
	
	let day6 = date[0]
	let day5 = date[1]
	let day4 = date[2]
	let day3 = date[3]
	let day2 = date[4]
	let day1 = date[5]
	let today = date[6]
	
	let cnt6 = cnt[0]
	let cnt5 = cnt[1]
	let cnt4 = cnt[2]
	let cnt3 = cnt[3]
	let cnt2 = cnt[4]
	let cnt1 = cnt[5]
	let tocnt = cnt[6]

	let ccnt6 = ccnt[7]
	let ccnt5 = ccnt[8]
	let ccnt4 = ccnt[9]
	let ccnt3 = ccnt[10]
	let ccnt2 = ccnt[11]
	let ccnt1 = ccnt[12]
	let toccnt = ccnt[13]	
	
		// 차트를 그럴 영역을 dom요소로 가져온다.
		var chartArea = document.getElementById('orderChart').getContext('2d');
							
		// 차트를 생성한다. 
		Chart.defaults.font.size = 10;
		
		var myChart = new Chart(chartArea, {
			
		    // ①차트의 종류(String)
		    type: 'line',
		    
		    // ②차트의 데이터(Object)
		    data: {
		    	
		        // ③x축에 들어갈 이름들(Array)
		        labels: [ day6, day5, day4, day3, day2, day1, today],
		        
		        // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
		        datasets: [{
		        	
		        	// 점 삭제

		            // ⑤dataset의 이름(String)
		            label: '주문',
		            
		            // ⑥dataset값(Array)
		            data: [cnt6, cnt5, cnt4, cnt3, cnt2, cnt1, tocnt],
		            
		            // ⑦dataset의 배경색(rgba값을 String으로 표현)
		            backgroundColor: 'rgba(103,104,171, 0.2)',
		            
		            // ⑧dataset의 선 색(rgba값을 String으로 표현)
		            borderColor: 'rgba(103, 104, 171, 1)',
		            
		            // ⑨dataset의 선 두께(Number)
		            borderWidth: 1
		            
		            
		        }, {
		        	
		        	// 점 삭제
		        	pointRadius: 0,
		            // ⑤dataset의 이름(String)
		            label: '취소',
		            
		            type:'line',
		            
		            // ⑥dataset값(Array)
		            data: [ccnt6, ccnt5, ccnt4, ccnt3, ccnt2, ccnt1, toccnt],
		            
		            // ⑦dataset의 배경색(rgba값을 String으로 표현)
		            backgroundColor: 'rgba(255, 0, 0, 0.2)',
		            
		            // ⑧dataset의 선 색(rgba값을 String으로 표현)
		            borderColor: 'rgba(255, 0, 0, 1)',
		            
		            // ⑨dataset의 선 두께(Number)
		            borderWidth: 1
		        	

		        }],
		        
		        
		        
		    },
		    
		    
		  					    
		    // ⑩차트의 설정(Object)
		    options: {
	            
		        // ⑪x축에 관한 설정(Object)
	                scales: {
			            // ⑫y축에 대한 설정(Object)
	                	y: {
			                // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
			                //beginAtZero: true
			            	suggestedMin: 0,
			                suggestedMax: 5,
			                stepSize: 2,
			                
			                ticks: {
			                    stepSize: 1,
			                    min: 0
			                       }
			                
			            }
	                }
		        
		    },
		    
    

		})
	
	
}


/* 주간 주문 카운트 */
function orderDateChart() {
						
		$.ajax({
			type : "POST",                              
			url : "/admin/wekOrder",
			dataType : "json",
			contentType : "application/json",		
				
			success : function(data) {
			
				countChart(data)
				console.log("주간차트 로딩");
				
			},
				
			error: function(request, status, error) {
			       console.log("code: " + request.status)
			       console.log("message: " + request.responseText)
			       console.log("error: " + error);
			        
			}	
					
	})
	

}

/* 월간 주문 카운트 */
function orderMlyDateChart() {
						
		$.ajax({
			type : "POST",                              
			url : "/admin/mlyOrder",
			dataType : "json",
			contentType : "application/json",		
				
			success : function(data) {

				console.log(data)
				countChart(data)
				console.log("월간차트 로딩");
									
			},
				
			error: function(request, status, error) {
			       console.log("code: " + request.status)
			       console.log("message: " + request.responseText)
			       console.log("error: " + error);
			        
			}	
			
			
		})	
	}

/***************************** 월간 카운트 차트 버튼 *****************************/
$(document).on("click", "#mly_chart_btn", function(e) {
	Chart.getChart(orderChart).destroy(); 
	orderMlyDateChart()
})

/***************************** 주간 카운트 차트 버튼 *****************************/
$(document).on("click", "#wek_chart_btn", function(e) {
	Chart.getChart(orderChart).destroy(); 
	orderDateChart()
})


/* 주간 결제 금액 */
function payWekDateChart() {
						
		$.ajax({
			type : "POST",                              
			url : "/admin/wekPay",
			dataType : "json",
			contentType : "application/json",		
				
			success : function(data) {
			
				payChart(data)
				
				console.log("주간결제 로딩");
				
			},
				
			error: function(request, status, error) {
			       console.log("code: " + request.status)
			       console.log("message: " + request.responseText)
			       console.log("error: " + error);
			        
			}	
					
	})
	

}

function payMlyDateChart(){
	
	$.ajax({
		type : "POST",                              
		url : "/admin/MlyPay",
		dataType : "json",
		contentType : "application/json",		
			
		success : function(data) {
		
			payChart(data)
			
			console.log("월간결제 로딩");
			
		},
			
		error: function(request, status, error) {
		       console.log("code: " + request.status)
		       console.log("message: " + request.responseText)
		       console.log("error: " + error);
		        
		}	
				
	})
	
}


function payChart(data) {

	let date = []
	let price = []
	


	for (pay of data) {
		date.push(pay.PAY_DATE)
		price.push(pay.PRICE)
	}	
	
	let day6 = date[0]
	let day5 = date[1]
	let day4 = date[2]
	let day3 = date[3]
	let day2 = date[4]
	let day1 = date[5]
	let today = date[6]

	let toprice = price[0]
	let price1 = price[1]
	let price2 = price[2]
	let price3 = price[3]
	let price4 = price[4]
	let price5 = price[5]
	let price6 = price[6]
	
		// 차트를 그럴 영역을 dom요소로 가져온다.
		var chartArea = document.getElementById('myChart').getContext('2d');
							
		// 차트를 생성한다. 
		Chart.defaults.font.size = 10;
		
		var payChart = new Chart(chartArea, {
			
		    // ①차트의 종류(String)
		    type: 'bar',
		    
		    // ②차트의 데이터(Object)
		    data: {
		    	
		        // ③x축에 들어갈 이름들(Array)
		        labels: [ day6, day5, day4, day3, day2, day1, today],
		        
		        // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
		        datasets: [{
		        	
		        	// 점 삭제
		        	pointRadius: 0,
		            // ⑤dataset의 이름(String)
		            label: '금액',
		            
		            // ⑥dataset값(Array)
		            data: [toprice, price1, price2, price3, price4, price5, price6],
		            
		            // ⑦dataset의 배경색(rgba값을 String으로 표현)
		            backgroundColor: 'rgba(103,104,171, 0.8)',
		            
		            // ⑧dataset의 선 색(rgba값을 String으로 표현)
		            borderColor: 'rgba(103, 104, 171, 1)',
		            
		            // ⑨dataset의 선 두께(Number)
		            borderWidth: 1
		            
		            
		        }],
		        		        
		    },
		    
		    
		  					    
		    // ⑩차트의 설정(Object)
		    options: {
	            
		        // ⑪x축에 관한 설정(Object)
	                scales: {
			            // ⑫y축에 대한 설정(Object)
	                	y: {
			                // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
			                //beginAtZero: true
			            	suggestedMin: 0,
			                suggestedMax: 300000,
			                stepSize: 2
			            }
	                }
		        
		    },
		    
    

		})	
	
}

/***************************** 월간 결제 차트 버튼 *****************************/
$(document).on("click", "#mly_paychart_btn", function(e) {
	ById('myChart').style.display = "none";
	Chart.getChart(myChart).destroy(); 	
	payMlyDateChart()
})

/***************************** 주간 결제 차트 버튼 *****************************/
$(document).on("click", "#wek_paychart_btn", function(e) {
	Chart.getChart(myChart).destroy(); 
	payWekDateChart()
})

/***************************** 총 결제금액 FUNCTION *****************************/
function totalPaymentAmount() {
	
	$.ajax({
		type : "POST",                              
		url : "/admin/totalPayment",
		dataType : "json",
		contentType : "application/json",		
			
		success : function(data) {
			
			let amount = "총 결제금액 " + " " + comma(data.TOTAL_PRICE) + " " + "원"
			
			ById('amount').innerHTML = amount;
		},
			
		error: function(request, status, error) {
		       console.log("code: " + request.status)
		       console.log("message: " + request.responseText)
		       console.log("error: " + error);
		        
		}	
				
	})	

}

function workTable(no) {
	
	$.ajax({
		type : "GET",                              
		url : "/admin/cancelOrderWek?no="+no,
		dataType : "json",
		contentType : "application/json",		
			
		success : function(data) {

			let html = `<table class="work_table">
							<tr>
								<th>주문번호</th>
								<th>ID</th>
								<th>주문명</th>
								<th>결제시간</th>
								<th>취소시간</th>
								<th>요청상태</th>
								<th>승인</th>
							</tr>`			
								
				
			let paging = ''
				
			for (order of data.list) {
//			 console.log(order.CANCEL_DATE)
//			 console.log(order.ORDER_NAME)
//			 console.log(order.ORDER_DATE)
//			 console.log(order.ORDER_NO)
//			 console.log(order.ORDER_STATUS)
				
			 let status = switchCase(order.ORDER_STATUS)
			 			
				html +=	
						`<tr>
							<td class="work_table_col1">
								${order.ORDER_NO}
							</td>
							<td class="work_table_col2">
								${order.USER_ID}
							</td>							
							<td class="work_table_col3">
								${order.ORDER_NAME}
							</td>
							<td class="work_table_col4">
								${order.ORDER_DATE}
							</td>
							<td class="work_table_col5">
								${order.CANCEL_DATE}
							</td>
							<td class="work_table_col6">
								${status}
							</td>							
							<td class="work_table_col7">
								<button class="page-link aprvl_btn" value="${order.ORDER_NO}" value1="${order.ORDER_NO}">승인</button>		
								<input type="hidden" id="status${order.ORDER_NO}" value="${order.ORDER_STATUS}">
								<input type="hidden" id="userno${order.ORDER_NO}" value="${order.USER_NO}">
							</td>	
						</tr>`	
			}	
				html += `</table>`
			
			ById('today_box_body').innerHTML = html
			

			/* 
			console.log(data.page.startPage)
			console.log(data.page.endPage)
			console.log(data.page.prev)
			console.log(data.page.next)
			console.log(data.page.totalPage)
			console.log(data.page.cri.pageNum)
			console.log(data.page.cri.amount)
			*/
			
			paging += `<div class="text-center">
						<ul class="pagination justify-content-center">`
						
						if(data.page.prev) {
			paging +=		`<li class="page-item paginate_button previous">
								<button class="page-link ><<</button>
							</li>`							
						}
						for (let i = data.page.startPage; i<=data.page.endPage; i++) {
							let active = no == i ? 'active' : ''
			paging +=		`<li class="page-item paginate_button ${active} " >								
								<button class="page-link paging_btn " value="${i}" >${i}</button>
							</li>`							 
							 
						}	
						if(data.page.next) {
			paging +=		`<li class="page-item paginate_button next">
								<button class="page-link">>></button>
							</li>`						
						}																		

							
			paging +=	`</ul>
					</div>`		
						
			ById('paging').innerHTML = paging

			
		},
			
		error: function(request, status, error) {
		       console.log("code: " + request.status)
		       console.log("message: " + request.responseText)
		       console.log("error: " + error);
		        
		}			
	})		
}


/***************************** 페이지 이동 버튼 클릭 *****************************/
$(document).on("click", "button.paging_btn", function(e) {	
	
	let pageNum = e.currentTarget.value

	workTable(pageNum)
})



/***************************** 취소/반품 승인 버튼 클릭 *****************************/
$(document).on("click", "button.aprvl_btn", function(e) {	
	
	let order_no = e.currentTarget.value
	let status = ById('status'+order_no).value
	let user_no = ById('userno'+order_no).value
	
	orderAprvl(order_no, status, user_no)
})

/***************************** 취소/반품 승인 FUNCTION *****************************/
function orderAprvl(order_no, status, user_no) {
	
	let data = {
				"order_no" : order_no,
				"order_status" : status,
				"user_no" : user_no
	}
	
	$.ajax({
		type : "POST",                              
		url : "/admin/orderAprvl",
		data : JSON.stringify(data),  
		dataType : "text",
		contentType : "application/json",		
			
		success : function() {
				
			alert("해당 요청을 승인하였습니다.");
			console.log("승인완료");
			
			workTable(1)
		
			// 결제 총 카운트		
			totalPaymentAmount()
			// 결제차트			
			Chart.getChart(myChart).destroy(); 
			payWekDateChart()			
			
			// 주문 총 카운트
			orderStatusCount()
			// 주문차트			
			Chart.getChart(orderChart).destroy(); 			
			orderDateChart()
		},
			
		error: function(request, status, error) {
		       console.log("code: " + request.status)
		       console.log("message: " + request.responseText)
		       console.log("error: " + error);
		        
		}	
				
	})		
	
}

