<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- Favicon -->
    <link
      rel="apple-touch-icon"
      sizes="180x180"
      href="/resources/images/favicon/apple-touch-icon.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="32x32"
      href="/resources/images/favicon/favicon-32x32.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="/resources/images/favicon/favicon-16x16.png"
    />
    <link rel="manifest" href="/resources/images/favicon/site.webmanifest" />
    <link rel="stylesheet" href="/resources/css/styles.css" />
    <link rel="stylesheet" href="/resources/css/admin_screen.css" />
<title>Admin Page</title>
</head>
<body class="admin_body">
	<div class="aside row">
		<div class="aside_logo">
			<img src="/resources/images/logo/logo_text--white.png"
				alt="BookDream" class="aside_logo_img" />
		</div>
		<div class="aside_profile">
			<ul class="list-group">
				<li class="list-group-item">
					<div>
						<img src="/resources/images/logo/logo_white.png"
							alt="user_profile" class="user_profile" />
					</div>
					<span class="list_text">
					<a href="#">관리자</a></span>
				</li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-user"></i></span> <span class="list_text"><a href="#">프로필 관리</a></span></li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-arrow-up-right-from-square"></i></span> <span
					class="list_text"><a href="#">사이트 바로가기</a></span></li>
			</ul>
		</div>
		<div class="aside_product">
			<div class="aside_product_title">제품관리</div>
			<span><i class="fa-regular fa-square-plus"></i></span>
		</div>
		<div class="aside_product_list">
			<ul class="list-group">
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-border-all"></i></span> <span class="list_text"><a href="#">대시보드</a></span>
				</li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-user-gear"></i></span><span class="list_text"><a href="#">사용자 관리</a></span></li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-pen-to-square"></i></span> <span class="list_text"><a href="#">제품 관리</a></span></li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-bullhorn"></i></span> <span class="list_text"><a href="#">결제 관리</a></span></li>
			</ul>
		</div>
		<div class="aside_resource">
			<div class="aside_resource_title">고객지원</div>
			<span><i class="fa-regular fa-square-plus"></i></span>
		</div>
		<div class="aside_resource_list">
			<ul class="list-group">
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-bug"></i></span> <span class="list_text"><a href="#">버그 및 신고</a></span></li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-comment"></i></span> <span class="list_text"><a href="#">문의 사항</a></span>
				</li>
			</ul>
		</div>
		<!-- <div class="thema">
        <div class="thema_color"></div>
        <div class="thema_color_btn">테마변경</div>
      </div> -->
	</div>
	<main class="container-fluid main_container"> <header
		class="shadow-sm">
		<nav class="navbar navbar-expand-xl navbar-light bg-white">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">관리자</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo2"
					aria-controls="navbarTogglerDemo2" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse show" id="navbarTogglerDemo2">
					<ul class="navbar-nav me-auto mb-2 mb-xl-0">
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="/views/main/main.jsp">Logout</a>
						</li>
						<li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">Disabled</a>
						</li>
					</ul>
					<form class="d-flex">
						<input class="form-control me-2" type="search" id="searchUserKeyword" placeholder="Search" aria-label="Search" />
						<button class="btn btn-outline-success" type="button" onclick="searchUser()">Search</button>
					</form>
				</div>
			</div>
		</nav>
	</header>
	<a href="/admin/getAllUserList">유저목록</a>
		<div>
			<table class="table">
				<tr>
					<th>NO</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>포인트</th>
					<th>레벨</th>
					<th>블랙리스트</th>
					<th>타입</th>
					<th>회원 가입일</th>
				</tr>
				<c:forEach var="userList" items="${userAllList }">
					<tr>
						<td>${userList.getUser_no() }</td>
						<td>${userList.getUser_id() }</td>
						<td>${userList.getUser_password() }</td>
						<td>${userList.getUser_name() }</td>
						<td>${userList.getUser_tel() }</td>
						<td>${userList.getUser_email() }</td>
						<td>${userList.getUser_point() }</td>
						<td>${userList.getUser_level() }</td>
						<td>${userList.getBlacklist_yn() }</td>
						<td>${userList.getFlatform_type() }</td>
						<td>${userList.getUser_regdate() }</td>
						
					</tr>
				</c:forEach>
			</table>
		</div>
	</main>

	<script type="text/javascript">
		function searchUser(){
			var searchUserKeyword = $('#searchUserKeyword').val();
			$.ajax({
				type : "POST",
				url : "/admin/getSearchUserList",
				data : {searchUserKeyword : searchUserKeyword},

				success : function(result){	
					console.log(result);
					location.href="/admin/getAllUserList?searchUserKeyword=" + result;
				},
				error : function(){
					alert('서버 에러입니다.');
				}
			});
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