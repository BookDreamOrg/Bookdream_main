<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>
<head>
<!-- J쿼리 -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- CSS -->
<link href="/resources/css/getBook.css" rel="stylesheet">


<!-- bootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

<!-- Favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="/resources/images/favicon/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="/resources/images/favicon/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/favicon/favicon-16x16.png" />
<link rel="manifest" href="/resources/images/favicon/site.webmanifest" />
<link rel="stylesheet" href="/resources/css/styles.css" />

</head>
<body class="mt-3">

<%
		int book_no = (int) (Math.random() * 100) + 1;
%>
<div class="wrapper"> 

		<jsp:include page="/views/inc/header.jsp" />
		
		<main>
		<div class="banner">
			<div class="banner-text">Banner Title Text</div>
			<div class="banner-img"></div>
			<div class="banner-books">
				<div class="banner-book"></div>
				<div class="banner-book banner-book-lg"></div>
				<div class="banner-book banner-book-xl"></div>
			</div>
		</div>
		<ul class="nav nav-tabs book-section-nav">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#">베스트</a></li>
			<li class="nav-item"><a class="nav-link" href="#">신상품</a></li>
		</ul>
		<div class="book-section">
				<div class="container-fluid">
				<div class="banner-text">${book.title }</div>
	<div class="row">
		<div class="col-md-4">
			<div class="row">
				<div class="col-md-6 pt-4">
				<span id="detail-badge" class="badge bg-primary rounded-pill">Author</span>
				</div>
				<div class="col-md-6 pt-4 h5">
					${book.author }
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 pt-4">
					<span  id="detail-badge" class="badge bg-primary rounded-pill">Publisher</span>
				</div>
				<div class="col-md-6 pt-4 h5" >
				${book.publisher}
				</div>
			</div>
				<div class="row">
				<div class="col-md-6 pt-4">
					 <span id="detail-badge" class="badge bg-primary rounded-pill"> publication date</span>
				</div>
				<div class="col-md-6 pt-4 h5">
				${strdate}
				</div>
			</div>
		</div>
		<div class="col-md-4 text-center ">
			<h3 class="text-center">
			</h3><img id="detail-img" alt="${book.title }" src="${book.book_img }" class="rounded" />
		</div>
		<div class="col-md-4 mt-5 pt-5">
			<div class="row">
				<div class="col-md-4">
				</div>
				<div class="col-md-5" id="detail-price">

				<c:choose>
					<c:when test="${book.stock > 0 }">
						<input class=" form-control text-center border-0 " type="number" id="product_cnt" min="1" max="${book.stock}" value="1" >
						<div class="mt-3 text-center"><fmt:formatNumber value="${book.book_price}" pattern="#,###" />원</div>
					</c:when>
					<c:otherwise>
						<div class="h1"> 품절  </div>					
					</c:otherwise>
				</c:choose>
				  
				  <input class=" form-control text-center border-0 "
                                    type="number" id="product_count" min="1" max="${book.stock}" value="1" >
				<fmt:formatNumber  value="${book.book_price}" pattern="#,###"/>원

				</div>
				<div class="col-md-3">
				</div>
			</div>
		</div>
	</div>
	<div class="row  mt-5">
		<div class="col-md-1">
		</div>
		<div class="col-md-10">
		<i class="bi bi-info-circle"></i>
			<span id="detail-bookinfo">책 소개</span>
			<p class="pt-5" id="book_content">
			${book.book_content }
			</p>	
		</div>
		<div class="col-md-1">
		</div>
	</div>
	
			<div class="container-fluid mt-5">
			
				<div class="mt-5" id="btn-buy">
				<div class="row">
				<div class="col-md-6">
				
				</div>
				<c:if test="${book.stock > 0 }">
				<div class="col-md-6 text-end">
					<button id="btn_buy_now" class="text-center btn btn-outline-dark flex-shrink-0 btn-lg btn-info" onclick="now_buy()">
						<i class="bi bi-basket2"></i> 바로구매
					</button>

						<button class="text-center btn btn-outline-dark flex-shrink-0  btn-lg me-3 btn-info" onclick="cart()">
					<button id="addCart" class="text-center btn btn-outline-dark flex-shrink-0  btn-lg me-3" >
						<i class="bi-cart-fill me-1"></i>장바구니
					</button>
					<input id="book_no" type="hidden" value="${book.book_no}">
				</div>
				</c:if>
				</div>
				</div>
					
				</div>
				</div>
				</div>

		
