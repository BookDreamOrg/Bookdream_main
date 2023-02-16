<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- bootstrap -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

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
    
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- CSS  -->
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap_icon.css">
      
<title>주문 관리</title>

<style type="text/css">

.container {
	height:auto;
	min-height: 800px;
}


.btn_box {
	position: relative;
	width: 1240px;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 10px;

}
.paging {
	display: inline-block;
}

.paging_btn {
	height: 30px;
	font-size: 12px;

}
.srch_crtr {
	width: 100px;
	height: 30px;
	font-size: 12px;
	display: inline-block;

}

.srch_key {
	width: 150px;
	height: 30px;
	font-size: 12px;
	display: inline-block;	
}

.srch_btn {
	width: 30px;
	height: 30px;
	font-size: 12px;
	margin: 0px 0px 2px -13px;
	text-align: center;
	padding: 0px;	
}

.right {
	float: right;
}

.mngmn_table {
	margin: 0 auto;
	width: 1240px;	
	border: 1px solid black;
}



.mngmn_table th {
	height: 50px;
	text-align:center;
	vertical-align:middle;	
	border-bottom: 1px solid black;
	background-color: #f7f7f7;
	font-size: 14px;
	font-weight: bold;
}

.mngmn_table td {
	height: 70px;
	font-size: 12px;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
}

.mngmn_table tr:nth-child(odd) {
	background-color: #f7f7f7;
}

tr:hover {
	background-color: #ececec;	
}

.mngmn_table_th1 {
	width: 70px;
}

.mngmn_table_th2 {
	width: 140px;
}

.mngmn_table_th3 {
	width: 470px;
}

.mngmn_table_th4, .mngmn_table_th5, .mngmn_table_th6, .mngmn_table_th7 {
	width: 140px;
}

.mngmn_table_col3 {
	line-height: 150%;
	text-align: left;
}

.mngmn_table_col7 {
	font-weight: bold;
}

/*  */


/* ------- */ 
.dtls-box {
	display: none;
	width: 1240px;
	height: 350x;
	margin: 0 auto;	
	margin-top: 20px;

}

.info-box {
	width: 700px;
	height: 300px;
	border: 1px solid black;
	float: left;
}

.info-box_title {
	height: 40px;
	background-color: #f7f7f7;
	text-align: center;
	font-size: 12px;
	padding-top: 14px;
	font-weight: bold;
	border-bottom: 1px solid black;
}

.info-box_ul1 {
	width: 200px;	
	height: 220px;
	margin: 20px 0px 20px 20px;	
	float: left;	

}

.text-left {
	float: left;
	margin: 12px 0px;
}

.text-right {
	width: 90px;
	text-align: right;
}

.info-box_ul1 li:nth-child(odd) {
	font-size: 12px;

}

.info-box_ul1 li:nth-child(even) {
	font-size: 14px;
	font-weight: bold;	
}

.fianl_price {
	font-size: 16px;
	font-weight: bold;
	color: #5c5d99;
}

.info-box_ul1 li {
	width: 90px;
}

.info-box_ul1 hr {
	width: 180px;

}

.info-box_table {
	width: 455px;
	height: 220px;
	margin: 20px 20px 20px 0px;
	float: right;
	border-left: 1px solid #ccc;

}

.info-box_table td {
	vertical-align: middle;		
	font-size: 12px;	
	padding-left: 20px;		
}

.info-box_table th {
	vertical-align: middle;	
	font-size: 12px;
	font-weight: 900;
	padding-left: 20px;		
}

.aprvl_btn {
	width: 100px;
	height: 15px;
	cursor: pointer;
	color: #5c5d99;
	font-weight: bold;
}

/*  */

.table-box-wrap {
	float: right;
	position: relative;
	width: 500px;    
    padding-top: 40px;  
    border: 1px solid black;

}
.table-box-wrap .table-box {
    max-height: 260px;
    overflow: auto;
    overflow-x: hidden;

}

.table-box{
	-ms-overflow-style: none;
}

.table-box::-webkit-scrollbar{
	display:none;
}

.table-box-wrap .table-box table {
    table-layout: fixed;
    border-spacing: 0;
    border-collapse: collapse;
}

