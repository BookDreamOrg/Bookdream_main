<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<!DOCTYPE html>

<html>
<head>

<!-- alert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>


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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body class="mt-3">

<%
		int book_no = (int) (Math.random() * 100) + 1;
%>
<div class="wrapper"> 

		<jsp:include page="/views/inc/header.jsp" />
		
		<main>

		<div class="book-section">
					
	<div class="row">
		<div class="col-6 text-center mt-5 ">
			<img id="detail-img" alt="${book.title }" src="${book.book_img }" class="img-thumbnail" />
		</div>
		<div class="col-6 mt-5">
				 <div class="display-6 mt-5 mb-2" id="book_title">${book.title }</div>
				
				<ul class=" list-group-horizontal">
					<li class="mt-3 book_info"><span class="h5">${book.author } | ${book.publisher} | ${strdate} </span> </li>
					<li class="mt-3"><span class="mb-5 fw-bold text" >⭐ 평균 별점</span><span class="fw-bold">  ${avgStar} </span> /  <small class="text-muted">  5.0 </small></li>
					
					<c:choose>
					<c:when test="${book.stock > 0 }">
					<c:choose>
						<c:when test="${ book.discount eq 0 }">
							<li class="mt-4" ><span class="h3" style="color: red;" id="price_org" ><fmt:formatNumber value="${book.book_price}" pattern="###,###,###원" /></span></li>
						</c:when>
						<c:otherwise>
							<li class="mt-4">
							<span class=" h5 text-muted text-decoration-line-through" id="dis_org_price"><fmt:formatNumber value="${book.book_price}" pattern="###,###,###원" /></span>
							 <span class="h3" style="color: red;" id="dis_price"><fmt:formatNumber type="currency" pattern="###,###,###원" value="${book.book_price - (book.book_price*book.discount/100)} " /></span>
							 <span class="h6">(<fmt:formatNumber type="percent"  value="${book.discount/100} " /> 할인)</span>
							 </li>
						</c:otherwise>
						</c:choose>	
							 <li><div class=" h6 mt-4 "><a id="delivery"></a></div></li>
							 <li class="mt-4"></li>
				
						</c:when>
						<c:otherwise>
						<div class="h1 mt-5"> 품&nbsp;&nbsp;절  </div>					
						</c:otherwise>
				</c:choose>	 
				</ul>		 
				
	</div>					

					
	</div>

	
	<div class="row  mt-5">
		<div class="col-md-1">
		</div>
		<div class="col-md-10">
			<span class="h2" id="detail-bookinfo">책 소개 &nbsp; &nbsp;</span>
			<p class="pt-3 h5" id="book_content">
			${book.book_content }
			</p>	
		</div>
		<div class="col-md-1">
		</div>
	</div>

</div>

</main>
<hr>

<div id="reviewList">
<div id="detail-review">

<!-- 리뷰 평가  -->
<div class="row mt-5">
		<div class="col-md-5 text-end">
		<img class="header-row-logo ms-4"src="/resources/images/logo/logo_white.png" alt="logo_white" />
		<img class="header-row-logo_text" src="/resources/images/logo/logo_text.png" alt="bookdream" /></div>
		<div class="col-md-7 h1 text-start mt-2"> 회원이 평가한 리뷰 </div> 
</div>



<div class="row mt-5 mb-5 h3">
	<c:forEach var="progressStar" items="${progressStar}" varStatus="status">
			
<div class="col-md-5 text-end" id="star_box">
			<!--  -->
			<div class="row">
			<c:forEach var="i" begin="1" end="5">
			<c:choose>
				<c:when test="${i <= progressStar.key }">
					💜
				</c:when>
				<c:otherwise>
					🤍
				</c:otherwise>
			</c:choose>
			</c:forEach>
			</div>
</div>	
				
			<div class="col-md-7 mt-3 text-start" id="progress_box">
			<div class="progress">
				<div class="progress-bar" id="progress" role="progressbar" style="width: ${progressStar.value.PROPORTION}%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">${progressStar.value.PROPORTION}%</div>
			</div>
			</div>
	</c:forEach>

</div>				


<!-- 리뷰 등록 창 -->
	<h3 class="mt-5"><i class="bi bi-book"></i> 리뷰</h3>
	<select id="REVIEW_STAR"> 
		<option selected="selected">별점 선택</option>
		<option value="1">⭐</option>
		<option value="2">⭐⭐</option>
		<option value="3">⭐⭐⭐</option>
		<option value="4">⭐⭐⭐⭐</option>
		<option value="5">⭐⭐⭐⭐⭐</option>
	</select>
<div class="">
	<textarea class="mt-2" rows="3" cols="170" name="review_content" id="review_content" placeholder="배송 문의나 욕설 인신공격성 글은 상품 페이지에서 노출 제외처리됩니다."></textarea>
	<button class="text-center btn btn-outline-dark flex-shrink-0 mb-5" name="btn_review" id="btn_review">등록</button>
