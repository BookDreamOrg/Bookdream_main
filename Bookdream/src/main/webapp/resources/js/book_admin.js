$(function(){
	
	
});





/* ------------------------ [페이징] ----------------------------*/
function adminSearch(val){
	/*페이지 검색을 위한 데이터*/
	let title = document.getElementById('title').value;
	let author = document.getElementById('author').value;
	let book_category = document.getElementById('book_category').value;
	let publisher = document.getElementById('publisher').value;
	
	let data = {
			"num" : val,
			"title" : title,
			"author" : author,
			"book_category" : book_category,
			"publisher" : publisher
	}

	page(data);
	

} //end click



/* ------------------------ [페이징] 다음 버튼   ----------------------------*/
function next(num){
	let result_html ="";	  // 10개씩 담아온 도서 리스트
	let page_result = ""; 	  //페이지 값

	console.log( "val : "+ num);
	
	/*페이지 검색을 위한 데이터*/
	let title = document.getElementById('title').value;
	let author = document.getElementById('author').value;
	let book_category = document.getElementById('book_category').value;
	let publisher = document.getElementById('publisher').value;
	let finalIndex = document.getElementById('finalIndex').value;
	
	console.log("finalIndex : "+finalIndex);
	
	let data_next = {
			"num" : num,
			"title" : title,
			"author" : author,
			"book_category" : book_category,
			"publisher" : publisher
	}
	
	console.log("num : "+num);

	/* parseInt(finalIndex) : hidden 으로 받아온 값이 integer타입이 아니라 비교가 어려워서 integer로 변환*/
	if( num >= parseInt(finalIndex)){
		 Swal.fire(
				 '마지막 페이지입니다.',
		          '',
		          'info'
		 )
	}else{
		page(data_next);
	}
}




