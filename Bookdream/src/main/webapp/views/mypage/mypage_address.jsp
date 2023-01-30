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

<title>마이페이지 - 주소록</title>

<!-- 주소찾기 api-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

<style type="text/css">

.wrapper {
	height: auto;
}

.main {
	position:relative;
	margin: 0 auto;
	width: 1240px;
	height: auto;
	min-height: 1000px;
	border: 1px solid black;	
}

.side {
	position:relative;
	width: 200px;
	height: 500px;
	border: 1px solid black;
	float: left;
}

.address {
	position: relative;
	width: 950px;
	height: 300px;
}

.address_title {
	height: 50px;
	border: 1px solid black;
}

.address_main {
	height: 200px;
	border: 1px solid black;
}

.address_sub {
	height: 50px;
	border: 1px solid black;		
}

.main_address {
	height: auto;
	min-height: 1000px;
	float: right;
	border: 1px solid black;		
}

.addresslist {
	height:auto;
	min-height: 500px;
	border: 1px solid black;		
}

.addresslist_table {
	width: 100%;
	height: 150px;
	border: 1px solid black;
}

.addresslist_table_col1 {
	vertical-align:middle;
	text-align:center;
	width: 100px;
}

.addresslist_table_col2 {
	vertical-align:middle;
}

.addresslist_table_col3 {
	vertical-align:middle;
	text-align:center;
	width: 100px;

}

.address_insert_content {
	height: 700px;
}
</style>


<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

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
						href="/views/user/login.jsp">로그인</a></li>
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
	
	<div class="main">
		<div class="side"></div>
	
		<div class="main_address">
			
			<div class="address">
				<div class="address_title">배송주소록</div>
				<div class="address_main" id="address_main"></div>
				<div class="address_sub">기본 배송지는 삭제 불가합니다.</div>
			</div>

			<div class="addresslist">
				<span class="addresslist_title"><button type="button" class="btn btn-primary" id="modal_open" data-bs-toggle="modal" data-bs-target="#exampleModal">배송지 입력하기</button></span>	
				<div class="addresslist_main" id="addresslist_main">배송지 들어갈것.</div>
			</div>
			
			<div class="address_default">
				<input type="checkbox" id="address_default_check">
				<label class="" for="address_default_check">기본 배송지로 설정</label>
			</div>
			
			<div class="address_change">
				<button id="address_change_button" disabled="disabled">기본 배송지 변경하기</button>
			</div>
					
		</div>	
	</div>
	
	
	<!----------------------------------------- Modal -------------------------------------->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog  modal-dialog-centered">
   			<div class="modal-content address_insert_content" id="modal-backdrop">
      			<div class="modal-header">
       		 		<h5 class="modal-title" id="exampleModalLabel">배송지 입력하기</h5>
       		 		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
     		 	</div>
      		
      			<div class="modal-body">
 					<div class="mb-3">
  						<label for="address_alias" class="form-label">배송지 이름</label>
  						<input class="form-control" id="address_alias" name="address_alias" placeholder="배송지 이름을 입력해주세요.">
					</div>		

					<div class="mb-3">
  						<label for="address_name" class="form-label">받는 사람</label>
  						<input class="form-control" id="address_name" name="address_name" placeholder="이름을 입력해주세요.">
  						<br>
  						<input class="form-control" id="address_tel" name="address_tel" placeholder="휴대번호를 -없이 입력해주세요.">
					</div>				

					<div class="d-grid gap-2 address_search">
						<button class="btn btn-outline-dark" onclick="execDaumPostcode()"><i class="bi bi-search"></i>&nbsp;&nbsp;주소찾기</button>
					</div>

					<div class="mb-3">
  						<input class="form-control" id="zonecode" name="address_zonecode" placeholder="우편번호" readonly>
  						<br>
  						<input class="form-control" id="roadAddr" name="address_roadAddr" placeholder="도로명주소" readonly>
  						<span  id="guide" style="color: #999; display: none"></span>
  						<br>
  						<input class="form-control" id="detailAddress" name="address_detailAddress" placeholder="상세주소" >
						<input type="hidden" id="extraAddress" placeholder="참고항목" readonly="readonly">			
						<input type="hidden" id="address_no" name="address_no">	
					</div>      
      			</div>

     		    <div class="d-grid gap-2 address_save">
					<button class="btn btn-light" data-bs-dismiss="modal" id="modal_address_insert">저장</button>
					<button class="btn btn-light" data-bs-dismiss="modal" id="modal_address_update">수정</button>				
				</div>	
     		    
     		    
    		</div>
  		</div>
	</div>
	
		
	<footer>
		<div>
			<a class="footer-logo" href="#"> 
				<img class="footer-logo-img" src="/resources/images/logo/logo_white.png" alt="logo_white" /> 
				<img class="footer-logo-text" src="/resources/images/logo/logo_text--white.png" alt="logo_text--white" />
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
	
	
	<script type="text/javascript" src="/resources/js/mypage_address.js"></script>
	
	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>	

	




</body>
</html>