$(function(){
	
	//메인 상품 목록 가져오기
	mainBookList();
	

});



function mainBookList(){
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
			   let main_html = "";
			   for(var key in Object){
				
				   /*베스트 셀러 상품 5개 가져오기*/
				   if(key == 1 ){
					   html();
					   document.getElementById('bestBook').innerHTML = bestSellerHtml;
					   document.getElementById('bestMain').innerHTML = main_html;
					   //변수 reset
					   bestSellerHtml = "";
					   col = "";
					   main_html = "";

					/*리뷰 많은 상품 5개 가져오기*/	   
				   }else if(key == 2){
					   html();
					   document.getElementById('bestBookByReviewCount').innerHTML = bestSellerHtml;
					   document.getElementById('besReviewtMain').innerHTML = main_html;
					   bestSellerHtml = ""
					   col = "";
					   main_html = "";
					 
					 /*평점 높은 상품 5개 가져오기*/
				   }else if(key == 3 ){
					   html();
					   document.getElementById('bestBookByReviewGrade').innerHTML = bestSellerHtml;
					   document.getElementById('bestGradeMain').innerHTML = main_html;
					   bestSellerHtml = ""
					   col = ""; 
					   main_html = "";
				   }
				 
			   }
			   
			   function html(){
				  	 $.each(Object[key] , function(idx, val) {
				  		 console.log(idx+1 + " " + val.book_no + " " + val.book_img);
				  		  
				  		 if(idx == 0){
				  			 main_html +=
				  			 `
					 
								 <div class="col-3" >
								 	<a class=" col " href="/getBook?book_no=` +val.book_no+ `">
									 	<img class="rounded shadow-lg " src="`+val.book_img+`"
									 		data-aos="fade-right" 
									 		data-aos-offset="200"
								 			data-aos-duration="1500"
								 			data-aos-easing="ease-out-back">
								 	</a>
								 </div>
								 <div class="col-5  d-flex align-items-end  flex-column ">
								 	<a class="p-1 mt-auto mb-3" href="/getBook?book_no=` +val.book_no+ `" 
								 		 data-aos="fade-left"
								 		 data-aos-offset="200"
								 		 data-aos-duration="1000">
									 	<span class="h1 lh-base text-break">`+val.title+`</span>
								 	</a>
								 	<a class="p-1 mt-auto" href="/getBook?book_no=` +val.book_no+ `"
								 		 data-aos="fade-up-left"
								 		 data-aos-offset="250"
								 		 data-aos-duration="1000">
									 	<span class="h5 lh-lg text-break">`+val.book_content+`</span>
								 	</a>
								 	<a class="p-1 mb-auto text-muted" href="/getBook?book_no=` +val.book_no+ `"
								 		 data-aos="fade-up-left"
								 		 data-aos-offset="250"
								 		 data-aos-duration="1000">
									 	<span class="h5 lh-lg text-break"> - `+val.author+`</span>
								 	</a>
								 </div>	`
							  			 
				  		 }
				  		 
				  		 col +=` <div class="col-2 m-2 card border-0 rounded shadow-lg" style="width: 13rem;" 
										  	onclick="location.href='/getBook?book_no=` +val.book_no + `'">
									  <img class="border-0 rounded pt-3 card-img-top" src="`+val.book_img+`">
									  <div class="card-body mt-auto">
									    <p class="card-title h5 mt-auto text-truncate">`+val.title+`</p>
									    <p class="card-text h6"> -`+val.author+`</p> 
									  </div>
								</div>`
				  	   });
				  	 
				  	 
				  	
				  	   
				  	bestSellerHtml +=  `<div class="m-4 row d-flex justify-content-around"
								      		data-aos="zoom-in-down"
								      		data-aos-offset="200"
											data-aos-duration="1000"
											data-aos-easing="ease-out-back"> `; 
				  	   
				  	 bestSellerHtml +=  col ;
				  	 bestSellerHtml += `</div>`;
				   }
			   
			}, error : function(){
			     alert("에러 발생 ");
			    }		
		 });

	}
		
