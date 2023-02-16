$(function(){
	bookOrderchart();
});


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

/* ------------------------ [모달] 재고 변경   ----------------------------*/

/* --- [모달 ]재고 변경 버튼 클릭 시 모달 보여줌 -----*/
$(document).on("click", "#stock_upd_btn", function(e) {
	$('#my-modal').modal('show');
		let book_no = $(this).val();
		console.log("book_no : " + book_no);
		
		$.ajax({
			type: 'post',
			url: '/upd_Stock_Modal_Detail',
			data : {
				book_no : book_no
			},
			
			success: function (data){
				let title = data.title;
				let stock = data.stock;
				let price = data.book_price;
				let img = data.book_img;
				
				document.getElementById('this_stock').innerHTML = stock;
				document.getElementById('modal_book_title').innerHTML = title;
				document.getElementById("modal_book_img").setAttribute("src",img);

			},
			error:function(request, status, error){
				console.log("code: " + request.status)
		    	console.log("message: " + request.responseText)
		    	console.log("error: " + error);
			}
		}); //end ajax
		
		
	/* --- [모달 ] 재고 변경  -----*/
	$(document).on("click", "#btn_modal_upd", function(e) {
		$.ajax({
			type: 'post',
			url: '/updateBookStock',
			data : {
				book_no : book_no,
				stock : $('#modal_upd_stock').val()
			},
			
			success: function (data){
				alert('재고가 수정되었습니다.');
				$('#my-modal').modal('hide');
				location.reload();
			},
			error:function(request, status, error){
				console.log("code: " + request.status)
		    	console.log("message: " + request.responseText)
		    	console.log("error: " + error);
			}
		}); //end ajax

	

	}); // end btn_modal_upd
	
	
}); // end modal.show




/* --- [모달 ] 닫기 -----*/
function modal_close(){
	$('#my-modal').modal('hide');
}



