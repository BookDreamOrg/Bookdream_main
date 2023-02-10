<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- J쿼리 -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- CSS -->
<link href="/resources/css/bookList.css" rel="stylesheet">

<!-- Bootstrap 5.0.2 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

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
			<c:if test="${empty book}"  >
				<div class="text-center mt-5"> 검색된 책이 없습니다. </div>
			</c:if>
			<c:choose>
			<c:when test="${empty search_keyword}">
				<script type="text/javascript">
				alert('키워드를 입력하세요. ');
				</script>

			</c:when>
			<c:otherwise>
				<c:forEach var="book" items="${book}" varStatus="vs">
					<div class="container-fluid mt-3">
						<div class="row" >
							<div class="col-md-3">
								<img alt="${book.title }" src="${book.book_img }" />
							</div>
						<div class="col-md-6 mt-5 pt-2" onclick="location.href='/getBook?book_no=${book.book_no}'">
							<span  id="detail-badge" class="badge bg-primary rounded-pill">${book.book_category }</span>
							<span id="book_title">${book.title }</span>
						<div class="row">
							<div class="col-md-4 mt-2">${book.author }</div>
							<div class="col-md-8 mt-2">
							<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${book.public_date }"/></div>
							<div id="book_content">${book.book_content }</div>
						</div>
						</div>
						<div class="col-md-3  mt-5 pt-5">
							<button type="button" class="btn btn-success" onclick="bookList_cart(this.value)" value="${book.book_no}" >Cart</button> 
							<button type="button" class="btn btn-success" onclick="bookList_buy(this.value)" value="${book.book_no}">Buy</button>
						</div>
					</div>
					</div>	
				</c:forEach>
			</c:otherwise>
			</c:choose>
		
</div>
</main>
		
			<jsp:include page="/views/inc/footer.jsp" />
		
		</div>
	

<script type="text/javascript" >

function bookList_buy(val){
	let user_id = '<%=session.getAttribute("user_id")%>';
	console.log("book_no : " + val + "user_id :  " + user_id)
	if(user_id === null ||user_id === "" || user_id === "null"){
		alert('로그인 페이지로 이동합니다.');
		location.replace("views/user/login.jsp");
	
	}else{
		alert('바로구매');
		location.replace("/detail/cart/orderitem?book_no="+val+"&user_id="+user_id+"&product_count=1&buy_now=Y");
	}
}

function bookList_cart(val){
	alert('장바구니');
	let user_no = '<%=session.getAttribute("user_no")%>';
	console.log("book_no : " + val + "user_no :  " + user_no )
	if(user_no === null ||user_no === "" || user_no === "null"){
		alert('로그인 페이지로 이동합니다.');
		location.replace("views/user/login.jsp");
	}else{
		alert('장바구니');
		location.replace("/itemorder/cart/list?book_no="+val+"&user_no="+user_no+"&product_count=1");
	}
}



</script>
	

	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js"
		crossorigin="anonymous"></script>
		
	<!-- 자동 검색시 필요 (페이지마다 다 넣어줘야 함?)-->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</body>
</html>


