<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="/resources/images/favicon/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="/resources/images/favicon/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/favicon/favicon-16x16.png" />
<link rel="manifest" href="/resources/images/favicon/site.webmanifest" />

<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<!-- CSS file -->
<link rel="stylesheet" href="/resources/css/styles.css" />
<style type="text/css">
input[type='number']::-webkit-outer-spin-button, 
input[type='number']::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

</style>

<meta charset="UTF-8">
<title>장바구니</title>

</head>

<body>

	<!-- ---------------------------<header> header------------------------- -->
	<header>
		<%
			int book_no = (int) (Math.random() * 100) + 1;
		%>
		<div class="header-nav-list">
			<ul class="nav header-nav">
				<li class="nav-item"><a class="nav-link header-nav-link"
					aria-current="page" href="user/join.jsp">회원가입</a></li>
				<span class="nav-bar-line"></span>
				<li class="nav-item"><a class="nav-link header-nav-link"
					href="user/login.jsp">로그인</a></li>
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
					src="/resources/images/logo/logo_white.png" alt="logo_white" /> <img
					class="header-row-logo_text"
					src="/resources/images/logo/logo_text.png" alt="logo_text" />
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
				<a href="cart.jsp">
					<div class="header-btn">
						<i class="fa-solid fa-cart-shopping"></i>
					</div>
				</a> <a href="orderitem.jsp">
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

	<div class="container ">

		<main>
		
		<!-- dummy -->
		<div class="my-5 "><!-- dummy --></div>
		
		<!-- ------------------top box---------------------- -->
		<div class="py-5 text-center">
			<h2></h2>
		</div>

		<div class="row g-4 justify-content-md-center">
			
			<!-- ------------------cartList---------------------- -->
			<div class="col-md-6 col-lg-6 order-md-first">
				<form class="needs-validation" novalidate="">
					<div class="row g-3">

						<table class="table">
							<thead>
								<th scope="col" colspan="5" class="">
									<input
									class="col form-check-input" type="checkbox" id="allcheckbox"
									checked="checked" onclick='selectAll(this)'></th>
								<th scope="col"></th>
							</thead>


							<c:forEach items="${cartList}" var="cart" varStatus="status">
								<tr class="border border-2 border-start-0 border-end-0">
	
										<!-- -----------------------체크박스----------------------- -->
										<td class="align-middle">
											<div class="form-check">
												<input id="check_cart_no" class="form-check-input"
													type="checkbox" name="check_cart_no" value="" checked=""> <label
													class="form-check-label" for="check_cart_no"></label>
											</div>
											<input class="cart_no" value="${cart.cart_no }" type="hidden">
											<input class="book_no" value="${cart.bookVO.book_no }" type="hidden">
											<input class="user_no" value="${cart.userVO.user_no }" type="hidden">
											<input class="product_count" value="${cart.cart_no }" type="hidden">
										</td>
	
										<!-- -----------------------책 이미지----------------------- -->
										<td class="align-middle"><a
											href="/getBook?book_no=${ cart.bookVO.book_no }"> <img
												class="img-thumbnail" alt="${ cart.bookVO.title }"
												src="${cart.bookVO.book_img }">
										</a></td>
	
										<!-- -----------------------책제목, 가격----------------------- -->
										<td class=" align-middle"
											align="left"><a class="text-decoration-none "
											href="/getBook?book_no=${ cart.bookVO.book_no }">
												<p class="fw-bold lh-sm">${ cart.bookVO.title }</p>
										</a> <input type="hidden" id="book_price"
											value="${ cart.bookVO.book_price }" /> <label
											class="form-check-label" for="book_price" />
											<p class="lh-lg">${ cart.bookVO.book_price }원</p>
											<p class="dark-subtle">재고 : ${cart.bookVO.stock } 권</p>
										</td>
										
										<td class="border border-start-0">
											<!-- -------장바구니 삭제------ -->
											<button class="deleteCart mt-1 close 
															btn btn-light rounded-circle "
												type="button" aria-label="Close" onclick="deleteCart()">
												<span class="" aria-hidden="true">&times;</span>
											</button>
										</td>
										
										<!-- -----------------------금액 , 수량----------------------- -->
										<td class="align-middle text-center">
											<div class="justify-content-md-center">
												<p class="fs-5 lh-base fw-800">${ (cart.bookVO.book_price * cart.product_count)}원</p>
												<div class="input-group input-group-sm w-75 m-auto
															border border-dark-subtle rounded-3 border-2">
													<button id="minus" class="btn fw-bold" type="button">-</button>
													<input class="form-control text-center border-0 "
														type="number" name="product_cnt" min="1"
														max="${cart.bookVO.stock}" value="${ cart.product_count }">
													<label  class="form-label" for="product_cnt"></label>
													<button id="plus" class="btn fw-bold" type="button">+</button>
												</div>
											</div>
										</td>
										
									</tr>
							</c:forEach>
							
						</table>
					</div>
				</form>
			</div>
		
			<!-- ------------------slide box---------------------- -->
			<div class="slideBox col-md-3 col-lg-3 ">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-primary">Total</span> 
					<span class="badge bg-primary rounded-pill">3<!-- 장바구니sum --></span>
				</h4>


				<ul class="list-group mb-3">
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<h6 class="my-0">금액 합계</h6>
							<!-- <small class="text-muted">Brief description</small> -->
						</div> <span class="text-muted">000,000 원 </span>
					</li>
					
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<h6 class="my-0">배송비</h6>
							<!-- <small class="text-muted">Brief description</small> -->
						</div> <span class="text-muted">+ 000,000 원</span>
					</li>
					
					<!-- 전체 총 합계 -->
					<li class="list-group-item d-flex justify-content-between">
					<span>전체 총 합계</span> 
					<strong> 000,000 원</strong> </li>
				</ul>

				<form class="card p-0 border-0">
					<div class="input-group">
						<button class="w-100 btn btn-primary btn-lg" type="submit">PayNow</button>
					</div>
				</form>
			</div>

		</div>

		<!-- dummy -->
		<div class="my-5 "><!-- dummy --></div>
		
		</main>
		
	</div>
	<!-- ---------------------------<footer> footer-------------------------- -->
	<footer>
		<div>
			<a class="footer-logo" href="#"> <img class="footer-logo-img"
				src="/resources/images/logo/logo_white.png" alt="logo_white" /> <img
				class="footer-logo-text"
				src="/resources/images/logo/logo_text--white.png"
				alt="logo_text--white" />
			</a>
		</div>
		<div class="footer-section">
			<div class="footer-profile-box">
				<div class="footer-profile">
					<div class="profile-github">
						<a href="#"> <i class="fa-brands fa-github fa-xl"></i>
						</a>
					</div>
					<div class="profile-text">
						<a href="#">윤동환</a>
					</div>
				</div>
				<div class="footer-profile">
					<div class="profile-github">
						<a href="#"> <i class="fa-brands fa-github fa-xl"></i>
						</a>
					</div>
					<div class="profile-text">
						<a href="#">양현정</a>
					</div>
				</div>
				<div class="footer-profile">
					<div class="profile-github">
						<a href="#"> <i class="fa-brands fa-github fa-xl"></i>
						</a>
					</div>
					<div class="profile-text">
						<a href="#">백기렬</a>
					</div>
				</div>
				<div class="footer-profile">
					<div class="profile-github">
						<a href="#"> <i class="fa-brands fa-github fa-xl"></i>
						</a>
					</div>
					<div class="profile-text">
						<a href="#">차승윤</a>
					</div>
				</div>
				<div class="footer-profile">
					<div class="profile-github">
						<a href="#"> <i class="fa-brands fa-github fa-xl"></i>
						</a>
					</div>
					<div class="profile-text">
						<a href="#">안성연</a>
					</div>
				</div>
			</div>
			<div class="footer-document">
				<div class="doucumnet-text">Project 설명이 포함되어 있습니다.</div>
				<span>© BOOKDREAM BUKDACK-BUCKDACK</span>
			</div>
		</div>
	</footer>
	
	<!-- ---------------------------script--------------------------- -->
	<script>
		function deleteCart(){
			var cart_no = $(this)
			
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