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

<!-- alert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

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
		<div class="book-section">
			<c:if test="${empty book}"  >
			<script type="text/javascript">
				 Swal.fire(
						 '검색된 책이 없습니다.',
				          '',
				          'info'
				 )
				</script>
				<div class="text-center h5 mt-3 mb-5"> 검색된 책이 없습니다. </div>
			</c:if>
			<c:choose>
			<c:when test="${empty search_keyword}">
				<script type="text/javascript">
				 Swal.fire(
						 '키워드를 입력하세요.',
				          '',
				          'info'
				 )
				</script>

			</c:when>
			<c:otherwise>
				<c:forEach var="book" items="${book}" varStatus="status">
					<div class="container-fluid mt-3">
						<div class="row" id="book_row" >
							<div class="col-md-3">
								<span><img alt="${book.title }" src="${book.book_img }" /></span>
							</div>
						<div class="col-md-6 mt-5 pt-2" onclick="location.href='/getBook?book_no=${book.book_no}'" style="cursor:pointer">
							<span  id="detail-badge" >${book.book_category }</span> 
							<span id ="reviewAVG"> </span>
							<span id="book_title"> ${book.title }</span>
						<div class="row">
							<div class="mt-2">
								${book.author } | 
							<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${book.pblic_date }"/>
							</div>
							<div id="book_content"> ${book.book_content }</div>
						</div>
						</div>
						<div class="col-md-3  mt-5 pt-5 text-center">
						<div>
							<button type="button" class="btn btn-outline-primary" onclick="bookList_cart(this.value)" value="${book.book_no}" >장바구니</button> 
						</div>
						<div class="mt-1">
							<button type="button" class="btn btn-outline-primary" onclick="bookList_buy(this.value)" value="${book.book_no}">바로구매</button>
						</div>
						</div>
					</div>
					</div>	
				</c:forEach>
			</c:otherwise>
			</c:choose>		
</div>
<c:if test="${!empty search_keyword}"  >
<div class="mt-5 mb-5 text-center">
	<nav aria-label="Page navigation example" >
		<ul class="pagination justify-content-center">
			<li class="page-item">
				<a class="page-link" onclick="prev()"> &lt; </a>
			</li>
			<c:forEach begin="1" end="${ lastIndex }" var="num">
			<input type="hidden" id="SearchKeyword" value="${search_keyword}">
				<li class="page-item">
					<a class="page-link" id="page_link_${num}" href="bookListSearchByKeyword?num=${num}&keyword=${search_keyword}">${ num }</a>
				</li>
			</c:forEach>
				
			<li class="page-item">
				<a class="page-link" onclick="next()" > &gt; </a>
			</li>
		</ul>
	</nav> 
</div>
</c:if>

</main>
		
			<jsp:include page="/views/inc/footer.jsp" />
		
		</div>
	

<script type="text/javascript" >
$(function(){
	const urlParams = new URL(location.href).searchParams;
	let num = urlParams.get('num');
	const page= 'page_link_';
	
	document.getElementById(page+num).className = 'page-link active';
});

function bookList_buy(val){
	let user_id = '<%=session.getAttribute("user_id")%>';
	console.log("book_no : " + val + "user_id :  " + user_id)
	if(user_id === null ||user_id === "" || user_id === "null"){
		alert('로그인 페이지로 이동합니다.');
		location.replace("views/user/login.jsp");
	
	}else{
		alert('바로구매');
		location.replace("/detail/cart/orderitemBuyNow?book_no="+val+"&user_id="+user_id+"&product_count=1&buy_now=Y");
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


function next(){
	let lastIndex = "<c:out value='${lastIndex}'/>";
	const keyword = "<c:out value='${search_keyword}'/>";
	const urlParams = new URL(location.href).searchParams;
	const num = urlParams.get('num');
	let nextNum = parseInt(num) + 1; // 앞 번호로 가기
	if(num==lastIndex){
		 Swal.fire(
				 '마지막 페이지입니다.',
		          '',
		          'info'
		 )
	}else{
		location.replace("/bookListSearchByKeyword?num="+nextNum+"&keyword="+keyword);
	}
}

function prev(){
	const keyword = "<c:out value='${search_keyword}'/>";
	const urlParams = new URL(location.href).searchParams;
	const num = urlParams.get('num');
	let prevNum = parseInt(num) - 1; // 뒷 번호로 가기
	if(num==1){
		 Swal.fire(
				 '첫번째 페이지입니다.',
		          '',
		          'info'
		 )
	}else{
		location.replace("/bookListSearchByKeyword?num="+prevNum+"&keyword="+keyword);
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


