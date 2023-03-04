/*  */
$(function() {
	// 주문차트
	orderDateChart()
	
	// 결제차트
	payWekDateChart()
	
	// 주문 총 카운트
	orderStatusCount()

	// 결제 총 금액
	totalPaymentAmount()
	
	// 구매비율차트
	purchaseBookRatio()
	
	// 결제수단비율차트
	payMethodRate()
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
		        labels: date,
		        
		        // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
		        datasets: [{
		        	
		        	// 점 삭제
		        	pointRadius: 0,
		        	
		            // ⑤dataset의 이름(String)
		            label: '주문',
		            
		            // ⑥dataset값(Array)
		            data: cnt,
		            
		            // ⑦dataset의 배경색(rgba값을 String으로 표현)
		            backgroundColor: 'rgba(103, 104, 171, 1)',
		            
		            // ⑧dataset의 선 색(rgba값을 String으로 표현)
		            borderColor: 'rgba(103, 104, 171, 1)',
		            
		            // ⑨dataset의 선 두께(Number)
		            borderWidth: 2
		            
		            
		        }, {
		        	
		        	// 점 삭제
		        	pointRadius: 0,
		            // ⑤dataset의 이름(String)
		            label: '취소',
		            
		            type:'line',
		            
		            // ⑥dataset값(Array)
		            data: ccnt,
		            
		            // ⑦dataset의 배경색(rgba값을 String으로 표현)
		            backgroundColor: 'rgba(255, 0, 0, 1)',
		            
		            // ⑧dataset의 선 색(rgba값을 String으로 표현)
		            borderColor: 'rgba(255, 0, 0, 1)',
		            
		            // ⑨dataset의 선 두께(Number)
		            borderWidth: 2	        
		        }],

		    },
		      					    
		    // ⑩차트의 설정(Object)
		    options: {	
		    	
		    	plugins: {
		    		
		    	    legend: {
		    	    	
		    	      position: 'bottom',
		    	      align: 'end',
		    	      
		    	      		labels: {
		    	              usePointStyle: false,
		    	              fontSize: 12,
		    	              boxWidth: 12
		    	            }
		    	    }
		    	  }	,   	  
		        // ⑪x축에 관한 설정(Object)
	                scales: {

	                    x: {
	                        grid: {
	                          display: false
	                        }
	                    },

			            // ⑫y축에 대한 설정(Object)
	                	y: {
			                // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
			                //beginAtZero: true
			            	suggestedMin: 0,
			                suggestedMax: 5,
			                stepSize: 2,
			                
			                grid: {

				            },
				            
			                ticks: {
			                    stepSize: 1,
			                    min: 0
			                       },

			            }
	                }
		        
		    },
		    
		})
	
	
}


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

function payChart(data) {

	let date = []
	let price = []
	


	for (pay of data) {
		date.push(pay.PAY_DATE)
		price.push(pay.PRICE)
	}	
	
		// 차트를 그럴 영역을 dom요소로 가져온다.
		var chartArea = document.getElementById('myChart').getContext('2d');
							
		// 차트를 생성한다. 
		Chart.defaults.font.size = 10;
		
		var payChart = new Chart(chartArea, {
			
		    type: 'bar',
		    data: {
		        labels: date,
		        datasets: [{
		
		        	pointRadius: 0,
		            label: '금액',
		            
		            data: price,
		            
		            backgroundColor: 'rgba(103,104,171, 1)',
		            
		            borderColor: 'rgba(103, 104, 171, 1)',
		            
		            borderWidth: 1
		           	            
		        }],
		        		        
		    },
		    	  
		    options: {
		    	
		    	plugins: {
		    	    legend: {
		    	      position: 'bottom',
		    	      align: 'end',
		    	          
		    	      		labels: {
		    	              usePointStyle: false,
		    	              fontSize: 12,
		    	              boxWidth: 12
		    	            }
		    	    },
		    
		    	    datalabels: {
		    	    	
		    	        color: 'black',
		    	        anchor: 'end',
		    	        align: 'top',
		    	      formatter: function(value) {
		    	    	 
		    	    	  let result = value !== 0 ? comma(value) : ''
		    	    	  
		    	        return result
		    	      }
		    	    },		    
		    	  },
		    	  		    	
	                scales: {
	                    x: {
	                        grid: {
	                          display: false
	                        }
	                    },	                	
	                	y: {
	                		grid: {
	                			display: false
	                		},
	                		display: false,
			            	suggestedMin: 0,
			                suggestedMax: 300000
			            }
	                }  
		    },
		    plugins: [ChartDataLabels]	

		})	
	
}

/***************************** 주문 현황 총 카운트 function ****************************/
function orderStatusCount() {
	
	let data = 'admin'
	
	$.ajax({
		type : "GET",                              
		url : "/admin/orderStatusCount",
		data : data,
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
				
				statusCheck(order.ORDER_STATUS, order.STATUSCOUNT)
				
				function statusCheck(key, value) {
					if(key == 0) {
						return pymntCmplt = value						
					} else if (key == 1) {
						return delivery = value
					} else if (key == 2) {
						return cmpltDlvry = value
					} else if (key == 3) {
						return test = value
					} else if (key == 10) {
						return pymcnRqst = value
					} else if (key == 11) {
						return cnclPymnt = value
					} else if (key == 12) {
						return rqstRtrn = value
					} else if (key == 13) {
						return cmpltRtrn = value
					}
				}
			}
					pymntCmplt = statusCount(pymntCmplt)
					delivery = statusCount(delivery)
					cmpltDlvry = statusCount(cmpltDlvry)
					test = statusCount(test)
					pymcnRqst = statusCount(pymcnRqst)
					cnclPymnt = statusCount(cnclPymnt)
					rqstRtrn = statusCount(rqstRtrn)
					cmpltRtrn = statusCount(cmpltRtrn)

					function statusCount(count) {
						return count = count === undefined ? 0 : count							
					}
					
			html = 	   `<td>${pymntCmplt}</td>
						<td>${delivery}</td>
						<td>${cmpltDlvry}</td>
						<td>${test}</td>
						<td>${pymcnRqst}</td>
						<td>${cnclPymnt}</td>
						<td>${rqstRtrn}</td>
						<td>${cmpltRtrn}</td>`
				
			ById('order_dshbr_table_count').innerHTML = html	
												
		},
					
		error: function(request, status, error) {
		       console.log("code: " + request.status)
		       console.log("message: " + request.responseText)
		       console.log("error: " + error);
		        
		}	
				
})	
} 