</main>

<div id="detail-review">

<div class="mt-5">
	<h3 class="mb-3"><i class="bi bi-book"></i> 리뷰</h3>
	<select id="REVIEW_STAR"> 
		<option selected="selected">별점 선택</option>
		<option value="1">⭐</option>
		<option value="2">⭐⭐</option>
		<option value="3">⭐⭐⭐</option>
		<option value="4">⭐⭐⭐⭐</option>
		<option value="5">⭐⭐⭐⭐⭐</option>
	</select>
	<textarea class="mt-2" rows="3" cols="150" name="review_content" id="review_content" placeholder="배송 문의나 욕설 인신공격성 글은 상품 페이지에서 노출 제외처리됩니다."></textarea>
	<button class="text-center btn btn-outline-dark flex-shrink-0" name="btn_review" id="btn_review">등록</button>
</div>

<div id="reviewList">
<c:if test="${empty review}"  >
		<div class="text-center mt-5"> 작성된 리뷰가 없습니다. </div>
	</c:if>
		<c:forEach var="review" items="${review}" varStatus="status">

		<div class="container-fluid mt-4">
			<div class="row">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
						<i class="bi bi-person-circle fs-2"></i>
						   ID : ${review.user_id} <br>
						   등록 날짜 : <fmt:formatDate value="${review.review_date}" pattern="yyyy년 MM월 dd일" type="date"/> 
						</div>
						<div class="col-md-4">
						</div>
						<div class="col-md-4">
						</div>
					</div>
				</div>
				<div class="col-md-4">
				<!-- 별점 -->
					<c:forEach begin="1" end="${review.review_star}">
						⭐
					</c:forEach>
					<div> 추천수  (${review.review_recommend}) </div>
				</div>
				<div class="col-md-2">
				<c:if test="${review.user_id eq sessionScope.user_id }">
				<button id="review_update" class="btn btn-warning" onclick="review_upd(this.value)"  value="${review.review_no }"   >수정</button>
				<button id="review_delete" class="btn btn-warning" onclick="review_dlt(this.value)" value="${review.review_no }">삭제</button>	
				</c:if>
				</div>	
			</div>
			<div class="row">
				<div class="col-md-12">
				 ${review.review_content} 
				</div>
			</div>
			<div class="mt-2 mb-5">
						<input type="hidden" value="" name="review_no" >
						<button id="btn_recommend" value="${review.review_no }"  onclick="review_recommend(this.value)" class="text-center btn btn-outline-dark flex-shrink-0 btn-xs" > <i class="bi bi-hand-thumbs-up"> </i> 추천하기 </button>
					
			</div>
		</div>

</c:forEach>
	</div>
	</div>
	
<!--------------------------------- 리뷰 수정 모달  -------------------------------->	
<div class="modal" tabindex="-1" id="my-modal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalVerticallyCenteredLabel">리뷰 수정</h5>
        <button type="button" class="btn-close" aria-label="Close" onclick="modal_close()"></button>
      </div>
      <div class="modal-body">
      <textarea id="modal-text" cols="55" rows="5" > </textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" onclick="modal_close()">닫기</button>
        <button type="button" class="btn btn-primary" id="btn_modal_upd">수정</button>
      </div>
    </div>
  </div>
</div>
	
<!-- ---------------------------------- 푸터  --------------------------------- -->	
<jsp:include page="/views/inc/footer.jsp" />
</div>	



