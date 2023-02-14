/*  */
$(function() {
	orderDateChart()
	payWekDateChart()
})

/***************************** getElementById function *****************************/
function ById(id) {
	return document.getElementById(id);
}

/***************************** 주문/주문취소/반품 카운트 function *****************************/
function countChart(data) {

	let date = []
	let cnt = []
	let ccnt = []
	
	for(order of data) {
		date.push(order.ORDER_DATE)
		cnt.push(order.CNT)
		ccnt.push(order.CNT2)
	}
	
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
		        	pointRadius: 0,
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
			                suggestedMax: 10,
			                stepSize: 2
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
			
				console.log(data)
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
	
	console.log(data)

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
	Chart.getChart(myChart).destroy(); 
	payMlyDateChart()
})

/***************************** 주간 결제 차트 버튼 *****************************/
$(document).on("click", "#wek_paychart_btn", function(e) {
	Chart.getChart(myChart).destroy(); 
	payWekDateChart()
})
