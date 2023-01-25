<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<title>결제/주문 페이지</title>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Tosspay api -->
<script src="https://js.tosspayments.com/v1/payment"></script>

<!-- Iamport api -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<!-- 주소찾기 api-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/orderitem.css">
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
	
	<!-- !!!!!!!!!!!!!!!!!!!!!  Modal  !!!!!!!!!!!!!!!!!!!!! -->		
	
	<div class="modal hidden" id="modal">
		<div class="modal_overlay" id="modal_overlay"></div>
		<div class="modal_content" id="modal_content">
			<span class="modal_title">배송지 변경</span>
			<span class="btn-close modal_close" id="modal_close"></span>

			<hr class="hr_title">
			<div>
				<div class="modal_address_insert">
					<div class="d-grid gap-2">
						<button class="btn btn-outline-dark" type="button" id="modal2_open"><i class="bi bi-plus-lg"></i>&nbsp;&nbsp;배송지 입력하기</button>
					</div>
				</div>
				
				<div class="moadl_address_list" id="moadl_address_list">
					<div id="root"></div>
				</div>
				
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" id="default_address_check">
  					<label class="form-check-label" for="default_address_check">기본 배송지로 설정</label>
				</div>
				
				<div class="d-grid gap-2">
					<button type="button" class="btn btn-light " id="modal_reg_check">저장</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- !!!!!!!!!!!!!!!!!!!!!  주소입력창  !!!!!!!!!!!!!!!!!!!!! -->
	
	<div class="modal2 hidden" id="modal2">
		<div class="modal2_content">
			<span class="modal_title">주소 입력</span>
			<span class="btn-close modal_close" id="modal2_close"></span>		

			<hr class="hr_title">
			
			<div class="mb-3">
  				<label for="moadl2_address_alias" class="form-label">배송지 이름</label>
  				<input class="form-control" id="moadl2_address_alias" name="moadl2_address_alias" placeholder="배송지 이름을 입력해주세요.">
			</div>		


			<div class="mb-3">
  				<label for="moadl2_address_name" class="form-label">받는 사람</label>
  				<input class="form-control" id="moadl2_address_name" name="moadl2_address_name" placeholder="이름을 입력해주세요.">
  				<br>
  				<input class="form-control" id="moadl2_address_tel" name="moadl2_address_tel" placeholder="휴대번호를 -없이 입력해주세요.">
			</div>				

			<div class="d-grid gap-2 address_search">
				<button class="btn btn-outline-dark" onclick="execDaumPostcode()"><i class="bi bi-search"></i>&nbsp;&nbsp;주소찾기</button>
			</div>

			<div class="mb-3">
  				<input class="form-control" id="zonecode" name="moadl2_address_zonecode" placeholder="우편번호" readonly>
  				<br>
  				<input class="form-control" id="roadAddr" name="moadl2_address_roadAddr" placeholder="도로명주소" readonly>
  				<span  id="guide" style="color: #999; display: none"></span>
  				<br>
  				<input class="form-control" id="detailAddress" name="moadl2_address_detailAddress" placeholder="상세주소" >
				<input type="hidden" id="extraAddress" placeholder="참고항목" readonly="readonly">			
				<input type="hidden" id="modal2_address_no" name="modal2_address_no">	
			</div>					

			<div class="d-grid gap-2 address_save">
				<button class="btn btn-light" id="modal2_address_insert">저장</button>
				<button class="btn btn-light" id="modal2_address_update">수정</button>				
			</div>					
				
		</div>
	</div>
	
	<!-- !!!!!!!!!!!!!!!!!!!!!  배송요청사항  !!!!!!!!!!!!!!!!!!!!! -->
	
	<div class="modal3 hidden" id="modal3">
		<div class="modal3_overlay" id="modal3_overlay"></div>
		<div class="modal3_content" id="modal3_content">
			<span class="modal_title">배송요청사항</span>
			<span class="btn-close modal_close" id="modal3_close"></span>

			<hr class="hr_title">
			
			<div>
				<select class="form-select" id="message_select" onchange="select_message(this.value)">
  					<option selected>배송요청사항을 입력해주세요.</option>
					<option value="배송 전에 미리 연락 바랍니다.">배송 전에 미리 연락 바랍니다.</option>
 					<option value="부재시 경비실에 맡겨 주세요.">부재시 경비실에 맡겨 주세요.</option>
 					<option value="부재시 전화 주시거나 문자 남겨 주세요.">부재시 전화 주시거나 문자 남겨 주세요.</option>
 					<option value="message">요청사항을 직접 입력합니다.</option>
				</select>
				
			<div class="mb-3">
  				<input class="form-control message_insert" id="message" placeholder="요청사항을 직접 입력시 활성화 됩니다." disabled>
			</div>					
	
			<div class="d-grid gap-2 ">
				<button class="btn btn-light" id="message_save">저장</button>			
			</div>		
						
			</div>
	

		</div>
	</div>	
	
	
	<div class="main">
	
	<!-- !!!!!!!!!!!!!!!!!!!!!  상단바  !!!!!!!!!!!!!!!!!!!!! -->	
	
		<div class="topbar">
			<span class="topbar_title">주문&nbsp;/&nbsp;결제</span>
		</div>
	
	<!-- !!!!!!!!!!!!!!!!!!!!!  상품목록  !!!!!!!!!!!!!!!!!!!!! -->	
			
		<div class="cart_list">
			<div class="title">
				<span>주문상품</span>
				<!-- 상품의 총 개수  -->
				<span class="cart_list_count">
					총&nbsp;<c:out value="${orderitemCount.total_count }"/>개	
				</span>

			</div>
			
			<hr>				
			
			<div>

				<form action="">
					<table>
						<c:forEach items="${orderitemList}" var="orderitem" varStatus="i">					
							<tr>
								<td class="col1"><a href="/getBook?book_no=${orderitem.bookVO.book_no}"><img class="col_img" alt="" src="${orderitem.bookVO.book_img }"></a></td>					
								<td class="col2">${ orderitem.bookVO.title }</td>
								<td class="col3"><b><fmt:formatNumber value="${orderitem.bookVO.book_price}" pattern="###,###"/></b> 원</td>
								<td class="col4">${ orderitem.product_count }개</td>
								<c:if test="${!i.last}">
								</c:if>	
							</tr>
																									
						</c:forEach>
					</table>
				</form>
				

						
			</div>	
		</div>
		
	<!-- !!!!!!!!!!!!!!!!!!!!!  사이드바 - 결제  !!!!!!!!!!!!!!!!!!!!! -->	
	
		<div class="sidebar" >
			<div class="sidebar_col">
				<span class="">상품금액</span>
				<span class="sidebar_col_price"><b id="sidebar_total_price"><fmt:formatNumber value="${orderitemCount.total_price}" pattern="###,###"/></b> 원</span>
			</div>
			
			<div class="sidebar_col">
				<span>배송비</span>
				<c:set var="delivery" value="3000" />
				<c:choose>
					<c:when test="${orderitemCount.total_price ge 30000 }">
						<c:set var="delivery" value="0" />					
						<span class="sidebar_col_price">(+) <b id="sidebar_delivery">0</b> 원</span>						
					</c:when>
					<c:otherwise>
						<span class="sidebar_col_price">(+) <b id="sidebar_delivery"><fmt:formatNumber value="${delivery}" pattern="###,###"/></b> 원</span>				
					</c:otherwise>
				</c:choose>	
			</div>
							
			<div id="sidebar">

			</div>
		
			<div class="payment">
				<button class="pay_button" id="pay_button">결제하기</button>
			</div>
		</div>		

	
		<!--  !!!!!!!!!!!!!!!!!!!!! 배송지 정보 !!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		
		<div class="user_info"> 
			<div class="title">배송지 정보	</div>
			<div class="user_info_address" id="user_info_address"></div>				
			
			<hr>			
			
			<div class="title">배송요청사항</div>
			<button class="user_info_button" id="user_info_button" onclick="modal3_open()"><span>요청사항 메시지</span></button>
			<div class="user_info_message" id="user_info_message">
				<div id="user_info_message_text"></div>
				<button class="btn btn-outline-dark message_button" onclick="modal3_open()"><i class="bi bi-pencil-square"></i></button>
			</div>
		</div>
		
		<!-- !!!!!!!!!!!!!!!!!!!!! 할인  !!!!!!!!!!!!!!!!!!!!! -->	
		
		<div class="event"> 
			<div class="title">쿠폰할인</div>
			<div class="event_text"><i class="bi bi-exclamation-circle"></i>&nbsp;사용할 수 있는 쿠폰이 없습니다.</div>		

			<hr>

			<div class="title">포인트</div>
			
			<span class="mb-3 event_point"><input class="form-control event_input" type="text" id="use_point" name="" value="0"></span>
			
			<span class="event_input_text">사용 가능한 포인트 : <fmt:formatNumber value="${userPoint.userVO.user_point}" pattern="###,###"/>P
				<span class="form-check">  					
					<input class="form-check-input" type="checkbox" id="max_point" value="${userPoint.userVO.user_point}">
  					<label class="form-check-label" for="max_point">최대 포인트 사용하기</label>		
  				</span>
			</span>		
			
		</div>
		
		<!-- !!!!!!!!!!!!!!!!!!!!! 결제수단  !!!!!!!!!!!!!!!!!!!!! -->	
		
		<div class="pay">
			<div class="title">결제수단</div>
			<hr>


				<div class="pay_select">
					<div>
						<label for="pay_hide"><input class="form-check-input" type="radio" id="pay_hide" name="pay_select" onclick="pay_hide();" checked="checked"><span>&nbsp;드림페이 결제</span></label>
					</div>
					
					<br>
					
					<div>
						<label for="pay_show"><input class="form-check-input" type="radio" id="pay_show" name="pay_select" onclick="pay_show();"><span>&nbsp;다른 결제 수단</span></label>
					</div>
				</div>
			
			<div class="pay_labels" id="pay_labels">
				<label for="pay_radio1"><input type="radio" id="pay_radio1" name="pay_radio" value="CARD"><span class="pay_lable">신용카드</span></label>
				<label for="pay_radio2"><input type="radio" id="pay_radio2" name="pay_radio" value="TOSSPAY"><span class="pay_lable">토스페이</span></label>
				<label for="pay_radio3"><input type="radio" id="pay_radio3" name="pay_radio" value="VIRTUAL_ACCOUNT"><span class="pay_lable">가상계좌</span></label>
				<label for="pay_radio4"><input type="radio" id="pay_radio4" name="pay_radio" value="TRANSFER"><span class="pay_lable">계좌이체</span></label>
				<label for="pay_radio5"><input type="radio" id="pay_radio5" name="pay_radio" value="MOBILE_PHONE"><span class="pay_lable">휴대폰</span></label>
				<label for="pay_radio6"><input type="radio" id="pay_radio6" name="pay_radio" value="CULTURE_GIFT_CERTIFICATE"><span class="pay_lable">문화상품권</span></label>
				<label for="pay_radio7"><input type="radio" id="pay_radio7" name="pay_radio" value="BOOK_GIFT_CERTIFICATE"><span class="pay_lable">도서문화상품권</span></label>
				<label for="pay_radio8"><input type="radio" id="pay_radio8" name="pay_radio" value="GAME_GIFT_CERTIFICATE"><span class="pay_lable">게임문화상품권</span></label>		
			</div>
		</div>
	</div>
	</div>

	
	<!-- JS 전송 -->	
	<!-- 상품의 종류가 2개 이상일 경우 첫번째 상품이름 + 나머지 종류의 개수  -->
	<c:choose>
		<c:when test="${fn:length(orderitemList) != 1}">
			<c:set var="first_title" value="${orderitemList[0].bookVO.title} 외  ${orderitemCount.col_count - 1} 종"></c:set>
		</c:when>		
		<c:otherwise >
			<c:set var="first_title" value="${orderitemList[0].bookVO.title}"></c:set>
		</c:otherwise>
	</c:choose>	
	<input type="hidden" id ="first_title" name="first_title" value="<c:out value="${first_title}"/>">
	
	<!--  -->
	
	
	
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
	
	<script type="text/javascript" src="/resources/js/orderitem.js"></script>

	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js" crossorigin="anonymous"></script>

</body>

</html>