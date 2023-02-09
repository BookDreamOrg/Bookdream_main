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
		.side {
			   position:relative;
			   width: 220px;
			   min-height: 500px;
			   margin-top: 130px;
			   border-radius: 20px;
			   float: left;
			   background-color: #d1d1e5;
			   text-align: center;
			}		
	
		.main {
	   line-height: 180%;
	   position:relative;
	   margin: 0 auto;
	   width: 1240px;
	   height: auto;
	   min-height: 1000px;
		}
		
		.user-btn {
		  color: var(--main-color-shadow6);
		  font-size: 2rem;
		}
	</style>
<title>Insert title here</title>
</head> 
<body>
	<jsp:include page="/views/inc/header.jsp" />

			
			<div class="container">
				
				<div class="main">
					
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">회원탈퇴</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <div>
					        	회원탈퇴 시 개인정보 및 BookDream에서 제공되는 서비스가 중단됩니다....
					        	@@ 비밀번호 재확인 로직 추가
					        </div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary">회원탈퇴</button>
					      </div>
					    </div>
					  </div>
					</div>
					
					<!-- side -->
				<div class="side">
					<div class="user_btn"><i class="fa-solid fa-user"></i></div>
					<div><a href="/views/mypage/mypage.jsp">${authUser.getUser_name() }</a>님 환영합니다.</div>
					<h1><a href="/mypage/edit">회원정보 관리</a></h1>
					<!-- Button trigger modal -->
					<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
					  회원탈퇴
					</button>
					
					<div><a href="/mypage/address">배송지 관리</a></div>
					<div><a href="/mypage/tracking">배송 조회</a></div>
					<div><a href="#">나의 구매내역</a></div>
					<div><a href="/mypage/getMyQnAList">1:1문의</a></div>
					<div><a href="#">상품문의</a></div>
					
				</div>	
					
				</div>
				
				
			</div>
			
		<jsp:include page="/views/inc/footer.jsp" />

	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js"
		crossorigin="anonymous"></script>
</body>
</html>