</div>


<div>
<c:if test="${empty review}"  >
		<div class="text-center mt-5"> 작성된 리뷰가 없습니다. </div>
	</c:if>
		<c:forEach var="review" items="${review}" varStatus="status">

		<div class="container-fluid mt-4">
			<div class="row">
				<div class="col-md-6">
				
						<div>
						<i class="bi bi-person-circle fs-2"></i>
						   ID : ${review.user_id} <br>
						   등록 날짜 | <fmt:formatDate value="${review.review_date}" pattern="yyyy년 MM월 dd일" type="date"/> 
						</div>
					
				</div>
				<div class="col-md-4">
				<!-- 별점 -->
					<c:forEach begin="1" end="${review.review_star}">
						⭐
					</c:forEach>
					<div> 추천수  (${review.review_recommend}) </div>
				</div>
				<div class="col-md-2 align-self-end">
				<c:if test="${review.user_id eq sessionScope.user_id }">
				<button id="review_update" class="btn btn-outline-primary" onclick="review_upd(this.value)"  value="${review.review_no }"   >수정</button>
				<button id="review_delete" class="btn btn-outline-primary" onclick="review_dlt(this.value)" value="${review.review_no }">삭제</button>	
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
			<hr class="my-2">
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
</div>

	<!-- 장바구니/결제 버튼 -->
	
	<c:choose>
		<c:when test="${book.stock > 0 }">
	
	<div class="container-fluid mt-5 row" id="button_box">
	<div class="text-center col-4 mt-2 ">
	
					<c:choose>
						<c:when test="${ book.discount eq 0 }">
						<span class="h4">금액 : </span> 
						 <span class="h3" style="color: red;" id="org_btn_box"><fmt:formatNumber value="${book.book_price}" pattern="###,###,###원" /> </span>
						</c:when>
						<c:otherwise>
							<span class="h4">금액 : </span> 
							<span class=" h5 text-muted text-decoration-line-through" id="price_btn_box"><fmt:formatNumber value="${book.book_price}" pattern="###,###,###원" /></span>
							 <span class="h3" style="color: red;" id="dis_btn_box"><fmt:formatNumber type="currency" pattern="###,###,###원" value="${book.book_price - (book.book_price*book.discount/100)} " /></span>
							 <span class="h6">(<fmt:formatNumber type="percent"  value="${book.discount/100} " /> 할인)</span>
							 
						</c:otherwise>
						</c:choose>
		
	</div>
	
	<div class="col-4">
	<input class=" form-control text-center " type="number" id="product_cnt" min="1" max="${book.stock}" value="1" onchange="delivery_func(this.value)" >	
	<span class="h4" id="stock_box"> 수량 : </span>		
	</div>
							
							
		<div class="text-start col-4">
		<button id="btn_buy_now" class="text-center btn btn-outline-dark flex-shrink-0 btn-lg" onclick="now_buy()">
									 바로구매
								</button>
								<button id="btn_cart" class="text-center btn btn-outline-dark flex-shrink-0  btn-lg me-3" onclick="cart()">
									장바구니
								</button>
							<input id="book_no" type="hidden" value="${book.book_no}">
		</div>					
	</div>


</c:when>						
	</c:choose>
	
<!-- ---------------------------------- 푸터  --------------------------------- -->	
<jsp:include page="/views/inc/footer.jsp" />
</div>


<script type="text/javascript">


/* ------------------------바로구매 버튼 클릭  ----------------------------*/
function now_buy(){
	let book_no = ${book.book_no};
	let user_id = '<%=session.getAttribute("user_id") %>';
	let product_cnt  = document.getElementById("product_cnt").value;
	console.log("book_no : " + book_no + "user_id :  " + user_id + "product : " + product_cnt )
	if(user_id === null ||user_id === "" || user_id === "null"){
		alert('로그인 페이지로 이동합니다.');
		location.replace("views/user/login.jsp");
	
	}else{
		alert('바로구매');
		location.replace("/detail/cart/orderitemBuyNow?book_no="+book_no+"&user_id="+user_id+"&product_count="+product_cnt+"&buy_now=Y");
	}

}

