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

<title>마이페이지 - 배송조회</title>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/mypage_tracking.css">

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
	
		<div class="main_tracking">
			
			<div class="tracking">

				<div class="tracking_main">
					<div class="tracking_title"><b>주문/배송 목록</b></div>
					<table class="tracking_main_table">
						<tr>
							<td class="tracking_main_table_col1">주문내역</td>
							<td class="tracking_main_table_col2">결제완료<br><span id="tracking_main_table_col2"></span></td>
							<td class="tracking_main_table_col3">배송중<br><span id="tracking_main_table_col3"></span></td>
							<td class="tracking_main_table_col4">배송완료<br><span id="tracking_main_table_col4"></span></td>
							<td class="tracking_main_table_col5">반품/취소<br><span id="tracking_main_table_col5"></span></td>
						</tr>
					</table>
				</div>
			</div>


			
			<div class="trackinglist" id="trackinglist">

			</div>
					
		</div>	
	</div>



 
<!----------------------------------------- 결제취소 -------------------------------------->
	<div class="modal fade" id="pay_cencel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-sm modal-dialog-centered">
   			<div class="modal-content modal_pay_cencel">
      			<div class="modal-header">
       		 		<h5 class="modal-title" id="exampleModalLabel">결제 취소</h5>
       		 		<button type="button" class="btn-close"  data-bs-dismiss="modal" aria-label="Close"></button>
     		 	</div>
      		
      			<div class="modal-body">
 					결제취소를 하시겠습니까?
      			</div>
      			<input type="hidden" id="pay_cencel_order_no">
      			<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="modal_pay_cencel">결제취소</button>         			
	       		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
    		</div>
  		</div>
	</div>

<!----------------------------------------- 반품요청 -------------------------------------->
	<div class="modal fade" id="return_reqeust" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-sm modal-dialog-centered">
   			<div class="modal-content modal_pay_cencel">
      			<div class="modal-header">
       		 		<h5 class="modal-title" id="exampleModalLabel">반품 요청</h5>
       		 		<button type="button" class="btn-close"  data-bs-dismiss="modal" aria-label="Close"></button>
     		 	</div>
      		
      			<div class="modal-body">
 					반품요청을 하시겠습니까?
      			</div>
      			<input type="hidden" id="return_request_order_no">
      			<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="modal_return_request">반품신청</button>         			
	       		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
    		</div>
  		</div>
	</div>


<!----------------------------------------- Modal -------------------------------------->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-lg modal-dialog-scrollable modal-dialog-centered">
   			<div class="modal-content tracking_detail">
      			<div class="modal-header">
       		 		<h5 class="modal-title" id="exampleModalLabel">	상세 조회</h5>
       		 		<button type="button" class="btn-close"  data-bs-dismiss="modal" aria-label="Close"></button>
     		 	</div>
      		
      			<div class="modal-body" id="tracking_detail_list">
 					
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
	
	<script type="text/javascript" src="/resources/js/mypage_tracking.js"></script>
	
	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>	


</body>
</html>