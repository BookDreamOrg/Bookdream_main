/*  */
$(function() {
	
	orderDateChart()
})


/***************************** 날짜 형식 변경 function *****************************/
function timestamp(date){
    var today = new Date(date);
    today.setHours(today.getHours() + 9);
    return today.toISOString().replace('T', ' ').substring(5, 10); //년도~분까지 표시
}

/* */
function orderDateChart() {
						
		$.ajax({
			type : "POST",                              
			url : "/admin/order",
			dataType : "json",
			contentType : "application/json",		
				
			success : function(data) {
				
				console.log(data);
				
				let day6 = timestamp(data[0].ORDER_DATE)
				let day5 = timestamp(data[1].ORDER_DATE)
				let day4 = timestamp(data[2].ORDER_DATE)
				let day3 = timestamp(data[3].ORDER_DATE)
				let day2 = timestamp(data[4].ORDER_DATE)
				let day1 = timestamp(data[5].ORDER_DATE)
				let today = timestamp(data[6].ORDER_DATE)
				
				let tocnt = data[0].CNT
				let cnt1 = data[1].CNT
				let cnt2 = data[2].CNT
				let cnt3 = data[3].CNT
				let cnt4 = data[4].CNT
				let cnt5 = data[5].CNT
				let cnt6 = data[6].CNT

				let tocencnt = data[7].CNT2
				let cencnt1 = data[8].CNT2
				let cencnt2 = data[9].CNT2
				let cencnt3 = data[10].CNT2
				let cencnt4 = data[11].CNT2
				let cencnt5 = data[12].CNT2
				let cencnt6 = data[13].CNT2			
				
	
	

					// 차트를 그럴 영역을 dom요소로 가져온다.
					var chartArea = document.getElementById('myChart').getContext('2d');
										
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
					            data: [tocencnt, cencnt1, cencnt2, cencnt3, cencnt4, cencnt5, cencnt6],
					            
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
						                suggestedMax: 30,
						                stepSize: 5
						            }
				                }
					        
					    },
					    
			    

					})
																


			},
				
			error: function(request, status, error) {
			       console.log("code: " + request.status)
			       console.log("message: " + request.responseText)
			       console.log("error: " + error);
			        
			}	
			
			
	})
}



	