<script type="text/javascript">


/* ------------------------바로구매 버튼 클릭  ----------------------------*/
function now_buy(){
	let book_no = ${book.book_no};
	let user_id = '<%=session.getAttribute("user_id")%>';
	let product_cnt  = document.getElementById("product_cnt").value;
	console.log("book_no : " + book_no + "user_id :  " + user_id + "product : " + product_cnt )
	if(user_id === null ||user_id === "" || user_id === "null"){
		alert('로그인 페이지로 이동합니다.');
		location.replace("views/user/login.jsp");
	
	}else{
		alert('바로구매');
		location.replace("/detail/cart/orderitem?book_no="+book_no+"&user_id="+user_id+"&product_count="+product_cnt+"&buy_now=Y");
	}

}

/* ------------------------장바구니 버튼 클릭 ----------------------------*/
function cart(){
	let book_no = ${book.book_no};
	let user_no = '<%=session.getAttribute("user_no")%>';
	let product_cnt  = document.getElementById("product_cnt").value;
	console.log("book_no : " + book_no + "user_no :  " + user_no + "product : " + product_cnt )
	if(user_no === null ||user_no === "" || user_no === "null"){
		alert('user_no = null');
		location.replace("/itemorder/cart/list?book_no="+book_no+"&user_no=0"+"&product_count="+product_cnt);
	}else{
		alert('장바구니');
		location.replace("/itemorder/cart/list?book_no="+book_no+"&user_no="+user_no+"&product_count="+product_cnt);
	}
}

$("#addCart").click(function(){	
	
	var data = {
			  book_no :  $("#book_no").val(),
			  product_count : $("#product_count").val()
			};
	
	console.log(data);
	  
	$.ajax({
	   url : "/itemorder/cart/add",
	   type : "POST",
	   data : data,
	   success : function(result){
			
		   if(result == 1) { // 1 : 장바구니 추가 성공, 0 : 장바구니 추가 실패
				alert("카트 담기 성공");
				$("#product_cnt").val("1");
			} else {
				alert("회원만 사용할 수 있습니다.")
				$("#product_cnt").val("1");
			}
		   
		}, error : function(){
		     alert("error : 카트 담기 실패");
		    }		
	 });
});


<%-- function cart(){
	let book_no = document.getElementById("book_no").value;
	let user_no = '<%=session.getAttribute("user_no")%>';
	let product_cnt  = document.getElementById("product_cnt").value;
	console.log("book_no : " + book_no + "user_no :  " + user_no + "product : " + product_cnt )
	if(user_no === null ||user_no === "" || user_no === "null"){
		alert('user_no = null');
		location.replace("/itemorder/cart/list?book_no="+book_no+"&user_no=0"+"&product_count="+product_cnt);
	}else{ 
		location.replace("/itemorder/cart/add");
		alert("카트 담기 성공");
		//location.replace("/itemorder/cart/list?book_no="+book_no+"&user_no="+user_no+"&product_count="+product_cnt);
	}
} --%>


/* ------------------------ 추천 버튼 클릭  ----------------------------*/
function review_recommend(val){
	alert("추천클릭");
$.ajax({
		type: 'get',
		url: "/updateReviewRecommend?review_no="+val,
		data : "text" ,
		contentType: "application/x-www-urlencoded;charset=UTF-8", 
		processData: false, 
		cache : false,
		success: function (data){
			alert('리뷰를 추천하였습니다.');
			//리뷰 업데이트를 위해 getbook실행
			getReview();
		},
		error:function(request, status, error){
			alert('에러');
			console.log("code: " + request.status)
        	console.log("message: " + request.responseText)
        	console.log("error: " + error);
			
		}		
		
	});
}	


/* ------------------------항상 실행----------------------------*/
/* ------------------------변수에 별점 가져오기 ----------------------------*/