/* ------------------------장바구니 버튼 클릭 ----------------------------*/

 $("#btn_cart").click(function cart() {
	 let book_no = document.getElementById("book_no").value;
	 let product_count  = document.getElementById("product_cnt").value;
	 
	 let data = {
	           book_no :  book_no,
	           product_count :product_count
	         };
	      
	   console.log(data);
	     
	   $.ajax({
	      url : "/itemorder/cart/add",
	      type : "POST",
	      data : data,
	      success : function(result){
	         
	         if(result == 1) { // 1 : 장바구니 추가 성공, 0 : 장바구니 추가 실패
	         	$("#product_cnt").val(1);
	            // 카트 리스트 갯수 뱃지 recount
	               
	               Swal.fire({
	         	      title: '장바구니에 담았어요!',
	         	      text: '장바구니로 이동할까요?',
	         	      icon: 'success',
	         	      showCancelButton: true,
	         	      confirmButtonColor: '#3085d6',
	         	      cancelButtonColor: '#d33',
	         	      confirmButtonText: '장바구니 이동',
	         	      cancelButtonText: '계속 쇼핑하기',
	         	      reverseButtons: true, // 버튼 순서 거꾸로
	         	      
	         	    }).then((result) =>{
	         	    	if (result.value) { location.href = "/itemorder/cart/list"; }
	         	    });
	         	    
	         } else if(result == 0) {
	        	  
	               Swal.fire({
	         	      title: '로그인을 해주세요',
	         	      text: '로그인 페이지로 이동할까요?',
	         	      icon: 'warning',
	         	      showCancelButton: true,
	         	      confirmButtonColor: '#3085d6',
	         	      cancelButtonColor: '#d33',
	         	      confirmButtonText: '로그인 하기',
	         	      cancelButtonText: '계속 쇼핑하기',
	         	      
	         	    }).then((result)  =>{
	         	    	if (result.value) { location.href = "/views/user/login.jsp"; }
	         	    });
	               
	        	  $("#product_cnt").val(1);
	         }
	         
	      }, error : function(){
	           alert("error : 카트 담기 실패");
	          }      
	    });
	   
	  });





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
 //리뷰 삭제 후 새로고침 없으면 동작안하는 현상 개선
$(document).on("click", "#btn_review", function(e) {
		let user_id = '<%=session.getAttribute("user_id")%>';
		
    	//리뷰 등록 버튼 클릭 시 가져오는 리뷰 정보  		
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
						alert('등록한 리뷰가 있습니다.');
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
						if(star.val() ==='별점 선택'){
							 Swal.fire(
									 '별점 선택은 필수입니다.',
							          '',
							          'info'
						
							 )
						}else if($('#review_content').val() === null || $('#review_content').val() === ""){
							 Swal.fire(
									 '내용을 입력해주세요',
							          '',
							          'info'
						
							 )
						}else{
							 Swal.fire(
									 '리뷰를 등록하였습니다.',
							          '',
							          'success'
						
							 )
							getReview();
						}
					},
					
					error:function(request, status, error){
						console.log("code: " + request.status)
			        	console.log("message: " + request.responseText)
			        	console.log("error: " + error);
						
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
			 Swal.fire(
					 '다시 시도해주세요.',
			          '',
			          'error'
		
			 )
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
				 Swal.fire(
						 '리뷰가 수정되었습니다.',
				          '',
				          'success'
			
				 )
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
				 Swal.fire(
						 '리뷰가 삭제되었습니다.',
				          '',
				          'success'
			
				 )
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


/* ------------------------ 배송 안내  / 구매 가격 ----------------------------*/	
 
 
 $(function(){
	
	 let price = ${book.book_price - (book.book_price*book.discount/100)};
	 let org_price = ${book.book_price};
	 if( price  >= 30000 ){
		 document.getElementById('delivery').innerHTML = '무료배송';
		 
	 }else{
		 document.getElementById('delivery').innerHTML = '배송비 3만원 추가';
	 }
	 

	 
 });

 function delivery_func(val){
	 
	 
	 let price = ${book.book_price - (book.book_price*book.discount/100)};
	 let org_price = ${book.book_price};
	 
	 if(${ book.discount} != 0){
		 document.getElementById('dis_org_price').innerHTML = AddComma(org_price * val);
		 document.getElementById('dis_price').innerHTML = AddComma(price * val);
		 
		 document.getElementById('price_btn_box').innerHTML = AddComma(org_price * val);
		 document.getElementById('dis_btn_box').innerHTML = AddComma(price * val);
	 }else{
		 document.getElementById('price_org').innerHTML = AddComma(org_price * val);
		document.getElementById('org_btn_box').innerHTML = AddComma(org_price * val);

	 }
	
	 
	
	 if( (price * val) >= 30000 ){
		 document.getElementById('delivery').innerHTML = '무료배송';

	 }else{
		 document.getElementById('delivery').innerHTML = '배송비 3만원 추가';
	 }
	 
	 
 }
	

 
 





/* ------------------------ [수식] 천 단위 콤마 찍기   ----------------------------*/

function AddComma(num) {	
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}




</script>

	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>


	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js"
		crossorigin="anonymous"></script>

	<script>
    let user_no = <%=session.getAttribute("user_no")%>;
	<%@include file="/resources/js/cartLIstCount.js"%>
	</script>


	<!-- 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</body>
</html>




