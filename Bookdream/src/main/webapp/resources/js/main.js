/*베스트 셀러 상품 5개 가져오기*/
$(function(){
$.ajax({
	   url : "/main/main",
	   type : "get",
	   data : "",
	   dataType : "json",
	   contentType : "application/json",
	   success : function(Object){
		   console.log(Object);
		   let bestSellerHtml = "";
		   let col = "";
		   for(var key in Object){
			
			   /*베스트 셀러 상품 5개 가져오기*/
			   if(key == 1 ){
				   html();
				   document.getElementById('bestBook').innerHTML = bestSellerHtml;
				   //변수 reset
				   bestSellerHtml = "";
				   col = "";

				/*리뷰 많은 상품 5개 가져오기*/	   
			   }else if(key == 2){
				   html();
				   document.getElementById('bestBookByReviewCount').innerHTML = bestSellerHtml;
				   bestSellerHtml = ""
				   col = "";
				 
				 /*평점 높은 상품 5개 가져오기*/
			   }else if(key == 3 ){
				   html();
				   document.getElementById('bestBookByReviewGrade').innerHTML = bestSellerHtml;
				   bestSellerHtml = ""
				   col = "";   
			   }
			 
		   }
		   
		   function html(){
			  	 $.each(Object[key] , function(idx, val) {
			  		 console.log(idx+1 + " " + val.book_no + " " + val.book_img);
			  		  col += `<div class="col"><div class="h2 mb-2"><span class="badge bg-danger">`+ (idx+1) + `</span></div>`
			  		  + `<div class="card h-100 shadow-sm d-flex align-items-center back" style="background-color: #F4F3F5">
			  		   	  <img src="`+val.book_img+`" class=" mt-3 card-img-top"  style="width: 200px; height: 300px;">
			  		   	  <div class="card-body">
			  		   	   <div class="clearfix mb-3">
			  		   	   <span class="float-start badge rounded-pill bg-primary mt-4">`+val.book_category+`</span></div>
			  		   	   <h5 class="card-title h5" id="main_title">`+val.title+`</h5>
			  		   	   <div class="text-center my-4">
			  		   	   <a onclick="location.href='/getBook?book_no=` +val.book_no + `'"class="btn btn-warning">구매하러 가기</a> </div></div></div></div>`
			  		   	   
			  	   });
			  	   
			  	   
			  	 bestSellerHtml +=  `<div class="container-fluid bg-trasparent my-4 p-3" style="position: relative;"> 
			  		   					<div class="row row-cols-1 row-cols-xs-2 row-cols-sm-2 row-cols-lg-5 g-3">`; 
			  	   
			  	 bestSellerHtml +=  col ;
			  	 bestSellerHtml += `</div></div>`;
			   }
		   
		}, error : function(){
		     alert("에러 발생 ");
		    }		
	 });
});