function page (data){
let result_html ="";	  // 10개씩 담아온 도서 리스트
let page_result = ""; 	  //페이지 값
console.log("data" + data.num);

$.ajax({
	type: 'get',
	url: '/admin_bookList',
	dataType : "json",
	contentType : "text/html",
	
	data  : data,
	success: function (Object){
				console.log(Object);

		
/*도서 리스트 */		
	var startIndex = 0;
	var endIndex = 0; 
	var index = data.num;
	for(let idx  = 0; idx <Object.length; idx++){
		let temp_html = "";
		temp_html += `<input  type="hidden" id="page_index" value="`+Object[idx].index+`">`;
		temp_html += `<ul class="list-group list-group-horizontal">`;
		temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning " id="check">
							<input type="checkbox" name="item" value="`+Object[idx].book_no+`"/></li>`;	
		temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="bookNo">`+Object[idx].book_no+`</li>`;
		temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning" id="book_title">`+Object[idx].title+`</li>`;
		temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning" id= "book_author">`+Object[idx].author+`</li>`;
		temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="category">`+Object[idx].book_category+`</li>`;
		temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="org_price">`+AddComma(Object[idx].book_price)+`</li>`;
		temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="sale_rate">`+Object[idx].discount+`<span>%</span></li>`;
		temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="sale_price" style="font-weight: 700; color: red;">`+AddComma((Object[idx].book_price - ((Object[idx].book_price)*(Object[idx].discount/100))))+`</li>`;
		temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="stock">
							<div class="text-center"><div>`+Object[idx].stock+`</div>
							<div class="mt-1"><button type="button" class="btn btn-warning" id="stock_upd_btn" value="`+Object[idx].book_no+`">추가</button></div>
							</div></li>`;
		temp_html +=`<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="delete">
							<button type="button" class="btn btn-warning" id="delete_btn" value="`+Object[idx].book_no+`">삭제</button>		
							</li>`;
		temp_html += `</ul>`;
	
		
		result_html+= temp_html;
		startIndex = Object[idx].startIndex;
		endIndex = Object[idx].endIndex;
	}
	finalIndex_html = `<input type="hidden" id="finalIndex" value="`+Object[0].finalIndex+`">`;
	result_html +=  finalIndex_html;

	
	
	page_result += 	`<nav aria-label="Page navigation example" >
					<ul class="pagination justify-content-center" >
					<li class="page-item"> 
						<a class="page-link" onclick="prev($(this).attr('num'))" num=`+(startIndex-1)+`>
							<span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
						</a>
					</li>`;
	
	console.log("startIndex : "+(startIndex-1));
	
	
	for (let page  = startIndex ; page <= endIndex ; page++){
		let temp_html= "";
		if(index == page){
			temp_html	 += `<li class="page-item">
				<a class="page-link active" id="page-link-`+page+`" onclick='adminSearch(`+page+`)'>`+ page + `</a>	
				</li>`;
		}else{
			temp_html	 += `<li class="page-item">
				<a class="page-link" id="page-link-`+page+`" onclick='adminSearch(`+page+`)'>`+ page + `</a>	
				</li>`;
		}
		
		page_result += temp_html;
	} 									
	
	page_result += `<li class="page-item">
						<a class="page-link" onclick="next($(this).attr('num'))" num=`+(endIndex+1)+` >
							<span aria-hidden="true">&raquo;</span>
							<span class="sr-only">Next</span>
						</a>
					</li></ul></nav>`;
		document.getElementById('bookList').innerHTML = result_html;
		document.getElementById('page_result').innerHTML = page_result;
		
		
		console.log("endIndex : "+(endIndex+1));
	},
	error:function(request, status, error){
		console.log("code: " + request.status)
    	console.log("message: " + request.responseText)
    	console.log("error: " + error);
	}
}); //end ajax

}// end page(data)

/* ------------------------ [페이징] 이전 버튼 ----------------------------*/
function prev(num){	
	
	let result_html ="";	  // 10개씩 담아온 도서 리스트
	let page_result = ""; 	  //페이지 값

	console.log( "val : "+ num);
	
	/*페이지 검색을 위한 데이터*/
	let title = document.getElementById('title').value;
	let author = document.getElementById('author').value;
	let book_category = document.getElementById('book_category').value;
	let publisher = document.getElementById('publisher').value
	
	let data_prev = {
			"num" : num,
			"title" : title,
			"author" : author,
			"book_category" : book_category,
			"publisher" : publisher
	}
	
	
	
	if(num < 1){
		 Swal.fire(
				 '첫번째 페이지입니다.',
		          '',
		          'info'
	
		 )
	}else{
		page(data_prev);
		
	}

}




/* ------------------------ [수식] 천 단위 콤마 찍기   ----------------------------*/

function AddComma(num) {	
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}



/* ------------------------ [버튼] 체크박스 일괄 수정 ----------------------------*/
$(document).on("click", "#updateChk", function(e) {
	let check = new Array();
	let html = "";
	$('#check_upd_modal').modal('show');
	$('input:checkbox[name=item]').each(function (index) {
		//체크한 데이터 array 형식으로 저장하기
		if($(this).is(":checked")==true){
	    	check.push($(this).val());
	    }
		console.log("check : " + check);
		
	});//end input:checkbox
	
	$.ajax({
		type: 'post',
		url: '/checkGetBook',
		traditional : true,
		data : { "check" : check} ,
		
		success: function (Object){
			for(let idx  = 0; idx <Object.length; idx++){
				html += `<ul class="list-group list-group-horizontal">`;
				html += `<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="modal_bookNo">`+Object[idx].book_no+`</li>`;
				html += `<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="modal_book_img"><img id="li_book_img" src="`+Object[idx].book_img+`"></li>`;
				html+=`<li class="list-group-item list-group-item-action list-group-item-warning" id="modal_book_title">`+Object[idx].title+`</li>`;
				html+=`<li class="list-group-item list-group-item-action list-group-item-warning" id= "modal_book_author">`+Object[idx].author+`</li>`;
				html+=`<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="modal_org_price">`+AddComma(Object[idx].book_price)+`</li>`;
				html+=`<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="modal_sale_rate">`+Object[idx].discount+`<span>%</span></li>`;
				html+=`<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="modal_stock">`+Object[idx].stock+`</li>`;
				html+=`</ul>`
			}
			
			document.getElementById('result_modal').innerHTML = html;
			
			/* ------------------------ [버튼] 체크박스 일괄 수정 ----------------------------*/
			
			$(document).on("click", "#btn_modal_chk_upd", function(e) {
				let result_org_price = document.getElementById('result_org_price').value;
				let result_sale_rate = document.getElementById('result_sale_rate').value;
				let result_stock = document.getElementById('result_stock').value;
				
				console.log("result_org_price" + result_org_price);
				console.log("result_sale_rate" + result_sale_rate);
				console.log("result_stock" + result_stock);
				
				if(result_org_price == ''){
					result_org_price = 0;
				}
				
				if(result_sale_rate == ''){
					result_sale_rate = 0;
				}
				if(result_stock == ''){
					result_stock = 0;
				}
				
				
				let data  = {
					"book_price" :  result_org_price,
					"discount" : result_sale_rate,
					"stock" : result_stock,
					"check" : check
				}
				
				console.log("btn_modal_chk_upd() + check" + check );
				
				$.ajax({
					type : "POST",                              
					url : "/chkBookUpd",
					data : data,	
					success: function (data){
						$('#check_upd_modal').modal('hide');
						 Swal.fire(
								 '정상처리 되었습니다.',
						          '',
						          'success'
					
						 ).then(function(){
							 
							 location.reload();
						 })
					},
					error:function(request, status, error){
						console.log("code: " + request.status);
				    	console.log("message: " + request.responseText);
				    	console.log("error: " + error);
					}
				});
			
			});
			
		},
		error:function(request, status, error){
			console.log("code: " + request.status)
	    	console.log("message: " + request.responseText)
	    	console.log("error: " + error);
		}

		}); //end ajax
	

	
}); //end click #updateChk


	



//
//function modal_org_price(val){
//	if (val !=null || val != "") {
//		$("#modal_org_price").text(AddComma(val));
//		
//	}else{
//		checkGetBook();
//	}
//}
//
////할인율 변경
//function modal_sale_rate(val){
//	
//}
//
////재고 변경
//function modal_stock(val){
//	
//}



/* ------------------------ [모달] 재고 변경   ----------------------------*/
/* --- [모달 ]재고 변경 버튼 클릭 시 모달 보여줌 -----*/
$(document).on("click", "#stock_upd_btn", function(e) {
	$('#my-modal').modal('show');
		let book_no = $(this).val();
		console.log("book_no : " + book_no);
		
		$.ajax({
			type: 'post',
			url: '/Modal_Detail',
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
				$('#my-modal').modal('hide');
				 Swal.fire(
						 '정상처리 되었습니다.',
				          '',
				          'success'
			
				 ).then(function(){
					 
					 location.reload();
				 })
				 
			},
			error:function(request, status, error){
				console.log("code: " + request.status)
		    	console.log("message: " + request.responseText)
		    	console.log("error: " + error);
			}
		}); //end ajax

	

	}); // end btn_modal_upd
	
	
}); // end modal.show




/* ------------------------ [모달] 상품 삭제   ----------------------------*/

$(document).on('click', "#delete_btn", function(e) { 
	$('#book_delete_modal').modal('show');
	let book_no = $(this).val();
	console.log("book_no : " + book_no);
	
	$.ajax({
		type: 'post',
		url: '/Modal_Detail',
		data : {
			book_no : book_no
		},
		
		success: function (data){
			let title = data.title;
			let img = data.book_img;
			
			document.getElementById('modal_book_title2').innerHTML = title;
			document.getElementById("modal_book_img2").setAttribute("src",img);

		},
		error:function(request, status, error){
			console.log("code: " + request.status)
	    	console.log("message: " + request.responseText)
	    	console.log("error: " + error);
		}
		
		
	}); //end ajax
	
	
	
/* --- [모달 ] 도서 삭제 버튼 클릭  -----*/
	$(document).on("click", "#btn_modal_delete", function(e) {
		$.ajax({
			type: 'post',
			url: '/dlt_Modal_Detail',
			data : {
				book_no : book_no
			},
			
			success: function (data){
				$('#book_delete_modal').modal('hide');
				
				 Swal.fire(
						 '정상처리 되었습니다.',
				          '',
				          'success'
			
				 ).then(function(){
					 
					 location.reload();
				 })
			},
			error:function(request, status, error){
				console.log("code: " + request.status)
		    	console.log("message: " + request.responseText)
		    	console.log("error: " + error);
			}
		}); //end ajax

	});

}); // end modal.show




/* --- [모달 ] 닫기 -----*/
function modal_close(){
	$('#my-modal').modal('hide');
	$('#book_delete_modal').modal('hide');
	$('#check_upd_modal').modal('hide');
	
}


