<%@page import="com.spring.bookdream.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- CSS -->
<link href="/resources/css/main.css" rel="stylesheet">


<!-- Bootstrap 5.0.2 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />

<!-- Favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="/resources/images/favicon/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="/resources/images/favicon/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/favicon/favicon-16x16.png" />
<link rel="manifest" href="/resources/images/favicon/site.webmanifest" />
<link rel="stylesheet" href="/resources/css/styles.css" />


<title>Insert title here</title>
</head>
<body>

	<div class="wrapper">
		<jsp:include page="/views/inc/header.jsp" />

		<main>
		<div class="banner">
			<div class="banner-text">Banner Title Text</div>
			<div class="banner-img"></div>
			<div class="banner-books">
				<div class="banner-book"></div>
				<div class="banner-book banner-book-lg"></div>
				<div class="banner-book banner-book-xl"></div>
			</div>
		</div>
		<ul class="nav nav-tabs book-section-nav">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#">베스트</a></li>
			<li class="nav-item"><a class="nav-link" href="#">신상품</a></li>
		</ul>
		<div class="book-section">
			<!---------------------------베스트 셀러 상품 5개-------------------------------->
			<div class="mt-5">
				<span class="h1">베스트셀러</span>
			</div>
			<div id="bestBook" class="mt-3"></div>

			<!---------------------------리뷰 많은 상품 5개-------------------------------->
			<div class="mt-5">
				<span class="h1">리뷰 많은 도서</span>
			</div>
			<div id="bestBookByReviewCount" class="mt-3"></div>

			<!---------------------------평점 높은 상품 5개-------------------------------->
			<div class="mt-5">
				<span class="h1">평점 높은 도서</span>
			</div>
			<div id="bestBookByReviewGrade" class="mt-3"></div>




		</div>
		</main>

		<jsp:include page="/views/inc/footer.jsp" />
	</div>

	<script type="text/javascript" src="/resources/js/main.js"></script>

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