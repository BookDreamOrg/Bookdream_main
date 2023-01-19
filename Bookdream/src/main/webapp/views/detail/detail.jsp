<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="/resources/css/getBook.css" rel="stylesheet">
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
</head>
<body class="mt-3">

<%
		int book_no = (int) (Math.random() * 100) + 1;
%>
<div class="wrapper">

<header>
			<div class="header-nav-list">
				<ul class="nav header-nav">
					<li class="nav-item"><a class="nav-link header-nav-link"
						aria-current="page" href="#">회원가입</a></li>
					<span class="nav-bar-line"></span>
					<li class="nav-item"><a class="nav-link header-nav-link"
						href="#">로그인</a></li>
					<span class="nav-bar-line"></span>
					<li class="nav-item"><a class="nav-link header-nav-link"
						href="#">고객센터</a></li>
					<span class="nav-bar-line"></span>
					<li class="nav-item"><a
						class="nav-link header-nav-link disabled" href="#" tabindex="-1"
						aria-disabled="true"> 관리자 </a></li>
				</ul>
			</div>
			<div class="row d-flex header-row">
				<div class="col-lg-1 p-2 header-col-home mr-2 mb-1">
					<a href="#"> <img class="header-row-logo ms-4 mb-1"
						src="resources/images/logo/logo_white.png" alt="logo_white" /> <img
						class="header-row-logo_text"
						src="resources/images/logo/logo_text.png" alt="logo_text" />
					</a>
				</div>
				<div class="col-lg-6 p-2 ms-5 header-col-search">
					<div class="input-group mb-2 col-search">
						<button
							class="btn btn-outline-secondary dropdown-toggle search-toggle"
							type="button" data-bs-toggle="dropdown" aria-expanded="false">
							통합검색</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">베스트</a></li>
							<li><a class="dropdown-item" href="#">신상품</a></li>
						</ul>
						<input type="text" class="form-control search-input"
							aria-label="Text input with dropdown button"
							placeholder="성공적인 프로젝트를 위하여!!👍" />
					</div>
				</div>
				<div class="col-lg-1 p-5 flex-grow-1 header-col-btn">
					<a href="#">
						<div class="header-btn">
							<i class="fa-solid fa-cart-shopping"></i>
						</div>
					</a> <a href="#">
						<div class="header-btn btn-circle ms-3">
							<i class="fa-solid fa-user"></i>
						</div>
					</a>
				</div>
			</div>
			<div class="header-menu mb-1">
				<div class="btn-circle btn-circle-tint">
					<i class="fa-solid fa-bars"></i>
				</div>
				<ul class="nav header-menu-list">
					<li class="nav-item">
						<form action="/getBook" method="get">
							<button type="submit" name="book_no" value="<%=book_no%>">베스트</button>
						</form>
					</li>
					<div class="dot"></div>
					<li class="nav-item"><a class="nav-link menu-link" href="#">신상품</a>
					</li>
					<div class="dot"></div>
					<li class="nav-item"><a class="nav-link menu-link" href="#">이벤트</a>
					</li>
					<div class="dot"></div>
					<li class="nav-item"><a class="nav-link menu-link disabled"
						href="#" tabindex="-1" aria-disabled="true">Disabled</a></li>
				</ul>
			</div>
		</header>
		
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
		<div class="book-section"></div>
		</main>




<%=session.getAttribute("user_id") %>
<div>BOOK_NO : ${book.book_no }</div>
<div class="mt-5"><h1>${book.title }</h1></div>

<section class=py-5>
<div class="container">
<div class='row mb-5 mt-5'>
  <div class='col-4'>
  <img alt="${book.title }" src="${book.book_img }" ></div>
  <div class='col-8'>
  <ul>
  	<li>
  	 	<div id="detail-text"><i class="bi bi-arrow-right-circle"></i> 작가 </div>
  	 	<div id="detail-value">${book.author }</div>
  	</li>
  	<li>
  		<div id="detail-text">출판사</div>
  		<div id="detail-value"> ${book.publisher}</div>
  	</li>
  	<li>
  		<div id="detail-text">가격</div>
  		<div id="detail-value">${book.book_price}</div>
  	</li>
  	<li>
  		<div id="detail-text">출판일 </div>
  		<div id="detail-value">${strdate} </div>
  	</li>
  	<li>
  		<div id="detail-text">ISBN 번호</div>
  		<div id="detail-value">${book.isbn_no}</div>
  	</li>
  	<li>
  		<div id="detail-text">국내/해외 구분 </div>
  		<div id="detail-value" > ${book.book_category}</div>
  	</li>
  	<li>
  		<div id ="detail-text">수량</div>
  		<div id="detail-value"><input class="form-control text-center me-3" id="inputQuantity" type="number" value="1"></div>
  	</li>
  </ul>
  </div>
