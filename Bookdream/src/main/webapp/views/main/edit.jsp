<%@page import="com.spring.bookdream.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="/resources/images/favicon/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="/resources/images/favicon/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/favicon/favicon-16x16.png" />
<link rel="manifest" href="/resources/images/favicon/site.webmanifest" />
<link rel="stylesheet" href="/resources/css/styles.css" />

<style>
/* modal */
	.modal {
	position: absolute;
	display: flex;	
	top:0px;
	left:0px;
	width: 100%;
	height: 100%;
	z-index: 1;
}

.modal_open {
	all: unset;
	background-color: blue;
	color: white;
	padding: 5px 20px;
	border-radius: 5px;
	cursor: pointer;
}

.modal_overlay {
	background-color: rgba(0, 0, 0, 0.6);
	width: 100%;
	height: 100%;
	position: fixed;
	
}

.modal_content {
  	position: fixed; 	
	top: 50%;
  	left: 50%;
  	transform: translate(-50%, -50%);
	
	width:620px;
	height:850px;
	
	padding: 50px 50px;
	background-color:white;	
	border: 2px solid black;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
}
	.modal.hidden {
	display: none;
}

.modal_title {
	font-size: 25px;
}

.modal_close {
	font-size: 20px;
	float: right;
	cursor: pointer;
}

/* password */
.pw_ok{
			color:#008000;
			display: none;
		}
		
		.pw_no{
			color:#6A82FB;
			display : none;
		}
</style>

<title>회원정보 수정</title>
</head> 
<body>
	<% 
		int book_no = (int) (Math.random() * 100) + 1;
	%>
	
	<%
		UserVO user = (UserVO)session.getAttribute("authUser");
	
		if(user == null){		
	%>
		<div class="wrapper">
		<header>
			<div class="header-nav-list">
				<ul class="nav header-nav">
					<li class="nav-item"><a class="nav-link header-nav-link"
						aria-current="page" href="/views/user/join.jsp">회원가입</a></li>
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
	<% 
		} else{ // 로그인 시
	%>
		<div class="wrapper">
		<header>
			<div class="header-nav-list">
				<ul class="nav header-nav">
					<%
						if(user.getFlatform_type().equals("KAKAO")){ //기존 로그아웃
					%>
						<li class="nav-item"><a class="nav-link header-nav-link"
						href="https://kauth.kakao.com/oauth/logout?client_id=47ad839005d8b9a94d3007b30a956894&logout_redirect_uri=http://localhost:8000/views/user/kakaoLogout">로그아웃</a></li>
					<span class="nav-bar-line"></span>
					<% 
						} else { // 카카오 로그아웃
					%>
						<li class="nav-item"><a class="nav-link header-nav-link"
						href="/views/user/logout.do">로그아웃</a></li>
					<span class="nav-bar-line"></span>
					<% 
						}
					%>
					
					<li class="nav-item"><a class="nav-link header-nav-link"
						href="#">고객센터</a>
					</li>
					<span class="nav-bar-line"></span>
					<li class="nav-item"><a class="nav-link header-nav-link"
						href="/views/main/mypage.jsp">마이페이지</a></li>
					<span class="nav-bar-line"></span>
					<li class="nav-item"><a
						class="nav-link header-nav-link disabled" href="#" tabindex="-1"
						aria-disabled="true"> 관리자 </a>
					</li>
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
					<a href="">
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
	<%
		}
	%>
	
		</header>
		<div class="container">
			<div class="user_info">
				<div class="user_info_update">회원정보 수정</div>
				<button class="user_info_button" id="user_info_button" onclick="modal_open()">회원정보 수정</button>
			</div>
			
			<div class="modal hidden" id="modal">
				<div class="modal_overlay" id="modal_overlay"></div>
				<div class="modal_content" id="modal_content">
					<span class="modal_title">회원정보 수정</span>
					<button class="btn-close modal_close" id="modal_close" onclick="modal_close()"></button>
				<hr class="hr_title">
			<div>
				
					<table class="table table-board">
					<tr>
						<td>아이디</td>
						<td><input type="text" disabled class="form-control" id="user_id" name="user_id" value="<%= user.getUser_id() %>"></td>
					<tr>
					<tr>
						<td>새 비밀번호</td>
						<td><input type="password" class="form-control" id="user_password" name="user_password" onchange="PasswordCheck()"></td>
					<tr>
					<tr>
						<td>새 비밀번호 확인</td>
						<td><input type="password" class="form-control" id="user_passwordcheck" name="user_passwordcheck" onchange="PasswordCheck()"></td>
					<tr>
					<tr>
						<td></td>
						<td>
							<div>
			     				<span class="pw_ok">비밀번호가 일치합니다!</span>
			     				<span class="pw_no">비밀번호가 일치하지 않습니다!</span>
			     			</div>
		     			</td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="input" class="form-control" id="user_name" name="user_name" value="<%= user.getUser_name() %>"></td>
					<tr>
					<tr>
						<td>이메일</td>
						<td><input type="input" class="form-control" id="user_email" name="user_email" value="<%= user.getUser_email() %>"></td>
					<tr>
					
				</table>
			
				<div class="d-grid gap-2">
					<button type="button" class="btn btn-light " id="modal_reg_check" onclick="updateUser()">저장</button>
				</div>
			</div>	
			</div>
			
			
	</div>
			
			<script>
			// 회원정보 수정 창 열기
			function modal_open() {
			    $('#modal').fadeIn();		
			}
			
			// 회원정보 수정 창 닫기
			function modal_close() {
			    $('#modal').fadeOut();		
			}
			
			function updateUser(){
				var id = $('#user_id').val();
				var password = $('#user_password').val();
				var password_check = $('#user_passwordcheck').val();
				var name = $('#user_name').val();
				var email = $('#user_email').val();
				
				$.ajax({
					url : '/mypage/updateUser',
					type : 'post',
					data : {id:id,
							password:password,
							password_check:password_check,
							name:name,
							email:email},
					success:function(data){
						console.log(data);
						if(data === "error"){
							alert('입력칸을 확인해주세요!');
						}
						else if(data === "password_error"){
							alert('비밀번호가 달라요!');
						}
						else{
							$('#modal').fadeOut();
							document.location.href(data);
						}
						
					}, 
					error:function(){
						alert('서버 에러입니다.');
					}		
				});
				
			}		
			
			function PasswordCheck(){
				 var pw = $('#user_password').val();
			     var pwCheck = $('#user_passwordcheck').val(); 
			     
					if(pw != pwCheck){ // 비밀번호가 일치하지 않는다면
						$('.pw_no').css("display","inline-block");
						$('.pw_ok').css("display", "none");
					} else{ // 비밀번호가 일치한다면
						$('.pw_no').css("display","none");
						$('.pw_ok').css("display", "inline-block");
					}
			 };
			</script>

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
	<script src="https://kit.fontawesome.com/4bf42f841a.js"
		crossorigin="anonymous"></script>
		
	
</body>
</html>