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
<link rel="stylesheet" href="/resources/css/unregister.css" />
<link rel="stylesheet" href="/resources/css/styles.css" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
.side {
	position: relative;
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
	position: relative;
	margin: 0 auto;
	width: 1240px;
	height: auto;
	min-height: 1000px;
}

.user-btn {
	color: var(- -main-color-shadow6);
	font-size: 2rem;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%
		UserVO user = (UserVO) session.getAttribute("authUser");
	%>
	<div class="wrapper">
	<jsp:include page="/views/inc/header.jsp" />

		<div class="container">
			<h1>
				<a href="/views/mypage/edit.jsp">회원정보 관리</a>
			</h1>
		</div>
	</div>

	<jsp:include page="/views/inc/footer.jsp" />
	</div>
	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js"
		crossorigin="anonymous"></script>

	<script>
		let user_no =
	<%=(int) session.getAttribute("user_no")%>
		;
	<%@include file="/resources/js/cartLIstCount.js"%>
	</script>
	
	<!-- 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	
</body>
</html>