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