$(function(){
	let star = 
	$('#REVIEW_STAR').change(function(){
		let star = $('#REVIEW_STAR option:selected').val();
		console.log(star);
	});
	
	

/* ------------------------ 리뷰 등록 버튼 클릭  ----------------------------*/

	$('#btn_review').click(function(){
		let user_id = '<%=session.getAttribute("user_id")%>';
		
    	//리뷰 버튼 클릭 시 가져오는 리뷰 정보  		
		let review_json = {
		        "review_star" : star.val(),
		        "book_no" : ${book.book_no}, 
		        "user_id" : user_id,
		        "review_content" : $('#review_content').val(),
		        "review_recommend" :0 
		};

		if(user_id === null ||user_id === "" || user_id === "null"){

			alert('로그인 페이지로 이동합니다.');
			location.replace("/views/user/login.jsp");
			
		}else{
			exist_review();
		}
		
		
		//리뷰 존재 여부 확인 
		function exist_review(){
				$.ajax({
				type: 'get',
				url: '/existReview?book_no='+${book.book_no}+'&user_id='+user_id, 
				data: "text",
				dataType: "text",
				contentType:"application/x-www-urlencoded;charset=UTF-8",
				async: false,
				success: function (data){
					if(data > 0){
						alert('등록한 리뷰가 있습니다. ');
					}else{
						//리뷰가 존재하지 않으면 실행
						review_insert();	
					}					
				}

				});
		}
		
		//리뷰 등록
		function review_insert(){
					$.ajax({
					type: 'post',
					url: '/review',
					data: JSON.stringify(review_json),
					dataType: "text",
					contentType:"application/json;charset=UTF-8",
					success: function (data){
						alert('리뷰를 등록하였습니다.');
						getReview();
					},
					
					error:function(request, status, error){
						console.log("code: " + request.status)
			        	console.log("message: " + request.responseText)
			        	console.log("error: " + error);
						if(star.val() ==='별점 선택'){
							alert('별점 선택은 필수입니다.');
						}
						if($('#review_content').val() === null || $('#review_content').val() === "" ){
							alert('내용을 입력하세요. ');
						}
					}		
						  			
			});

		}
	
	});
});

/* ------------------------ 리뷰 새로고침  ----------------------------*/
function getReview(){
	$.ajax({
		type : "get",
		url : "/getBook?book_no=${book.book_no}",
		data : "formdata", 
		contentType: false, 
		processData: false, 
		cache : false,
		success : function (data){
			//리뷰 부분만 새로고침
			$('#reviewList').load(location.href+' #reviewList');
				
		},
		error : function(){
			alert("에러 발생");	
		}
	});
}

/* ------------------------ [모달] 리뷰 수정  ----------------------------*/
function review_upd(val){
	$('#my-modal').modal('show');
	$('#btn_modal_upd').click(function(){
		$.ajax({
			type: 'post',
			url: '/updateReview',
			data : {
				review_no : val,
				review_content : $('#modal-text').val()	
			},
			
			success: function (data){
				alert('리뷰가 수정되었습니다.');
				getReview();
				$('#my-modal').modal('hide');
			},
			error:function(request, status, error){
				console.log("code: " + request.status)
	        	console.log("message: " + request.responseText)
	        	console.log("error: " + error);
			}
		});
			
	});
	
}	

/* ------------------------ 리뷰 삭제  ----------------------------*/
 function review_dlt(val){
	 $.ajax({
			type: 'post',
			url: '/deleteReview',
			data : {
				review_no : val,
			},
			
			success: function (data){
				alert('리뷰가 삭제되었습니다.');
				getReview();
			},
			error:function(request, status, error){
				console.log("code: " + request.status)
	        	console.log("message: " + request.responseText)
	        	console.log("error: " + error);
			}
		});	
}
 
/* ------------------------ [모달] 닫기  ----------------------------*/
function modal_close(){
	$('#my-modal').modal('hide');
	
}



</script>

<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>


	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js"
		crossorigin="anonymous"></script>


</body>
</html>




