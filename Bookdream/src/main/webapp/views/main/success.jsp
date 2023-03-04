	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>	
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

<!-- Favicon -->
<link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon/apple-touch-icon.png" />
<link rel="icon" type="/image/png" sizes="32x32" href="/resources/images/favicon/favicon-32x32.png" />
<link rel="icon" type="/image/png" sizes="16x16" href="/resources/images/favicon/favicon-16x16.png" />
<link rel="manifest" href="/resources/images/favicon/site.webmanifest" />
<link rel="stylesheet" href="/resources/css/styles.css" />

<title>주문완료 페이지</title>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/success.css">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap_icon.css">

<!--  맨위 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Script FontAwesome-->
<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>

</head>

<body>

	 <div class="wrapper">
	<jsp:include page="/views/inc/header.jsp" />
	
	<div class="container">
		
			<!-- dummy box -->
			<div style="height: 100px">
				<!-- dummy -->
			</div>

		<!-- -----------------------top_bar-------------------- -->
			<div class="top_bar">
				<h2></h2>
			</div>				
				
		<!-- ----------------------- main -------------------- -->
			<div class="main">

		<div class="newBook_carousel">

			<div style="font-weight: bold;">금주 신간도서</div>
			<hr>
					<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
					  					  
					  <div class="carousel-inner" id="carousel-inner">
						<c:forEach items="${newBook}" var="book" varStatus="bookIdx">
						
						<c:set var="active" value="${bookIdx.first eq true ? 'active' : '' }"></c:set>
										  
						    <div class="carousel-item ${active}" data-bs-interval="1000">
						    
								<div class="card d-block newBookCard">
								  <img class="newBookCard_img" src="${book.BOOK_IMG }" class="card-img-top" alt="...">
								  <div class="card-body">
								    <h5 class="card-title newBookCard_title">${book.TITLE}</h5>
								  </div>
								  
								</div>
						    </div>
						    
						</c:forEach> 

					  </div>
					  
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </button>
					</div>			
		</div>
		
		<!-- ----------------------- orderlist -------------------- -->
				<div class="orderlist">
				
					<div class="title">주문상품</div>
					<table class="orderlist_table">
						<tr>
							<th class="orderlist_table_th1" colspan="3">${order.order_name}</th>
							<th class="orderlist_table_th2">
								<span class="orderlist_table_th_right"><i class="bi bi-chevron-down" id="orderlist_table_toggle"></i></span>							
							</th>
						</tr>
						
						<c:forEach items="${purchase}" var="pur" varStatus="i">
							<tr class="orderlist_table_tr" id="orderlist_table_tr">
								<td class="orderlist_table_col1"><img class="orderlist_table_img" alt="" src="${pur.BOOK_IMG}"></td>
								<td class="orderlist_table_col2">${pur.TITLE}</td>
								<td class="orderlist_table_col3"><fmt:formatNumber value="${pur.BOOK_PRICE}" pattern="###,###"/>원</td>
								<td class="orderlist_table_col4">${pur.PRODUCT_COUNT}개</td>
							</tr>
						</c:forEach>
					
					</table>
				</div>
		
		<!-- ----------------------- pay_info -------------------- -->		
				<div class="pay_info">
					<div class="title">결제정보</div>
					<div class="pay_info_content">
					
						<ul class="pay_info_ul1">
							<li class="pay_info_li1">주문금액<span class="text_right"><fmt:formatNumber value="${order.total_price}" pattern="###,###"/></span></li>
							<li class="pay_info_krw">원</li>
							<li class="pay_info_li2">배송료<span class="text_right">+ <fmt:formatNumber value="${order.pay_fee}" pattern="###,###"/></span></li>
							<li class="pay_info_krw">원</li>
							<li class="pay_info_li3">할인금액<span class="text_right">- <fmt:formatNumber value="${order.use_point}" pattern="###,###"/></span></li>						
							<li class="pay_info_krw">원</li>
						</ul>
						
						<hr>
						
						<ul class="pay_info_ul2">
							<li class="pay_info_li4">최종결제금액<span class="text_right_final"><fmt:formatNumber value="${order.final_price}" pattern="###,###"/></span><span class="text_right_krw"></span></li>
							<li class="pay_info_krw">원</li>
							<li class="pay_info_li5">${order.pay_method} 결제</li>
						</ul>					
									
					</div>
				
				</div>		
	<!-- ----------------------- user_info -------------------- -->				
				<div class="user_info">		
					<div class="title">배송지 정보</div>	
					<div class="user_info_content">
					
						<ul class="user_info_ul1">
							<li class="user_info_li1">받는 사람</li>
							<li class="user_info_li2">${order.order_receiver} / ${order.order_tel}</li>
							<li class="user_info_li3">받는 주소</li>
							<li class="user_info_li4">${order.order_address}</li>
						</ul>
					</div>	

	<!-- ----------------------- button -------------------- -->					
					<div class="user_info_button">
						<button class="btn btn-outline-secondary shopping_btn" id="shopping_btn">쇼핑 계속</button>
						<button class="btn btn-primary mypage_btn" id="mypage_btn">마이페이지 이동</button>
					</div>			
				</div>		
		</div>		
	</div>
	
	<jsp:include page="/views/inc/footer.jsp" />
	
	</div>


   <!-- Script Bootstrap, jqurey-3.6.3 -->
   <script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
   <script src="/resources/bootstrap/js/bootstrap.min.js"></script>

   <!-- 아래 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
   <script type="text/javascript">

	/***************************** getElementById function *****************************/
	function ById(id) {
		return document.getElementById(id);
	}

	/***************************** 주문 상품 토글 *****************************/
	$(document).on("click", "#orderlist_table_toggle", function(e) {	
		e.preventDefault();	

		var toggle = document.getElementsByClassName('orderlist_table_tr');
			
		if ($("#orderlist_table_tr").css("display") == "none") {
		
			for (var i=0; i<toggle.length; i++) {
				toggle[i].style.display = "table-row";
			}
			console.log("상품목록 열림");
			ById('orderlist_table_toggle').className = 'bi bi-chevron-up';	
		} else {
			for (var i=0; i<toggle.length; i++) {		
				toggle[i].style.display = "none";
			}	
			console.log("상품목록 닫힘");		
			ById("orderlist_table_toggle").className = "bi bi-chevron-down";		
		}

	})
	
	/***************************** 주문 계속 버튼 클릭 *****************************/
	$(document).on("click", "#shopping_btn", function(e) {	
		e.preventDefault();	
		
		location.href="/views/main/main.jsp";
	})
	
	
	/***************************** 마이페이지 이동 버튼 클릭 *****************************/
	$(document).on("click", "#mypage_btn", function(e) {	
		e.preventDefault();	
		
		location.href="/mypage/tracking";
	})
	
	</script>
	
	<script>
   		let user_no = <%= (int)session.getAttribute("user_no") %>;
   		<%@include file="/resources/js/cartLIstCount.js"%>
	</script>
	

</body>
</html>