</div>
<h3><i class="bi bi-info-circle"></i> 책 소개</h3>
<p class="mt-5">${book.book_content }</p>
</div>
</section>

<div class="mt-5">
	<h3 class="mb-3"><i class="bi bi-book"></i> 리뷰</h3>
	<select id="REVIEW_STAR"> 
		<option selected="selected">별점 선택</option>
		<option value="1">1점</option>
		<option value="2">2점</option>
		<option value="3">3점</option>
		<option value="4">4점</option>
		<option value="5">5점</option>
	</select>
	<textarea rows="3" cols="150" name="review_content" id="review_content" placeholder="배송 문의나 욕설 인신공격성 글은 상품 페이지에서 노출 제외처리됩니다."></textarea>
	<button class="text-center btn btn-outline-dark flex-shrink-0" name="btn_review" id="btn_review">등록</button>
</div>

	<div id="reviewList">
	<c:if test="${empty review}"  >
		<div class="text-center mt-5"> 작성된 리뷰가 없습니다. </div>
	</c:if>
		<c:forEach var="review" items="${review}" varStatus="status">
		<ul>
			<li>
				<div class="flex mt-4">
					<div class="d-flex">
						<i class="bi bi-person-circle fs-2"></i>
						<!-- 별점  -->
						<div class="ms-2 d-flex">
						<c:forEach begin="1" end="${review.review_star}">
							<div class="bi-star-fill fs-5">  </div>
						</c:forEach>
						</div>
						<div class="ms-5"> ${review.review_content} </div>
					</div>
					<div class="d-flex">
						<div>${review.user_id} </div>
						<div><fmt:formatDate value="${review.review_date}" pattern="YY-MM-DD (E)" type="date"/>  </div>
						<div> 추천수  (${review.review_recommend}) </div>
						
					</div>
					<div class="mt-2">
						<input type="hidden" value="" name="review_no" >
						<button id="btn_recommend" value="${review.review_no }"  onclick="review_recommend(this.value)" class="text-center btn btn-outline-dark flex-shrink-0 btn-xs" > <i class="bi bi-hand-thumbs-up"> </i> 추천하기 </button>
					
					</div>
					<div>
					</div>
				</div> 
			<li>
		</ul>
		</c:forEach>
	</div>
	
<div class="mt-5" id="btn-buy">
	<button class="text-center btn btn-outline-dark flex-shrink-0  btn-lg me-3">
		<i class="bi-cart-fill me-1"></i>장바구니
	</button>
	<button class="text-center btn btn-outline-dark flex-shrink-0  btn-lg">
		<i class="bi bi-basket2"></i> 바로구매
	</button>
</div>

<script type="text/javascript">



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


$(function(){
	let star = 
	$('#REVIEW_STAR').change(function(){
		let star = $('#REVIEW_STAR option:selected').val();
		console.log(star);
	});
	
	

	$('#btn_review').click(function(){
		let user_id = "<%=session.getAttribute("user_id")%>";
		if(user_id === null || user_id === ""){
			location.replace("/member/login");
		}
		let review_json = {
		        "review_star" : star.val(),
		        "book_no" : ${book.book_no} , 
		        "user_no" : 1,
		        "book_no" : ${book.book_no},  
		        "user_id" : "test",
		        "review_content" : $('#review_content').val(),
		        "review_recommend" :0 
		};
		
		$.ajax({
			type: 'post',
			url: '/insertReview',
			data: JSON.stringify(review_json),
			dataType: "JSON",
			contentType:"application/json;charset=UTF-8",
			
			success: function (data){
				alert('리뷰가 등록되었습니다.');
				//리뷰 업데이트를 위해 getbook실행
				getReview();
			},
			error:function(request, status, error){
				alert('에러');
				console.log("code: " + request.status)
	        	console.log("message: " + request.responseText)
	        	console.log("error: " + error);
				if(star.val() ==='별점 선택'){
					alert('별점 선택은 필수입니다.');
				}
			}		
				  			
		})

});//btn_review.click end

	//추천 버튼 클릭




//review 업데이트를 하기 위한 getbook실행


});

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

</script>


</body>

</html>




