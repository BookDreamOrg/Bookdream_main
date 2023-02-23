$(function(){
	
	
	
});



/* ------------------------ [페이징] ----------------------------*/
function adminSearch(val){
	let title = document.getElementById('title').value;
	let author = document.getElementById('author').value;
	let book_category = document.getElementById('book_category').value;
	let publisher = document.getElementById('publisher').value;
	
	let result_html ="";	  // 10개씩 담아온 도서 리스트
	let page_result = ""; 	  //페이지 값
	$.ajax({
		type: 'get',
		url: '/admin_bookList',
		dataType : "json",
		contentType : "text/html",
		
		data  : {
			"num" : val,
			"title" : title,
			"author" : author,
			"book_category" : book_category,
			"publisher" : publisher
		},
		success: function (Object){
					console.log(Object);

			
	/*도서 리스트 */		
		let startIndex = 0;
		let endIndex = 0; 
		
		for(let idx  = 0; idx <Object.length; idx++){
			let temp_html = "";
			temp_html += `<ul class="list-group list-group-horizontal">`;
			temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning " id="check">
								<input type="checkbox" name="item" value="`+Object[idx].book_no+`"/></li>`;	
			temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="count">`+(idx+1)+`</li>`;
			temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="bookNo">`+Object[idx].book_no+`</li>`;
			temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning" id="book_title">`+Object[idx].title+`</li>`;
			temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning" id= "book_author">`+Object[idx].author+`</li>`;
			temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="category">`+Object[idx].book_category+`</li>`;
			temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="org_price">`+AddComma(Object[idx].book_price)+`</li>`;
			temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="sale_rate">`+((Object[idx].discount)/100)+`</li>`;
			temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="sale_price" style="font-weight: 700; color: red;">`+AddComma((Object[idx].book_price - ((Object[idx].book_price)*(Object[idx].discount/100))))+`</li>`;
			temp_html+=`<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="stock">
								<div class="text-center"><div>`+Object[idx].stock+`</div>
								<div class="mt-1"><button type="button" class="btn btn-warning" id="stock_upd_btn" value="`+Object[idx].book_no+`">추가</button></div>
								</div></li>`;
			temp_html +=`<li class="list-group-item list-group-item-action list-group-item-warning text-center" id="delete">
								<button type="button" class="btn btn-warning mt-3" id="delete_btn" value="`+Object[idx].book_no+`">삭제</button>		
								</li>`;
			temp_html += `</ul>`;
			result_html+= temp_html;
			startIndex = Object[idx].startIndex;
			endIndex = Object[idx].endIndex;
		}
		
		
		
		page_result += 	`<nav aria-label="Page navigation example" >
						<ul class="pagination justify-content-center" >
						<li class="page-item"> 
							<a class="page-link" onclick="prev()">
								<span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
							</a>
						</li>`;
		
		
		for (let page  = startIndex ; page <= endIndex ; page++){
			let temp_html= "";
			temp_html	 += `<li class="page-item">
							<a class="page-link" id="page-link" onclick='adminSearch(`+page+`)'>`+ page + `</a>	
							</li>`;
			page_result += temp_html;
		} 									
		
		page_result += `<li class="page-item">
							<a class="page-link" onclick="next()" >
								<span aria-hidden="true">&raquo;</span>
								<span class="sr-only">Next</span>
							</a>
						</li></ul></nav>`;
			document.getElementById('bookList').innerHTML = result_html;
			document.getElementById('page_result').innerHTML = page_result;
			
		},
		error:function(request, status, error){
			console.log("code: " + request.status)
	    	console.log("message: " + request.responseText)
	    	console.log("error: " + error);
		}
	}); //end ajax
	
	


} //end click


/* ------------------------ [페이징] 다음 버튼   ----------------------------*/
function next(){
	const urlParams = new URL(location.href).searchParams;
	const num = urlParams.get('num');
	let nextNum = parseInt(num) + 1; // 앞 번호로 가기
	if(num==lastIndex){
		alert('마지막 페이지입니다. ');
	}else{
		location.replace("/bookListSearchByKeyword?num="+nextNum+"&keyword="+keyword);
	}
}

/* ------------------------ [페이징] 이전 버튼 ----------------------------*/
function prev(){	
	
	var req = new XMLHttpRequest();
	req.open('GET', document.location, false);
	req.send(null);
	var headers = window.location.search;
	alert(headers);
	
	
	
	const urlParams = window.location.href.toString().getResponseHeader();
	console.log(urlParams);
	const num = urlParams.getResponseHeader('num');
	console.log(num);
	let prevNum = parseInt(num) - 1; // 뒷 번호로 가기
	console.log(num);
	if(num==1){
		alert('첫번째 페이지입니다. ');
	}else{
		location.replace("/bookListSearchByKeyword?num="+prevNum+"&keyword="+keyword);
	}

}




/* ------------------------ [수식] 천 단위 콤마 찍기   ----------------------------*/

function AddComma(num) {	
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}

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
				alert('상품이 정상적으로 삭제되었습니다.');
				location.reload();
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
}


