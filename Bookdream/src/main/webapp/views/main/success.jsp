<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Favicon -->
<link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon/apple-touch-icon.png" />
<link rel="icon" type="/image/png" sizes="32x32" href="/resources/images/favicon/favicon-32x32.png" />
<link rel="icon" type="/image/png" sizes="16x16" href="/resources/images/favicon/favicon-16x16.png" />
<link rel="manifest" href="/resources/images/favicon/site.webmanifest" />
<link rel="stylesheet" href="/resources/css/styles.css" />

<title>주문완료 페이지</title>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

<style type="text/css">

* {
	border-radius:10px;
	box-sizing: border-box;
}

body {
	 position: relative;
	 background-image: url('/resources/image/background.jpg');
	 background-repeat: no-repeat;
 	 background-position: center;
  	 background-size: cover;
  	 z-index: -1;	
}

body:before {
     content: "";
     opacity: 0.6;
     position: absolute;
     top: 0px;
     left: 0px;
     right: 0px;
     bottom: 0px;
     background-color: white;
  	 z-index: -1;	     
}



.main {
	position:relative;
	margin: 0 auto;
	width: 1240px;
	height: auto;
	min-height: 1000px;
}

.topbar {
	position:relative;
	height:150px;	
	margin-top: 50px;	
	border: 2px solid #bdbdbd;
	background-color: white;
}

.topbar_title{
	position:absolute;
	top:60px;
	margin-left:70px;
	font-size: 30px;
	font-weight: bold;
}

.center {
	position:relative;
	width: 1240px;
	height: auto;
	min-height:500px;
	margin-top:30px;	
	border: 2px solid #bdbdbd;
	background-color: white;	
}

table {
	position:absolute;
	top:110px;
	left:70px;
	width:700px;	
 	text-align:justify;
	font-size: 20px;
	
}

th{
	height: 50px;
	width: 120px;
}

td {
	width: 500px;
}


</style>


</head>

<body>

	<div class="wrapper">
		<header>	
			<div class="header-nav-list">
				<ul class="nav header-nav">
					<li class="nav-item"><a class="nav-link header-nav-link"
						aria-current="page" href="member/join.jsp">회원가입</a></li>
					<span class="nav-bar-line"></span>
					<li class="nav-item"><a class="nav-link header-nav-link"
						href="member/login.jsp">로그인</a></li>
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
					<a href="#"> <img class="header-row-logo ms-4 mb-1" src="/resources/images/logo/logo_white.png" alt="logo_white" /> 
					<img class="header-row-logo_text" src="/resources/images/logo/logo_text.png" alt="logo_text" />
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
					<a href="/cart">
						<div class="header-btn">
							<i class="fa-solid fa-cart-shopping"></i>
						</div>
					</a> <a href="/detail/cart/orderitem">
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
	
	<div class="container">
		<div class="main">
		
			<div class="topbar">
				 <div>
				 	<span class="topbar_title">주문&nbsp;완료</span>
				 </div>
			</div>
			
			<div class="center">
				<div class="center_info">

					<table>
						<tr>
							<th >상품명 :</th>
							<td>${order.order_name}</td>
						</tr>
						<tr>
							<th>결제금액 :</th>
							<td>${order.total_price}</td>
						</tr>
						<tr>
							<th>결제수단 :</th>
							<td>${order.pay_method}</td>
						</tr>
						<tr>
							<th>받는사람 :</th>
							<td>${order.order_receiver}</td>
						</tr>
						<tr>
							<th>주소 :</th>
							<td>${order.order_address}</td>
						</tr>
						<tr>
							<th>연락처 :</th>
							<td>${order.order_tel}</td>
						</tr>
						
						<tr>
							<th>주문번호 :</th>
							<td>${payData.pay_no}</td>
						</tr>	

						<tr>
							<th>주문시간 :</th>
							<td>${payData.pay_date}</td>
						</tr>											
					</table>						
				</div>		
			</div>
		</div>
	</div>
	
	
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
		
	</div>

	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>

</body>
</html>