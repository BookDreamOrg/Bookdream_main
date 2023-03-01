$(function(){
	
	bookOrderchart();

	
});


/* ------------------------ [차트] 일주일 도서 판매량   ----------------------------*/
// (1) 데이터 받아오기
function bookOrderchart(){
$.ajax({
	type : "POST",                              
	url : "/admin/bookOrderChart",
	dataType : "json",
	contentType : "application/json",		
		
	success : function(Object) {
		var arrDate = new Array(Object.length);
		var arrCnt = new Array(Object.length);
		
		for(var i = 0; i < Object.length; i++){
			arrDate[i] = `${Object[i].DT.year}-${Object[i].DT.monthValue}-${Object[i].DT.dayOfMonth}`;
			arrCnt[i] = Object[i].PC;
		}
		
		
		console.log(arrDate);
		console.log(arrCnt)
		book_order_chart(arrDate,arrCnt);
	
	
		
	},
	error: function(request, status, error) {
	       console.log("code: " + request.status)
	       console.log("message: " + request.responseText)
	       console.log("error: " + error);
	        
	}	
	}); 
}

// (2) 차트 그리기
function book_order_chart(arrDate,arrCnt){
	 var ctx = document.getElementById('Book_Order_qty_chart');
	 var myChart = new Chart(ctx, {
	      type: 'bar',
	      data: {
	        labels: arrDate,
	        datasets: [{
	          label: '일일 도서판매량',
	          data:  arrCnt,
	          backgroundColor: '#b3b3d5'
	    
	        }]
	      },
	      options: {
	    	  responsive: false,
	        scales: {
	          yAxes: [{
	            ticks: {
	              beginAtZero: true
	            }
	          }]
	        }
	     
	      }
	    });
	
}

/* ------------------------ 배송 현황 시작 ----------------------------*/

$(function(){
		
	orderStatusCount()	
});


function orderStatusCount() {
	
	let data = 'admin'
	
	$.ajax({
		type : "GET",                              
		url : "/admin/orderStatusCount",
		data : data,
		dataType : "json",
		contentType : "application/json",		
			
		success : function(data) {
		
			console.log(data)
			
			let pymntCmplt = 0
			let pymcnRqst = 0
			let rqstRtrn = 0
			
			for (let order of data) {
				
				if(order.ORDER_STATUS == 0) {
					pymntCmplt = order.STATUSCOUNT 	
					
				} else if (order.ORDER_STATUS == 10) {
					pymcnRqst = order.STATUSCOUNT
					
				} else if (order.ORDER_STATUS == 12) {
					rqstRtrn = order.STATUSCOUNT
				}
 				
			}
						
			// 개수가 1개이상 존재한다면, 알림 아이콘이 좌우로 흔들림
			
			let content = '상세한 정보는 링크를 통해 확인하실 수 있습니다.'
			
			addShaking(pymntCmplt, 'pymntCmplt_icon', 'pymntCmplt_text', content)
			addShaking(pymcnRqst, 'pymcnRqst_icon', 'pymcnRqst_text', content)
			addShaking(rqstRtrn, 'rqstRtrn_icon', 'rqstRtrn_text', content)
			
			function addShaking(cnt, icon, div, content) {
				
				if (cnt != 0) {
					ById(div).innerHTML = content
					ById(icon).classList.add("shaking")					
				}
			}
			
			ById('pymntCmplt').innerHTML = pymntCmplt
			ById('pymcnRqst').innerHTML = pymcnRqst
			ById('rqstRtrn').innerHTML = rqstRtrn
												
		},
					
		error: function(request, status, error) {
		       console.log("code: " + request.status)
		       console.log("message: " + request.responseText)
		       console.log("error: " + error);
		        
		}	
				
	})	
} 

//
$(document).on("click", ".href_biv", function(e) {	

	  let key = e.currentTarget.querySelector('input[type="hidden"]');
	  let order_status = key.value
	  
	  console.log("status : " + order_status)
	  
	  location.href="/admin/orderMngmn?status=" + order_status
	  
	  
})


/* ------------------------ 배송 현황 종료 ----------------------------*/