/***************************** 총 결제금액 FUNCTION *****************************/
function totalPaymentAmount() {
	
	$.ajax({
		type : "POST",                              
		url : "/admin/totalPayment",
		dataType : "json",
		contentType : "application/json",		
			
		success : function(data) {
			
			let price = comma(data.TOTAL_PRICE)
			
			console.log(data.TOTAL_PRICE)			
			ById('total_price').innerHTML = price
		},
			
		error: function(request, status, error) {
		       console.log("code: " + request.status)
		       console.log("message: " + request.responseText)
		       console.log("error: " + error);
		        
		}	
				
	})	

}

/***************************** 1회주문당 구매도서수 비율차트 로딩 *****************************/
function purchaseBookRatio() {
	
	$.ajax({
		type : "POST",                              
		url : "/admin/purchaseBookRatio",
		dataType : "json",
		contentType : "application/json",		
			
		success : function(data) {

			console.log(data)	
			
			purchaseBookRatioChart(data)
			
			console.log("1회주문당 구매도서수 비율차트 로딩");
								
		},
			
		error: function(request, status, error) {
		       console.log("code: " + request.status)
		       console.log("message: " + request.responseText)
		       console.log("error: " + error);		        
		}			
	})		
}

function purchaseBookRatioChart(data) {
	
	let radio = [data.PQ1, data.PQ2, data.PQ3, data.PQ3]
	const labels = ['1개', '2개', '3개', '4개 이상              ']
	const backgroundColors = ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0']
	
	var chartArea = document.getElementById('rateChart').getContext('2d');
						
	Chart.defaults.font.size = 10;
	
	var reatChart = new Chart(chartArea, {
		
		type: 'doughnut',
	    data: {
	        labels: labels,
	        datasets: [{
	            data: radio,
	            backgroundColor: backgroundColors,

	        }]
	    },
	    options: {
	    	
	    	maintainAspectRatio :false,
	    	borderWidth: 5,	  

	    	plugins: {
	    		
	    		/*
                title: {
                    display: true, // 제목 표시
                    text: '주문당 도서구매수량 비율',
                    color: 'black',
                    font: {
                      size: 18, // 폰트 크기 조정 가능
                    }
                  }, */
            	
                legend: {
                    position: 'right' // 범례를 우측에 배치
                  },
                  
                tooltips: {
                    enabled: false
                },
                
                datalabels: {
                    formatter: function (value, context) {
                        let percentage = Math.round(value / context.chart.getDatasetMeta(0).total * 100)
                        return percentage !== 0 ? percentage + "%" : ''
                        
                    },
                    color: 'black',
                }
            }
	    },
	    plugins: [ChartDataLabels]


	})		

}

/***************************** 결제수단비율 FUNCTION *****************************/
function payMethodRate() {

	$.ajax({
		type : "POST",                              
		url : "/admin/payMethodRate",
		dataType : "json",
		contentType : "application/json",		
			
		success : function(data) {
						
			console.log(data)
			paymethodChart(data)
		},
			
		error: function(request, status, error) {
		       console.log("code: " + request.status)
		       console.log("message: " + request.responseText)
		       console.log("error: " + error);
		        
		}	
				
	})
} 

	
function paymethodChart(data) {
	

	let radio = [data.CARD, data.TOSSPAY, data.VRTLACNT, data.ACNTTRNSF, data.PHONE, data.CLTMRCRTFC, data.BKCGFCRTFC, data.GMCGFCRTFC]
	let labels = ['카드', '토스페이', '가상계좌', '계좌이체', '핸드폰', '문화상품권', '도서문화상품권', '게임문화상품권']
	let backgroundColors = ['#4BC0C0', '#36A2EB', '#FFCE56', '#FF6384', '#F08080', '#00CC99 ', '#FF9F40 ', '#9966FF ']
	
	var chartArea = document.getElementById('paymethodChart').getContext('2d');
						
	Chart.defaults.font.size = 10;
	
	var reatChart = new Chart(chartArea, {
		
		type: 'doughnut',
	    data: {
	        labels: labels,
	        datasets: [{
	            data: radio,
	            backgroundColor: backgroundColors,

	        }]
	    },
	    
	    options: {
            hideZero: true,
	    	maintainAspectRatio :false,
	    	borderWidth: 5,	  
	    	
	    	plugins: {
                legend: {
                    position: 'right',

                  },
                  
                tooltips: {
                    enabled: false
                },
                datalabels: {
                	
                    formatter: function (value, context) {
                        let percentage = Math.round(value / context.chart.getDatasetMeta(0).total * 100);
                        return percentage !== 0 ? percentage + "%" : '';
                    },
                    color: 'black',
                }
                
        	   
            }

	    },

	    plugins: [ChartDataLabels]


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

/* 월간 결제 금액 */
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