.table-box-wrap .table-box table thead tr {
    position: absolute;
    top: 0;
}
.table-box-wrap .table-box table thead tr th {
    background: #f7f7f7;
    height: 40px;    
    font-weight: bold;
    vertical-align: middle;
    text-align: center;	
    border-bottom: 1px solid black;    
}

.table-box-wrap .table-box table thead tr th:nth-child(1) {
	width: 350px;
}

.table-box-wrap .table-box table thead tr th:nth-child(2) {
	width: 50px;
}

.table-box-wrap .table-box table thead tr th:nth-child(3) {
	width: 100px;
}

.table-box-wrap .table-box table td {
    vertical-align: middle;  
    border-top: 1px solid #ccc; 
}

.table-box-wrap .table-box table tbody tr {
   display: table-row;
}

.mngmn_dtls_table {
	font-size: 12px;
}

.mngmn_dtls_table_col1 {
	width: 350px;
	height: 60px;
	text-align: left;
	padding-left: 10px;
	line-height: 150%;
	font-size: 12px;	
}

.mngmn_dtls_table_col2 {
	width: 50px;
	text-align: center;	
}

.mngmn_dtls_table_col3 {
	width: 100px;
	text-align: center;	
}


/* */


</style>

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
					</div> <span class="list_text">관리자</span>
				</li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-user"></i></span> <span class="list_text">프로필
						관리</span></li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-arrow-up-right-from-square"></i></span> <span
					class="list_text">사이트 바로가기</span></li>
			</ul>
		</div>
		<div class="aside_product">
			<div class="aside_product_title">제품관리</div>
			<span><i class="fa-regular fa-square-plus"></i></span>
		</div>
		<div class="aside_product_list">
			<ul class="list-group">
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-border-all"></i></span> <span class="list_text">대시보드</span>
				</li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-user-gear"></i></span> <span class="list_text">사용자
						관리</span></li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-pen-to-square"></i></span> <span class="list_text">콘텐츠
						관리</span></li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-bullhorn"></i></span> <span class="list_text">마케팅
						관리</span></li>
			</ul>
		</div>
		<div class="aside_resource">
			<div class="aside_resource_title">고객지원</div>
			<span><i class="fa-regular fa-square-plus"></i></span>
		</div>
		<div class="aside_resource_list">
			<ul class="list-group">
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-bug"></i></span> <span class="list_text">버그 및
						신고</span></li>
				<li class="list-group-item"><span class="list_icon"><i
						class="fa-solid fa-comment"></i></span> <span class="list_text">문의사항</span>
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
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search" />
						<button class="btn btn-outline-success" type="submit">
							Search</button>
					</form>
				</div>
			</div>
		</nav>
	</header>
	
	
	<div class="container">
		
		<div class="btn_box">
			<div class="paging" id="paging"></div>
			
			<div class="right">
				<select class="form-select srch_crtr" id="srch_crtr" aria-label="Default select example">
				  <option selected value="all">전체</option>
				  <option value="order_no">주문번호</option>
				  <option value="user_id">아이디</option>
				  <option value="order_name">주문명</option>
				  <option value="pay_method">결제수단</option>
				</select>
				
				<input class="form-control srch_key" id="srch_key" type="search" placeholder="Search..." aria-label="Search">
		        <button class="btn btn-primary srch_btn" id="srch_btn" type="button"><i class="bi bi-search"></i></button>
	        </div>
		</div>
		
		<div class="order_mngmn" id="order_mngmn"></div>
		
		<div class="dtls-box" id="dtls-box">
			<div class="info-box" id="info-box"></div>
					
			<div class="table-box-wrap" id="table-box-wrap">
				<div class="table-box" id="table-box"></div>
			</div>
		</div>

		
		
	</div>		
	
	</main>


	<script type="text/javascript" src="/resources/js/order_mngmn.js"></script>
	
	<!-- Script Bootstrap, jqurey-3.6.3 -->
	<script src="/resources/bootstrap/js/jquery-3.6.3.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Script FontAwesome-->
	<script src="https://kit.fontawesome.com/4bf42f841a.js"
		crossorigin="anonymous"></script>
			
</body>
</html>